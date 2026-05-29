import copy
import os
import yaml
from functools import partial
from typing import Optional

import pypesto.ensemble
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
import petab
import scipy.stats as stats
import pypesto
from matplotlib.collections import PatchCollection
from matplotlib.patches import Rectangle
from pypesto.ensemble import Ensemble
from pypesto.C import AMICI_T, AMICI_X, AMICI_STATUS

from utils import (
    _model_import,
    create_pypesto_problem,
    read_optimization_results,
    condition_id_to_label,
    dataset_id_to_label
)

plt.style.use("tableau-colorblind10")
tableau_colorblind10 = ["#007ACC", "#FF800E", "#ABABAB", "#595959", "#5F9ED1", "#C85200",
                        "#898989", "#A2C8EC", "#FFBC79", "#CFCFCF"]


def post_processor(
    amici_outputs: list[dict[str, np.array]], n_output: int
) -> tuple[
    list[np.array],
    list[np.array],
    list[np.array],
    list[np.array],
    list[np.array],
]:
    outputs = [
        amici_output[AMICI_X]
        if amici_output[AMICI_STATUS] == 0
        else np.full((len(amici_output[AMICI_T]), n_output), np.nan)
        for amici_output in amici_outputs
    ]

    return outputs

def create_prediction(
    base_dir,
    amici_model,
    petab_problem,
    results_folder: str,
    tolerances: dict,
    max_n_vectors: float = np.inf,
    from_hist: bool = False,
    simulate_states: bool = False,
):
    """Build an ensemble and produce predictions using a PyPESTO predictor.

    Parameters
    ----------
    base_dir:
        Base directory used when creating the PyPESTO problem/importer; this
        is passed to `create_pypesto_problem` and determines where model
        artifacts are located/written.
    amici_model:
        An AMICI model instance (returned by PEtab/AMICI import).
    petab_problem:
        A `petab.v1.Problem` that contains the measurement/condition/visual
        specifications for the predictions.
    results_folder:
        Directory containing the PyPESTO `result.h5` file. When `from_hist`
        is True the function will also attempt to read
        `histories/hist_result.h5` inside this folder.
    tolerances:
        Dict-like object forwarded to `create_pypesto_problem`; it should
        contain at least the key `'n_threads'` and any solver tolerances used
        to configure AMICI/PyPESTO.
    max_n_vectors:
        Maximum number of ensemble members to retain (passed to
        `Ensemble.from_...` methods). Defaults to no limit.
    from_hist:
        If True construct the ensemble from the optimization history
        (`Ensemble.from_optimization_history`). If False construct it from
        optimization endpoints (`Ensemble.from_optimization_endpoints`).
    simulate_states:
        If True the predictor will be created with a `post_processor` that
        extracts full AMICI state trajectories from the simulation results;
        otherwise only observables are predicted.

    Returns
    -------
    tuple
        A tuple `(ensemble, ensemble_prediction)` where `ensemble` is the
        constructed `pypesto.ensemble.Ensemble` and `ensemble_prediction` is
        the object returned by `ensemble.predict(...)` containing prediction
        results (e.g. `prediction_results`, `condition_ids`, etc.).

    """

    alpha = 0.01
    th = stats.chi2.ppf(1 - alpha, 1) / 2
    if from_hist:
        result = read_optimization_results(
            os.path.join(results_folder, "result.h5"),
            os.path.join(results_folder, "histories", "hist_result.h5"),
            read_histories=True,
        )
        my_ensemble = Ensemble.from_optimization_history(
            result, rel_cutoff=th, max_size=max_n_vectors
        )
    else:
        result = read_optimization_results(
            os.path.join(results_folder, "result.h5")
        )
        my_ensemble = Ensemble.from_optimization_endpoints(
            result, rel_cutoff=th, max_size=max_n_vectors
        )

    pypesto_problem, startpoint_method, importer = create_pypesto_problem(
        base_dir, amici_model, petab_problem, tolerances
    )
    if isinstance(pypesto_problem.objective, pypesto.objective.AggregatedObjective):
        pypesto_problem.objective._objectives[0].update_from_problem(
            dim_full=pypesto_problem.dim_full,
            x_free_indices=pypesto_problem.x_free_indices,
            x_fixed_indices=pypesto_problem.x_fixed_indices,
            x_fixed_vals=pypesto_problem.x_fixed_vals,
        )
        objective = pypesto_problem.objective._objectives[0]
        objective.pre_post_processor = pypesto_problem.objective._objectives[0].pre_post_processor
    else:
        objective = pypesto_problem.objective
        objective.pre_post_processor = pypesto_problem.objective.pre_post_processor

    # create prediction via PEtab
    if simulate_states:
        predictor = importer.create_predictor(
            objective=objective,
            post_processor=partial(post_processor, n_output=amici_model.nx_rdata),
        )
    else:
        predictor = importer.create_predictor(objective=objective)

    # perform a prediction for the ensemble
    ensemble_prediction = my_ensemble.predict(predictor=predictor)
    my_ensemble.predictions.append(ensemble_prediction)
    return my_ensemble, ensemble_prediction


