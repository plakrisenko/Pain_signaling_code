"""Visualization helpers for PEtab/PyPESTO results used in the project.

Provided functions:
- plot_residuals: create residual-vs-simulation plots for selected observables.
- visualize_optimization_result: create summary files and a waterfall plot for a
  PyPESTO `Result` stored on disk.
- visualize_fit: render PEtab visualization specifications (fit plots) from a
  simulation dataframe.
- visualize_profiles: plot parameter profiles and profile confidence intervals
  from a PyPESTO `Result`.
"""

import os

from typing import Optional, Sequence

import matplotlib.pyplot as plt
import matplotlib as mpl
import petab
import petab.v1.visualize
import petab.v1.visualize.plotting
import pypesto.visualize
import numpy as np
import scipy as sp

from matplotlib.collections import PatchCollection
from matplotlib.patches import Rectangle
from matplotlib.ticker import PercentFormatter
from petab.v1.visualize.plotter import MPLPlotter
from petab.v1.visualize.plotting import VisSpecParser

from utils import (read_optimization_results, parameter_names_display)
plt.style.use('tableau-colorblind10')


def plot_residuals(petab_problem: petab.v1.Problem,
                   simu_df_path: str,
                   figures_dir: str):
    """Plot measurement vs simulation residuals for selected observables.

    This function filters the measurement and simulation tables in the
    provided `petab_problem` and the simulation dataframe at `simu_df_path`
    to a few pre-selected observables and creates residual-vs-simulated-value
    scatter/summary plots using PEtab's `plot_residuals.plot_goodness_of_fit`.

    Args:
        petab_problem: A loaded `petab.v1.Problem` which contains the
            measurement and visualization specification tables.
        simu_df_path: Path to a simulation dataframe (as created by
            `petab.v1.get_simulation_df`).
        figures_dir: Directory where generated figures will be written. The
            function writes PNG and SVG files for each plotted observable.

    Returns:
        None. Files are saved to `figures_dir`.
    """
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

    titles = ['pRII intensity', 'relative pRII density, immunoblotting', 'C$_{\\alpha}$ intensity']
    for obs, title in zip(
            [['pRII_Microscopy', 'pRII_Microscopy_LK15_150727'], ['pRII_Western'],
             ['Calpha_Microscopy']],
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
    """Generate optimization summary files and a waterfall plot for an HDF5 result.

    Args:
        results_dir: Directory containing `result.h5` (a PyPESTO result file).
        figures_dir: Directory where produced figures will be saved. Created if
            it does not exist.
        modelname: Model name used to label saved figure filenames.

    Returns:
        None. Files are written to `results_dir` and `figures_dir`.
    """
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
    """Render PEtab visualization specification plots for simulation results.

    Args:
        petab_problem: A loaded `petab.v1.Problem` instance containing
            condition and measurement tables.
        simulation_path: Path to the simulation dataframe (as used by PEtab).
        figures_dir: Directory where generated figures will be saved.
        visu_spec: Optional visualization specification (DataFrame or path)
            to override `petab_problem.visualization_df`.
        extension: File extension/format to write (e.g. 'svg', 'png').

    Returns:
        None. The PEtab plotter writes one or more files under `figures_dir`.
    """
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


def visualize_profiles(result, out_dir, profile_indices=None, pf=''):
    """Plot parameter profiles and profile CIs from a PyPESTO result.

    This function creates two outputs:
      1. A grid of profile plots (saved as `profiles{pf}.png`).
      2. A panel with profile confidence intervals (saved as `profile_cis{pf}.png`).

    Args:
        result: A PyPESTO `Result` object containing optimization and profile
            information.
        out_dir: Directory where generated figures will be written.
        profile_indices: Optional list/sequence of parameter indices to plot.
            If None, the function will plot profiles for the default set in
            the `result` object.
        pf: Optional suffix string appended to output filenames (useful for
            distinguishing multiple runs).

    Returns:
        None. Two PNG files are saved to `out_dir`.
    """
    plt.rcParams.update({'font.size': 24,
                         'figure.titlesize': 'x-large',
                         'axes.labelsize': 15,
                         'xtick.labelsize': 20,
                         'ytick.labelsize': 22,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'x-small'
                         })
    # plot profiles
    ref_point = pypesto.visualize.create_references(x=result.optimize_result.x[0],
                                                    fval=result.optimize_result.fval[0])
    axes = pypesto.visualize.profiles(result, reference=ref_point,
                                      profile_indices=profile_indices, show_bounds=True,
                                      quality_colors=True, plot_objective_values=False,
                                      size=(30, 15))

    t = np.exp(-sp.stats.chi2.ppf(1-0.01, 1) / 2)
    for ax in axes:
        ax.plot(ax.get_xlim(), [t, t], '--', color='grey')
    plt.tight_layout()
    plt.savefig(os.path.join(out_dir, f'profiles{pf}.png'))

    fig, ax = plt.subplots(figsize=(18, 9))
    pypesto.visualize.profile_cis(result, profile_indices=profile_indices, show_bounds=True, ax=ax)
    plt.tight_layout()
    plt.savefig(os.path.join(out_dir, f'profile_cis{pf}.png'))


def profile_cis(
        result: pypesto.Result,
        figures_dir: str,
        pf: str,
        profile_indices: Sequence[int] = None,
        profile_list: int = 0,
        ax: mpl.axes.Axes = None,
        rotation: str = 'v', # 'v' or 'h'
):

    problem = result.problem
    profile_list = result.profile_result.list[profile_list]
    fval0 = result.optimize_result.fval[0]

    plt.rcParams.update({'font.size': 24,
                         'figure.autolayout': False,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 22,
                         'ytick.labelsize': 22,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'x-small'
                         })

    if profile_indices is None:
        profile_indices = [ix for ix, res in enumerate(profile_list) if res]

    if ax is None:
        _, ax = plt.subplots()

    ws = [0.2, 0.4, 0.6]
    colors_identifiable = ["#a3cce9", "#5fa2ce", "#1170aa"]
    colors_nonidentifiable = ["#ffbc79", "#fc7d0b", "#C85200"]
    parameter_identifiability = [True]*len(profile_indices)  # placeholder
    for i, confidence_level in enumerate([0.99, 0.95, 0.9]):
        k = 1
        diff = sp.stats.chi2.ppf(confidence_level, k) / 2

        xs_list = []
        x = -ws[i]/2
        rectangles = []
        colors = []
        for j, i_par in enumerate(profile_indices):
            conf_l_indices = [idx for idx, fval in enumerate(profile_list[i_par].fval_path) if
                              fval-fval0<=diff]
            xs = profile_list[i_par].x_path[i_par][conf_l_indices]
            xs_list.append(xs)
            par_ci = [np.min(xs), np.max(xs)]

            if (par_ci[0] - result.problem.lb_full[i_par])<0.05 or (result.problem.ub_full[i_par]
                                                                    - par_ci[1])<0.05:
                parameter_identifiability[j] = False
            h = par_ci[1] - par_ci[0]

            if rotation == 'v':
                rectangles.append(
                    Rectangle((par_ci[0], x), h, ws[i]))
            else:
                rectangles.append(
                    Rectangle((x, par_ci[0]), ws[i], h))
            x += 1

            if rotation == 'v':
                ax.plot([result.problem.lb_full[i_par]]*2, [j-0.4, j+0.4], color='grey')
                ax.plot([result.problem.ub_full[i_par]]*2, [j-0.4, j+0.4], color='grey')
            else:
                ax.plot([j-0.4, j+0.4], [result.problem.lb_full[i_par]]*2, color='grey')
                ax.plot([j-0.4, j+0.4], [result.problem.ub_full[i_par]]*2, color='grey')

            colors.append(colors_identifiable[i] if parameter_identifiability[j] else
                          colors_nonidentifiable[i])
        ax.add_collection(PatchCollection(rectangles, facecolors=colors, edgecolors="dimgrey"))

    x_names = [parameter_names_display(problem.x_names[ix]) for ix in profile_indices]

    parameters_ind = np.arange(0, len(profile_indices))

    if rotation == 'v':
        ax.set_yticks(parameters_ind)
        ax.set_yticklabels(x_names)
        ax.set_ylabel("Parameter")
        ax.set_xlabel("log$_{10}$(parameter value)")
        ax.set_xlim(-5.2, 5.2)
        ax.set_ylim(-1, len(profile_indices))
    else:
        ax.set_xticks(parameters_ind)
        ax.set_xticklabels(x_names)
        ax.set_xticklabels(ax.get_xticklabels(), rotation=45, ha="right")
        ax.set_xlabel("Parameter")
        ax.set_ylabel("log$_{10}$(parameter value)")
        ax.set_ylim(-5.2, 5.2)
        ax.set_xlim(-1, len(profile_indices))

    plt.savefig(os.path.join(figures_dir, f'profile_cis_{pf}.svg'))

    fig, ax = plt.subplots(figsize=(6, 2))

    labels = ["A"]
    p1 = np.sum(parameter_identifiability)/len(parameter_identifiability)
    p2 = 1 - p1

    ax.barh(labels, p1, label="Part 1", color=colors_identifiable[1])
    ax.barh(labels, p2, left=p1, label="Part 2", color=colors_nonidentifiable[1])

    ax.text(p1 / 2, 0, f"{p1 * 100:.0f}%",
            va='center', ha='center', color='white', fontsize=20)
    ax.text(p1 + p2 / 2, 0, f"{p2 * 100:.0f}%",
            va='center', ha='center', color='white', fontsize=20)

    # format x-axis ticks as percentages
    ax.xaxis.set_major_formatter(PercentFormatter(1.0))

    plt.tight_layout()
    plt.savefig(os.path.join(figures_dir, f'identifiability_fraction_{pf}.svg'))

    return ax


def visualize_profile_confidence_intervals(result, figures_dir: str, rotation: str = 'v'):
    parameter_groups = {
        'Gproteins': [
            'kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI',
            'kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS',
            'kf_alphaS_betaS_gammaS',
            'xi_alphaS_betaS_gammaS__fiveHT4_5HT',
            'kf_alphaI_betaI_gammaI',
            'xi_alphaI_betaI_gammaI__MOR_DAMGO',
            'xi_alphaI_betaI_gammaI__MOR_Fentanyl',
            'kf_alphaS_GTP__alphaS_GDP',
            'kf_alphaI_GTP__alphaI_GDP',
            'kf_AC_alphaI_GTP',
            'KD_AC_alphaI_GTP',
            'kf_AC_alphaS_GTP',
            'KD_AC_alphaS_GTP',
            'xi_AC_cAMP_alphaS_GTP',
        ],
        'receptors': [
            'kf_DAMGO', 'KD_DAMGO', 'kdeg_DAMGO',
            'kf_Fentanyl', 'KD_Fentanyl', 'kdeg_Fentanyl',
            'kf_5HT', 'KD_5HT', 'kdeg_5HT',
        ],
        'cAMPanalogs': [
            'ki_Rp8_Br_cAMPS_pAB',
            'ki_Rp8_pCPT_cAMPS_pAB',
            'ki_Rp_cAMPS_pAB',
            'ki_Sp8_Br_cAMPS_AM',
            'xi_KD_Rp8_Br_cAMPS',
            'xi_KD_Rp8_pCPT_cAMPS',
            'xi_KD_Rp_cAMPS',
            'xi_KD_Sp8_Br_cAMPS',
            'xi_b_Rp8_Br_cAMPS',
            'xi_b_Rp8_pCPT_cAMPS',
            'xi_b_Rp_cAMPS',
            'xi_b_Sp8_Br_cAMPS',
        ],
        'PKAandcAMP': ['KD_Fsk', 'KD_H89', 'kf_H89',
                         'KD_IBMX', 'ki_IBMX',
                         'KD_cAMP', 'kdeg_cAMP', 'kf_cAMP',
                         'kdeg_cAMP_free', 'kf_Fsk', 'ks_AC_cAMP', 'xi_AC_cAMP_Fsk',
                         'kf_RII_2__RII_C_2',
                         'kf_RII_C_2__RII_2',
                         'kf_RII_C_2__RIIp_C_2',
                         'kf_RIIp_2__RII_2',
                         'kf_RIIp_C_2__RII_C_2',
                         'kf_RIIp_cAMP_C_2__RIIp_2',
                         'xi_kf_RII_2__RII_C_2',
                         'xi_kf_RII_C_2__RII_2',
                         ],
        'noise': [
            'b_Calpha_global',
            'b_pRII_global',
            'rel_open',
            'xi_rel_open',
            's_Calpha_global',
            's_pRII_JI09_150302_Drg345_343_CycNuc',
            's_pRII_JI09_150330_Drg350_348_CycNuc',
            's_pRII_JI09_150330_Drg353_351_CycNuc',
            's_pRII_JI09_151102_Drg421_418_Age',
            's_pRII_Western',
            's_pRII_global',
            'rho_Calpha_Microscopy',
            'rho_pRII_Microscopy',
            'rho_pRII_Western',
            's_pRII_LK041_39_MOR_Kinetic_Fentanyl_Fsk',
            's_pRII_LK023_21_MOR_Kinetik_DAMGO_Fsk',
            's_pRII_LK15_150810_LK053_52_047_46_MOR_Kinetic_Fentanyl_5HT',
            's_pRII_LK15_150727_LK051_48_MOR_Kinetic_10min_Fentanyl_Fsk',
            's_pRII_LK020_18_LK014_12_MOR_Kinetik_DAMGO_5HT',
            's_pRII_JI09_140331_Drg270_267_TiM',
            'b_pRII_LK15_150727_LK051_48_MOR_Kinetic_10min_Fentanyl_Fsk'
        ]
    }

    os.makedirs(figures_dir, exist_ok=True)

    for pg in parameter_groups:
        n_params = len(parameter_groups[pg])

        if rotation == 'v':
            fig, ax = plt.subplots(figsize=(12, 0.5*n_params + 2))
            plt.subplots_adjust(left=0.6)
        else:
            fig, ax = plt.subplots(figsize=(0.5*n_params + 6, 12))
            plt.subplots_adjust(bottom=0.6)


        p_indices = [result.problem.x_names.index(pn) for pn in parameter_groups[pg]]
        profile_cis(result, figures_dir=figures_dir, pf=pg,
                    profile_indices=p_indices, rotation=rotation, ax=ax
        )