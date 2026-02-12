import os

from typing import Optional

import matplotlib.pyplot as plt
import petab
import petab.v1.visualize
import petab.v1.visualize.plotting
import pypesto.visualize
import scipy as sp

from petab.v1.visualize.plotter import MPLPlotter
from petab.v1.visualize.plotting import VisSpecParser

from utils import read_optimization_results
plt.style.use('tableau-colorblind10')


def plot_residuals(petab_problem: petab.v1.Problem,
                   simu_df_path: str,
                   figures_dir: str):
    plt.style.use('default')
    plt.rcParams.update({'font.size': 26,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 24,
                         'ytick.labelsize': 24,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'small'
                         })

    measurement_df = petab_problem.measurement_df
    simulations_df = petab.v1.get_simulation_df(simu_df_path)

    titles = ['pRII', 'pRII immunoblotting', 'C$_{\\alpha}$']
    for obs, title in zip(
            [['pRII_Microscopy', 'pRII_Microscopy_LK15_150727'], ['pRII_Western'], ['Calpha_Microscopy']],
            titles):
        measurement_subset = measurement_df[measurement_df['observableId'].isin(obs)]
        simulations_subset = simulations_df[simulations_df['observableId'].isin(obs)]

        simulations_subset['last_number'] = \
            simulations_subset['simulationConditionId'].str.extract(
                pat='model1_data([0-9]+)', expand=True).astype(int)
        simulations_subset = simulations_subset.sort_values(by=['last_number',
                                                        'replicateId'])

        petab_problem.measurement_df = measurement_subset

        fig, ax = plt.subplots(figsize=(11, 10.09))
        petab.v1.visualize.plot_residuals.plot_goodness_of_fit(
            petab_problem, simulations_subset,
            color=(0.55, 0.1, 0.01, 1.0),
            ax=ax
        )
        ax.set_xlim(left=0)
        ax.set_ylim(bottom=0)

        plt.title(title)
        plt.xlabel('Simulated value')
        plt.ylabel('Measurement')
        plt.tight_layout()

        for ext in ['png', 'svg']:
            plt.savefig(os.path.join(figures_dir, f'residuals_vs_simu_{obs[0]}.{ext}'))


def visualize_optimization_result(results_dir: str,
                                  figures_dir: str,
                                  modelname: str):
    results = read_optimization_results(
        os.path.join(results_dir, 'result.h5'))

    os.makedirs(figures_dir, exist_ok=True)

    summary = results.optimize_result.summary()
    with open(os.path.join(results_dir, "summary.txt"), "w") as text_file:
        text_file.write(summary)

    plt.rcParams.update({'font.size': 26,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 24,
                         'ytick.labelsize': 24,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'small'
                         })

    # waterfall plot
    alpha = 0.01
    t = sp.stats.chi2.ppf(1 - alpha, 1) / 2
    fval0 = results.optimize_result.fval[0]

    fig, ax = plt.subplots(figsize=(14, 10))
    n_starts = 500
    colors = [(1.0, 0.6, 0.6, 1.0) if results.optimize_result.fval[i]-fval0<=t else
              (0.8, 0.8, 0.8, 1) for i in range(n_starts)]
    colors[0] = (0.55, 0.1, 0.01, 1.0)

    pypesto.visualize.waterfall(results, start_indices=n_starts, ax=ax, colors=colors,
                                n_starts_to_zoom=60)
    ax.scatter(
        0,
        1,
        c=colors[0],
        marker="o",
        linewidth=1.0,
        zorder=2.0,
        alpha=1.0,
    )
    ax.set_xticks([0+100*i for i in range(11)])

    ax.plot([0, n_starts], [1+t, 1+t], '--', color='grey')
    ylabel = f"Negative log-posterior density\n({ax.get_ylabel().split('(')[1]}"
    ax.set_ylabel(ylabel)

    inset_axes = fig.axes[1]
    inset_axes.set_xticks([0,15,30,45,60])
    fig.canvas.draw()

    plt.tight_layout()
    plt.savefig(os.path.join(figures_dir,
                             f'{modelname}_waterfall_{n_starts}.svg'))


def visualize_fit(petab_problem: petab.v1.Problem,
                  simulation_path: str,
                  figures_dir: str,
                  visu_spec: Optional[str] = None,
                  extension: str = 'svg'):
    os.makedirs(figures_dir, exist_ok=True)

    plt.rcParams.update({'font.size': 24,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 22,
                         'ytick.labelsize': 22,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'x-small'
                         })

    visu_spec = visu_spec if visu_spec else petab_problem.visualization_df
    vis_spec_parser = VisSpecParser(
        petab_problem.condition_df, petab_problem.measurement_df, simulation_path
    )
    figure, dataprovider = vis_spec_parser.parse_from_vis_spec(visu_spec)
    figure.size = (12, 9)
    plotter = MPLPlotter(figure, dataprovider)
    plotter.generate_figure(figures_dir, format_=extension)