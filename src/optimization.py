import logging
import os
import yaml

from typing import Iterable, List, Optional, Union
from shutil import copy

import fides
import pandas as pd
import petab
import petab.v1.visualize
import pypesto
import pypesto.optimize
import pypesto.petab

from pypesto.store import OptimizationResultHDF5Reader, \
    OptimizationResultHDF5Writer, ProblemHDF5Writer, ProblemHDF5Reader, \
    ProfileResultHDF5Writer, write_result, ProfileResultHDF5Reader
from utils import (_model_import, create_pypesto_problem, read_optimization_results)


def sample_startpoints(amici_model, petab_problem, base_dir, results_dir,
                       n_starts, tolerances, pf: str = '',
                       hierarchical: bool = False):
    pypesto_problem, startpoint_method, _ = create_pypesto_problem(
        base_dir, amici_model, petab_problem, tolerances,
        hierarchical=hierarchical)

    startpoints = startpoint_method(
        n_starts=n_starts,
        problem=pypesto_problem,
    )

    startpoints = [pypesto_problem.get_full_vector(x) for x in
                   startpoints]
    startpoints_df = pd.DataFrame(data=startpoints,
                                  columns=pypesto_problem.x_names)
    startpoints_df.to_csv(
        os.path.join(results_dir, f'parameter_startpoints_{n_starts}{pf}.tsv'),
        sep='\t', index=False)


def optimize(amici_model,
             petab_problem: petab.v1.Problem,
             base_dir: str,
             results_dir: str,
             tolerances: dict,
             optimize_config: dict,
             parameter_startpoints_path: Optional[str] = None
             ):
    file_name = 'result.h5'
    save_histories = optimize_config['optimizer']['optimizer_options'].get(
        'save_histories', True)

    if save_histories:
        os.makedirs(os.path.join(results_dir, 'histories'), exist_ok=True)

    pypesto_problem, startpoint_method, _ = create_pypesto_problem(
        base_dir, amici_model, petab_problem, tolerances)

    if parameter_startpoints_path:
        startpoints = pd.read_csv(parameter_startpoints_path, sep='\t')
        pypesto_problem.set_x_guesses(startpoints)
        n_starts = startpoints.shape[0]
    else:
        n_starts = optimize_config['n_optimizations']

    history_filename = 'hist_'
    history_options = pypesto.HistoryOptions(
        trace_record=True,
        trace_record_grad=True,
        trace_record_res=True,
        storage_file=os.path.join(results_dir,
                                  'histories',
                                  history_filename + file_name)
    ) if save_histories else None

    optimizer_options = {
        'maxiter': optimize_config['optimizer']['optimizer_options'].get(
            'maxiter', 1e3)}
    fides_optimizer = pypesto.optimize.FidesOptimizer(
            hessian_update=fides.BFGS(),
            options=optimizer_options
        )

    if optimize_config['optimizer']['name'] == 'sacess':
        ess_init_args = pypesto.optimize.ess.get_default_ess_options(
            num_workers=optimize_config['optimizer']['optimizer_options'][
                'n_workers'],
            dim=pypesto_problem.dim)
        for x in ess_init_args:
            x['local_optimizer'] = fides_optimizer
        optimizer = pypesto.optimize.SacessOptimizer(
            max_walltime_s=optimize_config['optimizer']['optimizer_options'][
                'max_walltime_s'],
            sacess_loglevel=logging.DEBUG,
            ess_loglevel=logging.DEBUG,
            ess_init_args=ess_init_args,
        )
        minimize_result = optimizer.minimize(
            problem=pypesto_problem,
            startpoint_method=startpoint_method
        )
    else:
        n_procs = optimize_config['n_procs']
        if n_procs > 1:
            engine = pypesto.engine.MultiProcessEngine(n_procs=n_procs)
            print(f"MultiProcessEngine, number of processes: {n_procs}")
        else:
            history_filename += '{id}_'
            engine = pypesto.engine.SingleCoreEngine()
            print("SingleCoreEngine")

        optimizer = fides_optimizer

        minimize_result = pypesto.optimize.minimize(
            problem=pypesto_problem,
            optimizer=optimizer,
            n_starts=n_starts,
            engine=engine,
            startpoint_method=startpoint_method,
            history_options=history_options
        )

    summary = minimize_result.optimize_result.summary()
    with open(os.path.join(results_dir, "summary.txt"), "w") as text_file:
        text_file.write(summary)

    result_file_name = os.path.join(results_dir, file_name)
    problem_writer = ProblemHDF5Writer(result_file_name)
    problem_writer.write(pypesto_problem, overwrite=True)
    opt_result_writer = OptimizationResultHDF5Writer(result_file_name)
    opt_result_writer.write(minimize_result, overwrite=True)


if __name__ == "__main__":
    base_dir = '../model'
    config_path = os.path.join(base_dir, 'config.yaml')
    with open(config_path, 'r') as file:
        config = yaml.safe_load(file)

    model_name = config['model_name']
    petab_dir = os.path.join(base_dir, 'petab')
    yaml_file = os.path.join(petab_dir, config['petab_model_yaml'])
    results_dir = os.path.join(base_dir, 'results')
    figures_dir = os.path.join(results_dir, 'figures')

    os.makedirs(figures_dir, exist_ok=True)

    model, model_petab_problem = _model_import(
        base_dir=base_dir,
        yaml_file=yaml_file,
        model_name=model_name,
        force_compile=True
    )

    sample_startpoints(model, model_petab_problem, base_dir, results_dir,
                       config['optimize']['n_optimizations'],
                       config['tolerances'])

    copy(config_path, results_dir)
    optimize(
        model, model_petab_problem, base_dir,
        results_dir,
        tolerances=config['tolerances'],
        optimize_config=config['optimize'],
        parameter_startpoints_path=os.path.join(
            results_dir,
            f"parameter_startpoints_{config['optimize']['n_optimizations']}.tsv"))