def visualize_doseresponse_ensemble(
        e_id,
        dataset_ids_and_params: list[tuple[str, str]],
        measurement_df,
        petab_problem,
        ensemble_prediction,
        quantiles: tuple[float, float] = (0.005, 0.995),
        plot_measurements=False,
        figurepath="output/ensemble_fit.png",
        xlabel = "Concentration [$\\mu$M]",
        add_scaling = False,
        scale = 'log'
):
    obs_index = 0 # pRII_Microscopy

    observable_ids = petab_problem.get_observable_ids()
    meas_df = copy.deepcopy(petab_problem.measurement_df)  # different measurements df
    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df['experimentId'] == e_id]

    def transform_dose(d):
        return d if d != 0 else 0.0001

    def compute_scaling(ms, ss, std):
        # closed form solution for argmin_s sum((ms - ss*s)^2 / std)
        w = 1.0 / (std + 1e-12)
        num = np.sum(ss * ms * w)
        den = np.sum(ss * ss * w)
        return float(num / den) if den != 0 else 1.0

    sim_x = []

    # prepare simulation condition ids per dataset
    simu_condition_ids = []
    for d_i, _ in dataset_ids_and_params:
        dataset_simu_condition_ids = [
            f"model1_data49::{cond}" for cond in
            exp_measurements[exp_measurements['datasetId'] == d_i][
                'simulationConditionId'].unique()]
        simu_condition_ids.append(dataset_simu_condition_ids)

    obs_means = []
    obs_stds = []
    obs_quantiles = []
    state_means = []
    state_stds = []
    state_quantiles = []

    # optionally compute scalings per ensemble entry
    scalings: dict[int, float] = {}

    if add_scaling:
        # for each ensemble entry compute scaling based on measurements
        for idx, p_result in enumerate(ensemble_prediction.prediction_results):
            ms = []
            std = []
            ss = []
            for i, (d, p) in enumerate(dataset_ids_and_params):
                # filter condition results for this dataset
                rdatas = [
                    p_result.conditions[p_result.condition_ids.index(cond)]
                    for cond in simu_condition_ids[i]
                    if cond in p_result.condition_ids
                ]
                # use measurement statistics for this dataset
                meas_group = measurement_df[(measurement_df['datasetId'] == d)].groupby(
                    'simulationConditionId')
                ms.extend(meas_group['measurement'].mean().values)
                std.extend(meas_group['measurement'].std().values)
                # model summaries: take mean output for each cond_result (first output)
                ss.extend([np.mean(cond.output[:, 0]) for cond in rdatas])
            if len(ms) and len(ss) and len(std):
                scalings[idx] = compute_scaling(np.asarray(ms), np.asarray(ss), np.asarray(std))
            else:
                scalings[idx] = 1.0

    # collect simulations across ensemble entries
    for i, (d, p) in enumerate(dataset_ids_and_params):  # iterate over datasets
        observable_simulations = []
        state_simulations = []
        # iterate over ensemble entries
        for idx, p_result in enumerate(ensemble_prediction.prediction_results):
            # gather cond_results for dataset i
            rdatas = [
                p_result.conditions[p_result.condition_ids.index(cond)]
                for cond in simu_condition_ids[i]
                if cond in p_result.condition_ids
            ]

            if p == 'time':
                if len(rdatas) == 0:
                    continue
                # take output for observable (find index)
                obs_ind = 0
                if hasattr(rdatas[0], "output_ids"):
                    try:
                        obs_ind = rdatas[0].output_ids.index(observable_ids[obs_index])
                    except Exception:
                        obs_ind = 0
                if len(rdatas) == 1:
                    observable_simulations.append(rdatas[0].output[:, obs_ind])
                else:
                    observable_simulations.append(np.array([rdata.output[:, obs_ind] for
                                                            rdata in rdatas]))
                sim_x.append(rdatas[0].timepoints)
            else:
                # dose-response: extract dose for each cond and corresponding observable (single value per cond)
                doses = []
                obs_vals = []
                for rdata, simu_condition in zip(rdatas, simu_condition_ids[i]):
                    cond_id = simu_condition.split('::')[1]
                    dose = transform_dose(float(petab_problem.condition_df.loc[cond_id][p]))
                    if e_id == "JI09_150302_Drg345_343_CycNuc":
                        doses.append(60 - dose)
                    else:
                        doses.append(dose)
                    # choose observable index if present
                    obs_ind = 0
                    # take first timepoint / replicate value
                    val = rdata.output[0, obs_ind] if hasattr(rdata, "output") else 0.0
                    obs_vals.append(val)
                if add_scaling and idx in scalings:
                    obs_vals = [v * scalings[idx] for v in obs_vals]
                # sort by dose
                if len(doses):
                    sorted_pairs = sorted(zip(doses, obs_vals))
                    doses_sorted, obs_sorted = zip(*sorted_pairs)
                    observable_simulations.append(np.asarray(obs_sorted))
                    sim_x.append(list(doses_sorted))
                else:
                    observable_simulations.append(np.array([]))
                    sim_x.append([])

        observable_simulations = np.array([np.asarray(x) for x in observable_simulations])

        # compute mean and quantiles (handle variable-length sequences)
        # align by taking element-wise mean for entries with same length,
        # else compute per-entry stats where possible
        if len(observable_simulations) == 0:
            obs_means.append(np.array([]))
            obs_stds.append(np.array([]))
            obs_quantiles.append(np.array([[], []]))
            continue

        # try stacking where possible
        try:
            stacked = np.vstack([np.atleast_1d(v) for v in observable_simulations if v.size])
            obs_means.append(np.mean(stacked, axis=0))
            obs_stds.append(np.std(stacked, axis=0))
            obs_quantiles.append(np.quantile(stacked, quantiles, axis=0))
        except ValueError:
            # fallback: compute mean over varying-length lists by padding with nan
            maxlen = max([v.size for v in observable_simulations])
            padded = np.full((len(observable_simulations), maxlen), np.nan)
            for ii, v in enumerate(observable_simulations):
                padded[ii, : v.size] = v
            obs_means.append(np.nanmean(padded, axis=0))
            obs_stds.append(np.nanstd(padded, axis=0))
            obs_quantiles.append(np.nanquantile(padded, quantiles, axis=0))

    obs_means = np.array(obs_means)
    obs_stds = np.array(obs_stds)
    obs_quantiles = np.array(obs_quantiles)
    state_means = np.array(state_means)
    state_stds = np.array(state_stds)
    state_quantiles = np.array(state_quantiles)

    plt.rcParams.update(
        {
            "font.size": 26,
            "figure.titlesize": "small",
            "xtick.labelsize": 24,
            "ytick.labelsize": 24,
            "lines.markersize": 12,
            "lines.linewidth": 4,
            "legend.fontsize": "x-small",
        }
    )

    fig, axs = plt.subplots(figsize=(9, 8), constrained_layout=True)

    for d_index in range(len(simu_condition_ids)):
        x_vals = sim_x[d_index] if d_index < len(sim_x) else []
        mean_vals = obs_means[d_index] if d_index < len(obs_means) else np.array([])
        quant_vals = obs_quantiles[d_index] if d_index < len(obs_quantiles) else np.array([[], []])

        # label = f"{dataset_ids_and_params[d_index][0]}"
        label = f"{dataset_id_to_label(petab_problem, dataset_ids_and_params[d_index][0])}"
        p = axs.plot(x_vals, mean_vals, label=label)
        if quant_vals.size:
            axs.fill_between(x_vals, quant_vals[0], quant_vals[1], alpha=0.35)

        meas_color = p[0].get_color() if p else None
        if plot_measurements:
            mes_x = [
                transform_dose(petab_problem.condition_df.loc[s_c][
                                   dataset_ids_and_params[d_index][1]])
                for s_c in measurement_df[measurement_df['datasetId'] ==
                                          dataset_ids_and_params[d_index][0]][
                    'simulationConditionId'].unique()
            ]

            meas_means = measurement_df[(measurement_df['observableId'] ==
                                         observable_ids[obs_index]) &
                                 (measurement_df['datasetId'] ==
                                  dataset_ids_and_params[d_index][0])].groupby(
                'simulationConditionId')['measurement'].mean()

            meas_std = measurement_df[(measurement_df['observableId'] ==
                                       observable_ids[obs_index]) &
                                 (measurement_df['datasetId'] ==
                                  dataset_ids_and_params[d_index][0])].groupby(
                'simulationConditionId')['measurement'].std()

            sqrt_n = np.sqrt(measurement_df[(meas_df['observableId'] ==
                                             observable_ids[obs_index]) &
                                 (measurement_df['datasetId'] ==
                                  dataset_ids_and_params[d_index][0])].groupby(
                'simulationConditionId')['measurement'].size() - 1)
            meas_sem = meas_std / sqrt_n
            if e_id == "JI09_150302_Drg345_343_CycNuc":
                mes_x = [60 - x for x in mes_x]
                order = np.argsort(mes_x)
                mes_x = [mes_x[i] for i in order]
                meas_means = meas_means.iloc[order]
                meas_std = meas_std.iloc[order]
                meas_sem = meas_sem.iloc[order]

            axs.scatter(mes_x, meas_means, color=meas_color)
            axs.errorbar(mes_x,
                         meas_means,
                         yerr=meas_sem,
                         fmt='o',
                         color=meas_color)
    axs.set_xlabel(xlabel)
    obs = "pRII" if observable_ids[obs_index] == "pRII_Microscopy" else "C$_\\alpha$"
    axs.set_ylabel(f"{obs} intensity [au]")
    axs.set_title(f"{e_id}")
    axs.set_xscale(scale)
    axs.legend()

    fig.tight_layout()
    if figurepath:
        os.makedirs(os.path.dirname(figurepath), exist_ok=True)
        plt.savefig(figurepath)


