import logging
import os
import yaml

from pathlib import Path
from typing import Iterable, List, Optional, Union
from shutil import copy

import amici
import amici.petab
import amici.petab.simulations
import fides
import numpy as np
import pandas as pd
import petab
import petab.v1.visualize
import pypesto
import pypesto.optimize
import pypesto.petab
import pypesto.profile as profile
import scipy as sp

from pypesto.store import OptimizationResultHDF5Reader, \
    OptimizationResultHDF5Writer, ProblemHDF5Writer, ProblemHDF5Reader, \
    ProfileResultHDF5Writer, write_result, ProfileResultHDF5Reader
from utils import (_model_import, _setup_amici, create_pypesto_problem, get_best_parameters,
                   read_optimization_results)
from visualization import (plot_residuals, visualize_fit, visualize_optimization_result,
                           visualize_profiles)


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


def save_best_100(opt_result, fname):
    opt_result.optimize_result.list = opt_result.optimize_result.list[:100]

    write_result(
        opt_result, fname,
        problem=opt_result.problem is not None,
        optimize=True)


def simulate_w_best_parameter(amici_model,
                              petab_problem: petab.v1.Problem,
                              petab_dir: str,
                              tolerances: dict,
                              result_path: str,
                              p_index: int = 0,
                              type: str = ''):

    results = read_optimization_results(result_path)
    p_vect = results.optimize_result.x[p_index]
    p_vect = results.problem.get_full_vector(p_vect,
                                             results.problem.x_fixed_vals)

    amici_model, solver = _setup_amici(amici_model, tolerances)

    parameters = dict(zip(results.problem.x_names, p_vect))

    if hasattr(results.problem, 'inner_x_names'):
        innter_x_names = list(map(lambda x: x.decode('utf-8'),
                                  results.problem.inner_x_names))
        parameters.update(
            dict(zip(innter_x_names,
                     results.optimize_result.list[0].inner_parameters)))

    if type == 'smooth':
        measurement_df = petab_problem.measurement_df
        extended_measurements_df = pd.read_csv(
            os.path.join(petab_dir, 'measurements_smooth.tsv'),
            sep='\t'
        )
        petab_problem.measurement_df = extended_measurements_df

        simulation_result = amici.petab.simulations.simulate_petab(
            petab_problem, amici_model, solver,
            problem_parameters=parameters,
            scaled_parameters=True
        )

        sim_df = amici.petab.simulations.rdatas_to_simulation_df(
            rdatas=simulation_result['rdatas'],
            model=amici_model,
            measurement_df=petab_problem.measurement_df)
        petab.write_simulation_df(sim_df,
                                  os.path.join(os.path.dirname(result_path),
                                               f'simulation_{p_index}',
                                               'simulation_smooth.tsv'))
        petab_problem.measurement_df = measurement_df

    else:
        simulation_result = amici.petab.simulations.simulate_petab(
            petab_problem, amici_model, solver,
            problem_parameters=parameters,
            scaled_parameters=True
        )

        sim_df = amici.petab.simulations.rdatas_to_simulation_df(
            rdatas=simulation_result['rdatas'],
            model=amici_model,
            measurement_df=petab_problem.measurement_df)

        pfx = f"_{type}" if type else ""
        petab.v1.write_simulation_df(sim_df,
                                  os.path.join(os.path.dirname(result_path),
                                               f'simulation_{p_index}',
                                               f'simulation{pfx}.tsv'))


