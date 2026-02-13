import os
import yaml
from typing import Optional

import amici
import numpy as np
import pandas as pd
import petab
import matplotlib.pyplot as plt
from shutil import copy

from utils import (_model_import, _setup_amici, read_optimization_results)
from optimization import optimize, get_best_parameters, simulate_and_visualize


def simulate_states_petab(amici_model,
                          petab_problem: petab.Problem,
                          tolerances: dict,
                          parameters_path: Optional[str] = None,
                          parameters_idx: int = 0):

    # Create solver instance
    amici_model, solver = _setup_amici(amici_model, tolerances)

    parameter_vector = pd.read_csv(parameters_path, sep='\t').values[parameters_idx]
    parameters = dict(zip(petab_problem.x_ids, parameter_vector))

    result = amici.petab.simulate_petab(
        petab_problem, amici_model, solver,
        problem_parameters=parameters,
        scaled_parameters=True
    )

    return result, amici_model


def write_fluxes(result, amici_model, out_folder):
    for rdata in result['rdatas']:
        df = pd.DataFrame(data=np.insert(rdata['w'], 0, rdata['ts'], axis=1),
                          columns=['t'] + list(amici_model.getExpressionIds()))
        df.to_csv(os.path.join(out_folder, f'{rdata.id}.tsv'), sep='\t', index=False)


def visualize_Gactivity_flux(condition_fluxes_list, fluxes_to_plot, outpath, title: str = ''):
    # condition_fluxes_list: List of paths to multiple condition_fluxes files
    # fluxes_to_plot: List of tuples (flux column, legend)

    plt.rcParams.update({'font.size': 26,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 24,
                         'ytick.labelsize': 24,
                         'lines.markersize': 12,
                         'lines.linewidth': 4,
                         'legend.fontsize': 'small'
                         })
    flux_data = []
    for condition_fluxes in condition_fluxes_list:
        fluxes = pd.read_csv(condition_fluxes, sep='\t')
        flux_data.append(fluxes)

    flux_concat = pd.concat(flux_data, axis=0, keys=range(len(flux_data)))
    fig, axes = plt.subplots(figsize=(8.5, 6.8))

    g_i_activation_fluxes = ['flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI',
                             'flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__3',
                             'flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__5']
    for flux, legend in fluxes_to_plot:
        flux_concat['flux_fraction'] = flux_concat[flux] / np.sum(
            [flux_concat[f] for f in g_i_activation_fluxes], axis=0)
        flux_values = flux_concat.groupby(level=1)['flux_fraction']  # group by time
        mean_flux = flux_values.median()
        lower_quantile = flux_values.quantile(0.25)
        upper_quantile = flux_values.quantile(0.75)

        plt.plot(flux_concat.groupby(level=1)['t'].mean(), mean_flux * 100,
                 label=f"{legend} (median)")
        plt.fill_between(flux_concat.groupby(level=1)['t'].mean(), lower_quantile, upper_quantile,
                         alpha=0.3,
                         label=f"{legend} (25-75th percentile)")

    plt.legend()
    plt.title(title)
    plt.xlabel('Time [min]')
    plt.ylabel('Flux contribution [%]')
    plt.tight_layout()
    plt.savefig(outpath)
    # plt.show()
    plt.close(fig)


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

    ######### feedback_parameter_histogram, Figure S8C #########
    fval0 = results.optimize_result.list[0].fval
    feedback_parameters = [r.x[-1] for r in results.optimize_result.list[:100] if r.fval < fval0 + 3.32]
    print(len(feedback_parameters))
    fig, ax = plt.subplots(figsize=(8.5, 6.8))
    ax.hist(feedback_parameters, color="#FF800E", alpha=0.8)
    ax.set_title('$\\xi_{G_I\_\\text{pRII}_{\\text{cAMP}}}$') #parameter_names_display(results.problem.x_names[-1])
    ax.set_xlabel('log$_{10}$(parameter value)')
    ax.set_ylabel('Frequency')
    plt.savefig(os.path.join(figures_dir, 'feedback_parameter_histogram.svg'))

    get_best_parameters(results, n_par_vector=100, end_p=True,
                        out_path=os.path.join(results_dir, "best_parameter_vector_100.tsv"))

    simulate_and_visualize(model_name, model, model_petab_problem,
                           config['tolerances'],
                           petab_dir,
                           figures_dir=figures_dir,
                           results_dir=results_dir,
                           type='')

    # simulate fluxes for best parameter vectors and write to file
    for i in range(30):
        parameters_path = os.path.join(results_dir,
                                       'best_parameter_vectors_100.tsv')
        parameter_vector = pd.read_csv(parameters_path, sep='\t').values[i]
        parameters = dict(zip(model_petab_problem.x_ids, parameter_vector))

        result, amici_model = simulate_states_petab(
            model, model_petab_problem,
            tolerances=config['tolerances'],
            parameters_path=os.path.join(results_dir,
                                         'best_parameter_vectors_100.tsv'),
            parameters_idx=i
        )
        outfig = os.path.join(results_dir, 'fluxes', f'start{i}')
        os.makedirs(outfig, exist_ok=True)
        write_fluxes(result, model, outfig)

    for condition, _, title in [
        ('model1_data124', 'LK041_39_MOR_Kinetic_Fentanyl_Fsk___ctrl', ''),
        ('model1_data126', 'LK041_39_MOR_Kinetic_Fentanyl_Fsk___Fsk', ''),
        ('model1_data129', 'LK041_39_MOR_Kinetic_Fentanyl_Fsk___Fsk_and_Fentanyl10',
         'Fentanyl (10 $\mu$M)'),
        ('model1_data128', 'LK041_39_MOR_Kinetic_Fentanyl_Fsk___Fsk_and_Fentanyl1',
         'Fentanyl (1 $\mu$M)'),
         ('model1_data127', 'LK041_39_MOR_Kinetic_Fentanyl_Fsk___Fsk_and_Fentanyl01',
          'Fentanyl (0.1 $\mu$M)')]:
        ids_set = list(range(5))
        os.makedirs(os.path.join(figures_dir, 'fluxes'), exist_ok=True)
        visualize_Gactivity_flux(
            [os.path.join(results_dir, 'fluxes', f'start{i}', f'{condition}+model1_data49.tsv') for
             i in ids_set],
            [
                # ('flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__2', 'DAMGO'),
                # ('flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__4', 'DAMGO pRII'),
                ('flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__3', 'Fentanyl'),
                ('flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__5', 'Fentanyl + pRII'),
                ('flux_alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI', 'basal'),
            ],
            outpath=os.path.join(figures_dir, 'fluxes',
                                 f'{condition}_MOR_feedback_percent.svg'),
            title=title
        )