def visualize_ensemble(
    petab_problem,
    ensemble_prediction,
    measurement_df,
    e_id,
    quantiles=(0.001, 0.999),
    observable_id: str = "pRII_Microscopy",
    figurepath: str = "",
    plot_measurements: bool = False,
    figsize = (9, 8)
):
    plt.rcParams.update(
        {
            "font.size": 26,
            "figure.titlesize": "small",
            "xtick.labelsize": 24,
            "ytick.labelsize": 24,
            "lines.markersize": 12,
            "lines.linewidth": 4,
            "legend.fontsize": "x-small",
        }
    )

    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df["experimentId"] == e_id
    ]

    # select conditions per experiment
    simu_condition_ids = [
        f"model1_data49::{cond}"
        for cond in exp_measurements["simulationConditionId"].unique()
    ]
    sim_timepoints = None

    obs_means = []
    obs_maxs = []
    obs_mins = []
    obs_stds = []
    obs_quantiles = []

    for i_cond in simu_condition_ids:
        observable_simulations = []
        for p_result in ensemble_prediction.prediction_results: # iterate over ensemble entries
            c_ind = p_result.condition_ids.index(i_cond)
            cond_result = p_result.conditions[c_ind]
            obs_ind = cond_result.output_ids.index(observable_id)


            unique_vals, first_indices = np.unique(cond_result.timepoints, return_index=True)

            # take first replicate
            observable_simulations.append(cond_result.output[first_indices, obs_ind])
            if sim_timepoints is None:
                sim_timepoints = cond_result.timepoints[first_indices]

        # compute mean and quantiles
        obs_means.append(np.mean(np.array(observable_simulations), axis=0))
        obs_mins.append(
            np.min(np.array(observable_simulations), axis=0)
        )
        obs_maxs.append(
            np.max(np.array(observable_simulations), axis=0)
        )
        obs_stds.append(np.std(np.array(observable_simulations), axis=0))
        obs_quantiles.append(
            np.quantile(np.array(observable_simulations), quantiles, axis=0)
        )

    obs_means = np.array(obs_means)
    obs_maxs = np.array(obs_maxs)
    obs_mins = np.array(obs_mins)
    obs_stds = np.array(obs_stds)
    obs_quantiles = np.array(obs_quantiles)

    # plot
    fig, axs = plt.subplots(figsize=figsize, constrained_layout=True)
    rel_errors = []
    for cond_index in range(len(simu_condition_ids)):
        condition = simu_condition_ids[cond_index].split("+")[0]

        p = axs.plot(
            sim_timepoints,
            obs_means[cond_index],
            label=f"{condition_id_to_label(petab_problem, condition)}",
        )
        axs.fill_between(
            sim_timepoints,
            obs_mins[cond_index],
            obs_maxs[cond_index],
            alpha=0.35,
        )
        if plot_measurements:
            m_timepoints = measurement_df[measurement_df['experimentId'] == e_id]['time'].unique()
            m_color = p[0].get_color() if p else None
            m_condition = condition.split("::")[1]
            meas_means = [np.mean(
                measurement_df[(measurement_df['time'] == t) &
                               (measurement_df['observableId'] == observable_id) &
                               (measurement_df['simulationConditionId'] == m_condition)][
                    'measurement'].values)
                for t in m_timepoints]
            meas_sem = [np.std(
                measurement_df[(measurement_df['time'] == t) & (
                            measurement_df['observableId'] == observable_id)
                               & (measurement_df['simulationConditionId'] == m_condition)][
                    'measurement'].values) / np.sqrt(len(
                measurement_df[(measurement_df['time'] == t) & (
                            measurement_df['observableId'] == observable_id)
                               & (measurement_df['simulationConditionId'] == m_condition)][
                    'measurement'].values) - 1)
                        for t in m_timepoints]
            axs.scatter(m_timepoints, meas_means, color=m_color)
            axs.errorbar(m_timepoints,
                         meas_means,
                         yerr=meas_sem,
                         fmt='o',
                         color=m_color)

            # compute relative errors
            for i_t, t in enumerate(m_timepoints[1:]): # exclude the first timepoint (t=0) for "JI09_150330_Drg350_348_CycNuc"
                for simulation in observable_simulations:
                    s_idx = np.where(sim_timepoints == t)[0]
                    rel_errors.append(np.abs((meas_means[i_t] - simulation[s_idx]) /
                                             meas_means[i_t]))

    axs.set_xlabel("Time [min]")
    obs = "pRII" if observable_id in ["pRII_Microscopy", "pRII_Microscopy_LK15_150727"] else "C$_\\alpha$"
    axs.set_ylabel(f"{obs} intensity [au]")
    axs.set_title(f"{e_id}")
    axs.legend()

    fig.tight_layout()
    if figurepath:
        os.makedirs(os.path.dirname(figurepath), exist_ok=True)
        plt.savefig(figurepath)
    plt.close(fig)


