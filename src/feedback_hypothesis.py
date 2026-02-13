import os
import yaml

from shutil import copy

from utils import (_model_import, read_optimization_results)
from optimization import optimize, get_best_parameters, simulate_and_visualize


if __name__ == "__main__":
    base_dir = '../model'
    config_path = os.path.join(base_dir, 'config.yaml')
    with open(config_path, 'r') as file:
        config = yaml.safe_load(file)

    model_name = config['model_name']
    petab_dir = os.path.join(base_dir, 'petab_feedback')
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