def simulate_and_visualize(model_name: str,
                           amici_model,
                           petab_problem: petab.v1.Problem,
                           tolerances: dict,
                           petab_dir: str,
                           figures_dir: str,
                           results_dir: str,
                           type: str = ''): # can be smooth, extended, validation, in_silico

    # Figure 2,a
    visualize_optimization_result(results_dir, figures_dir, model_name)

    for i in range(1):
        simulation_folder = os.path.join(results_dir, f'simulation_{i}')
        os.makedirs(figures_dir, exist_ok=True)
        simulate_w_best_parameter(amici_model, petab_problem, petab_dir,
                                  tolerances,
                                  os.path.join(results_dir, 'result.h5'),
                                  p_index=i,
                                  type=type)

        simu_fn = f'simulation_{type}.tsv' if type else 'simulation.tsv'
        visualize_fit(petab_problem,
                     os.path.join(simulation_folder, simu_fn),
                     os.path.join(simulation_folder, type) if type else simulation_folder,
                     visu_spec=os.path.join(petab_dir,
                                            'visualizationSpecification_PKAcycleMOR.tsv'))

    # Figure 2,b
    plot_residuals(petab_problem, os.path.join(results_dir, 'simulation_0/simulation.tsv'),
                  figures_dir)

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


def create_profiles(
        amici_model,
        petab_problem: petab.v1.Problem,
        base_dir: str,
        figures_dir: str,
        result_path: str,
        tolerances: dict,
        optimize_config: dict,
        profile_index: Iterable[int] = None,
        alpha: float = 0.01
):
    n_procs = optimize_config['n_procs']
    opt_result = read_optimization_results(result_path)
    pypesto_problem, _, _ = create_pypesto_problem(
        base_dir, amici_model, petab_problem, tolerances)

    if n_procs > 1:
        engine = pypesto.engine.MultiProcessEngine(n_procs=n_procs)
        print(f"MultiProcessEngine, number of processes: {n_procs}")
    else:
        engine = pypesto.engine.SingleCoreEngine()
        print("SingleCoreEngine")

    optimizer_options = {
        'maxiter': optimize_config['optimizer']['optimizer_options'].get(
            'maxiter', 1e3)}
    optimizer = pypesto.optimize.FidesOptimizer(
        hessian_update=fides.BFGS(),
        options=optimizer_options
    )
    profile_options = profile.ProfileOptions(
            default_step_size=0.005,
            min_step_size=0.001,
            delta_ratio_max=0.05,
            ratio_min=np.exp(-sp.stats.chi2.ppf(1-alpha, 1) / 2)
        )

    result = profile.parameter_profile(
        problem=pypesto_problem,
        result=opt_result,
        profile_index=profile_index,
        optimizer=optimizer,
        engine=engine,
        profile_options=profile_options
    )
    pypesto_profile_writer = ProfileResultHDF5Writer(
        os.path.join(results_dir, 'profile_results.h5'))
    pypesto_profile_writer.write(result)

    visualize_profiles(result, figures_dir)


def combine_profile_results(results,
                            profiles_files: Union[Union[str, Path], List[Union[str, Path]]],
                            out_path: str):

    for profile_result in profiles_files:
        pypesto_profile_reader = ProfileResultHDF5Reader(
            os.path.join(profile_result))
        profile_read = pypesto_profile_reader.read()
        if len(results.profile_result.list) == 0:
            results.profile_result = profile_read.profile_result
        else:
            for idx, res in enumerate(profile_read.profile_result.list[0]):
                if res is not None:
                    results.profile_result.list[0][idx] = profile_read.profile_result.list[0][idx]

    pypesto_profile_writer = ProfileResultHDF5Writer(out_path)
    pypesto_profile_writer.write(results)


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

    results = read_optimization_results(os.path.join(results_dir, 'result.h5'),
                                       os.path.join(results_dir, 'histories', 'hist_result.h5'),
                                       read_histories=False)

    get_best_parameters(results, n_par_vector=1, end_p=True,
                        out_path=os.path.join(results_dir, "best_parameter_vector.tsv"))

    simulate_and_visualize(model_name, model, model_petab_problem,
                           config['tolerances'],
                           petab_dir,
                           figures_dir=figures_dir,
                           results_dir=results_dir,
                           type='')

    # compute posteriors profiles for all parameters
    create_profiles(model, model_petab_problem, base_dir,
                    figures_dir=figures_dir,
                    result_path=os.path.join(results_dir, 'result.h5'),
                    tolerances=config['tolerances'],
                    optimize_config=config['optimize'])