def visualize_ensemble_barplot(
    petab_problem,
    ensemble_prediction,
    measurement_df,
    e_id,
    quantiles=(0.001, 0.999),
    observable_id: str = "pRII_Microscopy",
    figurepath: str = "",
    plot_measurements: bool = False
):

    plt.rcParams.update(
        {
            "font.size": 26,
            "figure.titlesize": "small",
            "xtick.labelsize": 24,
            "ytick.labelsize": 24,
            "lines.markersize": 12,
            "lines.linewidth": 4,
            "legend.fontsize": "x-small",
        }
    )

    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df["experimentId"] == e_id
    ]

    # select conditions per experiment
    simu_condition_ids = [
        f"model1_data49::{cond}"
        for cond in exp_measurements["simulationConditionId"].unique()
    ]
    sim_timepoints = None

    obs_means = []
    obs_maxs = []
    obs_mins = []
    obs_stds = []
    obs_quantiles = []

    for i_cond in simu_condition_ids:
        observable_simulations = []
        for p_result in ensemble_prediction.prediction_results:
            c_ind = p_result.condition_ids.index(i_cond)
            cond_result = p_result.conditions[c_ind]
            obs_ind = cond_result.output_ids.index(observable_id)

            unique_vals, first_indices = np.unique(cond_result.timepoints, return_index=True)

            # take first replicate
            observable_simulations.append(cond_result.output[first_indices, obs_ind])
            if sim_timepoints is None:
                sim_timepoints = cond_result.timepoints[first_indices]

        # compute mean and quantiles
        obs_means.append(np.mean(np.array(observable_simulations), axis=0))
        obs_mins.append(
            np.min(np.array(observable_simulations), axis=0)
        )
        obs_maxs.append(
            np.max(np.array(observable_simulations), axis=0)
        )
        obs_stds.append(np.std(np.array(observable_simulations), axis=0))
        obs_quantiles.append(
            np.quantile(np.array(observable_simulations), quantiles, axis=0)
        )

    obs_means = np.array(obs_means)
    obs_maxs = np.array(obs_maxs)
    obs_mins = np.array(obs_mins)
    obs_stds = np.array(obs_stds)
    obs_quantiles = np.array(obs_quantiles)

    bar_kwargs = {
        "align": "edge",
        "width": -1 / 3,
    }

    # plot
    fig, axs = plt.subplots(figsize=(9, 8), constrained_layout=True)
    color = plt.rcParams["axes.prop_cycle"].by_key()["color"][0]

    x_names = [condition_id_to_label(petab_problem, condition.split("+")[0]) for
               condition in simu_condition_ids]

    if plot_measurements:
        meas_means = measurement_df[measurement_df['experimentId'] == e_id].groupby(
            ['simulationConditionId'])['measurement'].mean()
        meas_sem = measurement_df[measurement_df['experimentId'] == e_id].groupby(
            ['simulationConditionId'])['measurement'].std()

        axs.bar(
            x_names,
            meas_means,
            yerr=meas_sem,
            color=color,
            **bar_kwargs,
            label="measurement",
        )

    # plot individual measurement points
    x_pos = np.arange(len(x_names))
    for i, (name, group) in enumerate(
            measurement_df[measurement_df['experimentId'] == e_id]
                    .groupby('simulationConditionId')
    ):
        y = group['measurement'].values

        axs.scatter([x_pos[i]+bar_kwargs["width"]/2]*len(y), y, color='black', alpha=0.7, zorder=10)

    bar_kwargs["width"] = -bar_kwargs["width"]
    axs.bar(
        x_names,
        obs_means.flatten(),
        yerr=obs_stds.flatten(),
        color="white",
        edgecolor=color,
        **bar_kwargs,
        label="simulation",
    )

    axs.set_ylabel(f"relative pRII density")
    axs.set_title(f"{e_id}")
    plt.setp(axs.get_xticklabels(), rotation=25, ha="right")
    axs.legend()

    fig.tight_layout()
    if figurepath:
        os.makedirs(os.path.dirname(figurepath), exist_ok=True)
        plt.savefig(figurepath)
    plt.close(fig)


def visualize_ensemble_states(
    amici_model,
    petab_problem,
    ensemble_prediction,
    e_id,
    quantiles=(0.001, 0.999),
    figures_dir: str = "",
    state_name: str = "",
    subplots: tuple = None,
):
    plt.rcParams.update(
        {
            "font.size": 26,
            "figure.titlesize": "small",
            "xtick.labelsize": 24,
            "ytick.labelsize": 24,
            "lines.markersize": 12,
            "lines.linewidth": 4,
            "legend.fontsize": "x-small",
        }
    )

    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df["experimentId"] == e_id
    ]

    # select conditions per experiment
    simu_condition_ids = [
        f"model1_data49::{cond}"
        for cond in exp_measurements["simulationConditionId"].unique()
    ]
    sim_timepoints = None

    obs_means = []
    obs_maxs = []
    obs_mins = []
    obs_stds = []
    obs_quantiles = []
    observable_simulations_per_cond = []

    for i_cond in simu_condition_ids:
        observable_simulations = []
        for p_result in ensemble_prediction.prediction_results:
            c_ind = p_result.condition_ids.index(i_cond)
            cond_result = p_result.conditions[c_ind]
            # obs_ind = cond_result.output_ids.index(observable_id)

            if state_name == "total_5HT4":
                res = sum([cond_result.output[:, amici_model.getStateIds().index(state_name)]
                           for state_name in ['fiveHT4', 'fiveHT4_5HT']])  # total 5-HT4
                ylabel = "total 5-HT4 [au]"
            elif state_name=='total_MOR':
                res = sum([cond_result.output[:, amici_model.getStateIds().index(state_name)]
                           for state_name in ['MOR', 'MOR_DAMGO', 'MOR_Fentanyl']])
                ylabel = "total MOR [au]"
            else:
                state_id = amici_model.getStateIds().index(state_name)
                res = cond_result.output[:, state_id]
                ylabel = f"{amici_model.getStateIds()[state_id]} [au]"

            observable_simulations.append(res)
            if sim_timepoints is None:
                sim_timepoints = cond_result.timepoints

        observable_simulations_per_cond.append(observable_simulations)
        # compute mean and quantiles
        obs_means.append(np.mean(np.array(observable_simulations), axis=0))
        obs_stds.append(np.std(np.array(observable_simulations), axis=0))
        obs_mins.append(
            np.min(np.array(observable_simulations), axis=0)
        )
        obs_maxs.append(
            np.max(np.array(observable_simulations), axis=0)
        )
        obs_quantiles.append(
            np.quantile(np.array(observable_simulations), quantiles, axis=0)
        )

    obs_means = np.array(obs_means)
    obs_maxs = np.array(obs_maxs)
    obs_mins = np.array(obs_mins)
    obs_stds = np.array(obs_stds)
    obs_quantiles = np.array(obs_quantiles)

    # plot
    if subplots:
        fig_s, axs_s = plt.subplots(*subplots, figsize=(30, 16), constrained_layout=True)
        axs_s = axs_s.flatten()

    fig, axs = plt.subplots(figsize=(9, 8), constrained_layout=True)

    n_sim = len(ensemble_prediction.prediction_results)
    n_pick = min(10, n_sim)
    picks = np.random.choice(n_sim, size=n_pick, replace=False)

    for cond_index in range(len(simu_condition_ids)):
        condition = simu_condition_ids[cond_index].split("+")[0]

        if subplots:
            # subplot per condition with individual trajectories
            p = axs_s[cond_index].plot(
                sim_timepoints,
                obs_means[cond_index],
                color=tableau_colorblind10[cond_index],
                linestyle='--',
                label=f"{condition_id_to_label(petab_problem, condition)}",
            )
            axs_s[cond_index].fill_between(
                sim_timepoints,
                obs_mins[cond_index],
                obs_maxs[cond_index],
                alpha=0.35,
                color=tableau_colorblind10[cond_index],
            )

            # iterate over at most 10 random ensemble trajectories for this condition
            for idx in picks:
                o_s = observable_simulations_per_cond[cond_index][idx]
                p = axs_s[cond_index].plot(
                    sim_timepoints,
                    o_s,
                    color='k'
                )

        # overall plot with mean and uncertainty
        p = axs.plot(
            sim_timepoints,
            obs_means[cond_index],
            label=f"{condition_id_to_label(petab_problem, condition)}",
        )
        axs.fill_between(
            sim_timepoints,
            obs_mins[cond_index],
            obs_maxs[cond_index],
            alpha=0.35,
        )

    if subplots:
        # harmonize y-limits across subplots
        y_lims = [ax.get_ylim() for ax in axs_s]
        y_lim_top = max(lim[1] for lim in y_lims)
        y_lim_bottom = min(lim[0] for lim in y_lims)
        for ax in axs_s:
            ax.set_xlabel("Time [min]")
            ax.set_ylabel(ylabel)
            ax.set_ylim(y_lim_bottom, y_lim_top)
            ax.legend()
        fig_s.suptitle(f"{e_id}")

    axs.set_xlabel("Time [min]")
    axs.set_ylabel(ylabel)
    axs.set_title(f"{e_id}")
    axs.legend()

    os.makedirs(os.path.join(figures_dir, "subplots"), exist_ok=True)
    if subplots:
        fig_s.tight_layout()
        fig_s.savefig(os.path.join(
            figures_dir, "subplots",
            f"{e_id}__state_{state_name}_{len(ensemble_prediction.prediction_results)}.svg"
        ))
        plt.close(fig_s)

    fig.tight_layout()
    fig.savefig(os.path.join(
        figures_dir,
        f"{e_id}__state_{state_name}_{len(ensemble_prediction.prediction_results)}.svg"
    ))
    plt.close(fig)


def ensemble_parameters_plot(
    ensemble: Ensemble,
    ax: Optional[plt.Axes] = None,
    size: Optional[tuple[float, float]] = (20, 13),
    parameter_ids: Optional[list] = None,
) -> plt.Axes:
    """Plot ensemble parameter uncertainty for selected parameters.

    The plot shows the ensemble samples for each parameter (one horizontal
    row per parameter). Each ensemble member is plotted as a marker at the
    parameter value; the first ensemble vector (index 0) is highlighted in
    red. Vertical short lines indicate the per-parameter lower and upper
    bounds stored in the `Ensemble` object.

    Args:
        ensemble: A `pypesto.ensemble.Ensemble` containing `x_vectors`,
            `lower_bound`, `upper_bound` and `x_names`.
        ax: Optional Matplotlib Axes to draw into. If ``None`` a new figure
            and axes are created using `size`.
        size: Figure size used when creating a new figure (width, height).
        parameter_ids: Optional list of parameter indices (ints) or names
            (strings) to plot. If ``None`` all parameters in the ensemble
            are plotted.

    Returns:
        The Matplotlib Axes containing the plot.
    """

    if ax is None:
        fig, ax = plt.subplots(figsize=size)

    plt.rcParams.update({'font.size': 24,
                         'figure.titlesize': 'x-large',
                         'xtick.labelsize': 24,
                         'ytick.labelsize': 28,
                         'lines.markersize': 12,
                         'lines.linewidth': 3,
                         'legend.fontsize': 'x-small'
                         })

    if parameter_ids:
        x_vectors = ensemble.x_vectors[parameter_ids]
        n_vectors = len(parameter_ids)
    else:
        parameter_ids = np.arange(ensemble.n_x)
        x_vectors = ensemble.x_vectors
        n_vectors = ensemble.n_x

    lower_bound = ensemble.lower_bound[parameter_ids]
    upper_bound = ensemble.upper_bound[parameter_ids]

    x = -0.3
    x_b = -0.4
    w = 0.6
    rectangles = []
    boundaries = []

    for i, par_values in enumerate(x_vectors):
        h = np.max(par_values)-np.min(par_values)
        rectangles.append(
            Rectangle((np.min(par_values), x), h, w))
        boundaries.append(Rectangle((-5.2, x_b), lower_bound[i]+5.2, 1))
        boundaries.append(Rectangle((upper_bound[i], x_b), 5.2-upper_bound[i], 1))

        x += w+0.4
        x_b += 1

    ax.add_collection(PatchCollection(rectangles, facecolors=[1, 1, 1, 1], edgecolors="dimgrey"))
    ax.add_collection(PatchCollection(boundaries, facecolors=[0.8,0.8,0.8,0.5], edgecolors=None))

    ax.set_xlim(-5.2,5.2)

    cmap = matplotlib.colormaps['Greys']
    colors2 = np.flip(cmap(np.linspace(0.3, 0.8, (ensemble.n_vectors-1))), axis=0)
    colors2 = np.insert(colors2, 0, [1., 0., 0., 1.], axis=0)

    for idx, v in enumerate(x_vectors):
        ax.scatter(x=v, y=[idx]*ensemble.n_vectors, s=40, color=colors2, alpha=0.8, zorder=3)
    ax.scatter(x_vectors[:, 0], np.arange(n_vectors), s=40, color=[1., 0., 0., 1.], zorder=3)

    t = matplotlib.markers.MarkerStyle(marker='|')
    t._transform = t.get_transform().rotate_deg(45)

    for i in np.arange(n_vectors):
        ax.plot([ensemble.lower_bound[parameter_ids][i]]*2, [i-0.4, i+0.4], color='grey')
        ax.plot([ensemble.upper_bound[parameter_ids][i]]*2, [i-0.4, i+0.4], color='grey')

    plt.xticks(fontsize=20)

    def latex_names(x):
        x = x.replace('alpha', '$\\alpha$')
        x = x.replace('beta', '$\\beta$')
        x = x.replace('gamma', '$\\gamma$')
        return x

    yticks = [latex_names(np.asarray(ensemble.x_names)[i]) for i in parameter_ids]
    plt.yticks(np.arange(n_vectors), yticks, fontsize=25)
    plt.tight_layout()

    return ax


def visualize_ensemble_comparison(results_folder, figures_dir):
    result = read_optimization_results(
        os.path.join(results_folder, "result.h5"),
        os.path.join(results_folder, "histories", "hist_result_100.h5"),
        read_histories=True,
    )

    alpha = 0.01
    th = stats.chi2.ppf(1 - alpha, 1) / 2

    my_ensemble = Ensemble.from_optimization_endpoints(result,
                                                       max_size=5,
                                                       rel_cutoff=th
                                                    )
    my_ensemble_hist = Ensemble.from_optimization_history(result,
                                                          max_size=5,
                                                          rel_cutoff=th)

    for ensemble, pf in zip([my_ensemble, my_ensemble_hist], ['endpoints', 'history']):
        scaling_p = []
        model_p = []
        scaling_p_ids = []
        model_p_ids = []
        for idx, x_name in enumerate(ensemble.x_names):
            l = min(ensemble.x_vectors[idx]) - ensemble.lower_bound[idx]
            u = ensemble.upper_bound[idx] - max(ensemble.x_vectors[idx])
            if x_name.startswith('s_') or x_name.startswith('b_') or x_name.startswith(
                    'rho_') or 'rel_open' in x_name:
                scaling_p.append(x_name)
                scaling_p_ids.append(idx)
            else:
                model_p.append(x_name)
                model_p_ids.append(idx)

        ax = ensemble_parameters_plot(
           ensemble, parameter_ids=model_p_ids, size=(15, 20))
        plt.tight_layout()
        for ext in ['png', 'svg']:
           plt.savefig(os.path.join(figures_dir, 'parameter_uncertainty',
                                    f'ens_parameters_plot_99_modelparams_opt_{pf}.{ext}'))

        ax = ensemble_parameters_plot(ensemble, parameter_ids=scaling_p_ids, size=(20, 20))
        plt.tight_layout()
        for ext in ['png', 'svg']:
            plt.savefig(os.path.join(figures_dir, 'parameter_uncertainty',
                                     f'ens_parameters_plot_99_obsparams_opt_{pf}.{ext}'))


if __name__ == "__main__":
    base_dir = "../model/"
    with open(os.path.join(base_dir, "config.yaml"), "r") as file:
        config = yaml.safe_load(file)

    model_name = config["model_name"]
    petab_dir = os.path.join(base_dir, "petab")
    yaml_file = os.path.join(petab_dir, config["petab_model_yaml"])
    results_dir = os.path.join(base_dir, "results_full")
    figures_dir = os.path.join(results_dir, "figures")

    os.makedirs(figures_dir, exist_ok=True)

    model, model_petab_problem = _model_import(
        base_dir=base_dir,
        yaml_file=yaml_file,
        model_name=model_name,
        # force_compile=True
    )
    measurement_df = copy.deepcopy(model_petab_problem.measurement_df)
    measurement_df_smooth = petab.v1.get_measurement_df(
        os.path.join(petab_dir, "measurements_smooth.tsv")
    )
    model_petab_problem.measurement_df = measurement_df_smooth

    visualize_ensemble_comparison(results_dir, figures_dir)

    # Fig 3 (from_hist=False) and Fig 5 (from_hist=True)
    # observables
    _, prediction = create_prediction(
        base_dir,
        model,
        model_petab_problem,
        results_dir,
        max_n_vectors=np.inf,
        tolerances=config["tolerances"],
        from_hist=False,
        simulate_states=False,
    )

    dataset_ids1 = [
        ('JI09_150330_Drg353_351_CycNuc__4_ABnOH_and_ctrl', 'fourABnOH_level'),
        ('JI09_150330_Drg353_351_CycNuc__4_ABnOH_and_Fsk', 'fourABnOH_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp_cAMPS_pAB_and_ctrl', 'Rp_cAMPS_pAB_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp_cAMPS_pAB_and_Fsk', 'Rp_cAMPS_pAB_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp8_Br_cAMPS_pAB_and_ctrl', 'Rp8_Br_cAMPS_pAB_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp8_Br_cAMPS_pAB_and_Fsk', 'Rp8_Br_cAMPS_pAB_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp8_pCPT_cAMPS_pAB_and_ctrl', 'Rp8_pCPT_cAMPS_pAB_level'),
        ('JI09_150330_Drg353_351_CycNuc__Rp8_pCPT_cAMPS_pAB_and_Fsk', 'Rp8_pCPT_cAMPS_pAB_level'),
    ]
    dataset_ids2 = [
        ('JI09_150302_Drg345_343_CycNuc__4_ABnOH_and_ctrl', 'fourABnOH_time'),
        ('JI09_150302_Drg345_343_CycNuc__4_ABnOH_and_Fsk', 'fourABnOH_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp_cAMPS_pAB_and_ctrl', 'Rp_cAMPS_pAB_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp_cAMPS_pAB_and_Fsk', 'Rp_cAMPS_pAB_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp8_Br_cAMPS_pAB_and_ctrl',
         'Rp8_Br_cAMPS_pAB_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp8_Br_cAMPS_pAB_and_Fsk', 'Rp8_Br_cAMPS_pAB_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp8_pCPT_cAMPS_pAB_and_ctrl', 'Rp8_pCPT_cAMPS_pAB_time'),
        ('JI09_150302_Drg345_343_CycNuc__Rp8_pCPT_cAMPS_pAB_and_Fsk', 'Rp8_pCPT_cAMPS_pAB_time'),
    ]


    # Figure 3 (if from_hist=False) and Figure 5 (if from_hist=True)
    datasets = [dataset_ids1, dataset_ids2]
    xlabel = ["Concentration [$\mu$M]", "Incubation Time [min]"]
    scales = ['log', 'linear']
    for i, exp_id in enumerate([
        'JI09_150330_Drg353_351_CycNuc',
        'JI09_150302_Drg345_343_CycNuc'
    ]):
        observable_id = "pRII_Microscopy"
        visualize_doseresponse_ensemble(
            exp_id,
            datasets[i],
            measurement_df,
            model_petab_problem,
            prediction,
            plot_measurements=True,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", exp_id,
                                        f"{exp_id}_{len(prediction.prediction_results)}_"
                                        f"{observable_id}_"
                                        f"measurements_minmaxband.svg"),
            xlabel=xlabel[i],
            add_scaling=False,
            scale=scales[i]
        )


    for e_id in [
        "JI09_150330_Drg350_348_CycNuc",
        "JI09_151102_Drg421_418_Age",
        "JI09_160201_Drg453_452_CycNuc", # C_alpha observable
        "LK020_18_LK014_12_MOR_Kinetik_DAMGO_5HT",
        "LK15_150810_LK053_52_047_46_MOR_Kinetic_Fentanyl_5HT",
        "LK15_150727_LK051_48_MOR_Kinetic_10min_Fentanyl_Fsk",
        "LK041_39_MOR_Kinetic_Fentanyl_Fsk",
        "JI09_140331_Drg270_267_TiM",
        "LK023_21_MOR_Kinetik_DAMGO_Fsk"
    ]:
        observable_id = "pRII_Microscopy"
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df = measurement_df,
            e_id=e_id,
            observable_id = observable_id,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
            plot_measurements=True
        )

        observable_id = "pRII_Microscopy_LK15_150727"
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df = measurement_df,
            e_id=e_id,
            observable_id = observable_id,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
            plot_measurements=True
        )

        observable_id = "Calpha_Microscopy"
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df = measurement_df,
            e_id=e_id,
            observable_id = observable_id,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
            plot_measurements=True
        )

    for e_id in [
        "JI09_160126_Drg449_444_CycNuc"
    ]:
        observable_id = "pRII_Western"
        visualize_ensemble_barplot(
            model_petab_problem,
            prediction,
            measurement_df = measurement_df,
            e_id=e_id,
            observable_id = observable_id,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
            plot_measurements=True
        )

    # for Supplementary Figure S4:
    # states
    ensemble, prediction = create_prediction(
        base_dir,
        model,
        model_petab_problem,
        results_dir,
        max_n_vectors=np.inf,
        tolerances=config["tolerances"],
        from_hist=True,
        simulate_states=True,
    )

    for e_id in [
        "LK023_21_MOR_Kinetik_DAMGO_Fsk",
        "LK020_18_LK014_12_MOR_Kinetik_DAMGO_5HT",
    ]:
        for state_name in [
            "fiveHT4",
            "fiveHT4_5HT",
            "MOR",
            "MOR_DAMGO",
            "MOR_Fentanyl",
            "alphaS_GTP",
            "alphaI_GTP",
            "AC_alphaS_GTP",
            "AC_alphaI_GTP",
            "AC",
            "cAMP",
            "Csub",
            "RII_C_2",
            "RIIp_2",
            "RIIp_C_2",
            "RIIp_cAMP_C_2",
            "RIIp_cAMP_2",
        ]:
            state_id = model.getStateIds().index(state_name)

            visualize_ensemble_states(
                model,
                model_petab_problem,
                prediction,
                e_id=e_id,
                figures_dir=os.path.join(figures_dir, "ensemble_simulation", "states", e_id),
                state_name=state_name,
                subplots=(2,3) # to visualize multiple trajectories
            )
