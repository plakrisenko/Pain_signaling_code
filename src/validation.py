import amici
import copy
import os
import yaml

from typing import Tuple

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import petab
import scipy.stats as stats

from pypesto.ensemble import Ensemble
from scipy.optimize import minimize

from ensemble import create_prediction, visualize_ensemble
from utils import (
    _model_import,
    create_pypesto_problem,
    read_optimization_results,
    dataset_id_to_label
)

plt.style.use("tableau-colorblind10")


def custom_simulate_ensemble(
        par_ensemble,
        original_pypesto_problem,
        petab_problem,
        objective_customizer=None,
):
    meas_df = copy.deepcopy(petab_problem.measurement_df)

    rdatas_list = []

    pypesto_problem = original_pypesto_problem
    objective = pypesto_problem.objective._objectives[0]
    objective.pre_post_processor = pypesto_problem.objective._objectives[0].pre_post_processor

    if objective_customizer is None:
        pypesto_problem.objective._objectives[0].amici_solver.setMaxSteps(10 ** 6)
        pypesto_problem.objective._objectives[0].amici_solver.setRelativeTolerance(1e-12)
        pypesto_problem.objective._objectives[0].amici_solver.setAbsoluteTolerance(1e-8)
    else:
        objective_customizer(pypesto_problem.objective)

    parameter_mapping = pypesto_problem.objective._objectives[0].parameter_mapping

    for index in range(par_ensemble.n_vectors):

        edatas = copy.deepcopy(pypesto_problem.objective._objectives[0].edatas)
        amici_model = pypesto_problem.objective._objectives[0].amici_model
        amici_solver = pypesto_problem.objective._objectives[0].amici_solver

        x = par_ensemble.x_vectors[:, index]

        objective_result = pypesto_problem.objective._objectives[0](x, return_dict=True)

        x_full = pypesto_problem.get_full_vector(par_ensemble.x_vectors[:, index],
                                                 x_fixed_vals=pypesto_problem.x_fixed_vals)

        x_dct = dict(zip(pypesto_problem.x_names, x_full))
        try:
            inner_parameters = objective_result['inner_parameters']
            inner_par_dict = dict(zip(pypesto_problem.inner_x_names, inner_parameters))
            x_dct.update(inner_par_dict)
        except:
            pass

        amici.petab.simulations.fill_in_parameters(
            edatas=edatas,
            problem_parameters=x_dct,
            scaled_parameters=True,
            parameter_mapping=parameter_mapping,
            amici_model=amici_model,
        )

        rdatas = amici.runAmiciSimulations(
            amici_model,
            amici_solver,
            edatas,
            failfast=False
        )
        if rdatas[0].status != 0 or rdatas[1].status != 0:
            print(f'Error in simulation {index}')
        else:
            rdatas_list.append(rdatas)  # rdata per ensemble entry
    return rdatas_list


def custom_visualize_doseresponse_ensemble(
        e_id,
        dataset_ids_and_params: list[Tuple[str, str]],
        measurement_df,
        petab_problem,
        rdatas_list,
        quantiles: float = (0.005, 0.995),
        plot_measurements=False,
        plot_trajectories=False,
        savefig=False,
        figurepath="output/ensemble_fit.png",
        xlabel="Concentration [$\mu$M]",
        add_scaling=False,
        scale='log'
):
    obs_index = 0

    observable_ids = petab_problem.get_observable_ids()

    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df['experimentId'] == e_id]

    def transform_dose(d):
        return d if d != 0 else 0.0001

    def compute_scaling(ms, ss, std):
        def sse(s):
            return np.sum((ms - ss * s) ** 2 / std)

        res = minimize(sse, 1)
        return res.x[0]

    sim_x = []

    simu_condition_ids = []
    for d_i, _ in dataset_ids_and_params:
        dataset_simu_condition_ids = [
            f'{cond}+model1_data49' for cond in
            exp_measurements[exp_measurements['datasetId'] == d_i][
                'simulationConditionId'].unique()]
        simu_condition_ids.append(dataset_simu_condition_ids)

    obs_means = []
    obs_stds = []
    obs_quantiles = []
    state_means = []
    state_stds = []
    state_quantiles = []

    # compute scalings
    scalings = {}
    for index in range(len(rdatas_list)):
        ms = []
        std = []
        ss = []
        for i, (d, p) in enumerate(dataset_ids_and_params):
            rdatas = [rdata for rdata in rdatas_list[index] if
                      rdata.id in simu_condition_ids[i]]

            # use actual measurements df for scaling computation,
            # not extended measurements df for simulaton

            ms.extend(
                measurement_df[(measurement_df['datasetId'] == d)].groupby('simulationConditionId')[
                    'measurement'].mean())
            std.extend(
                measurement_df[(measurement_df['datasetId'] == d)].groupby('simulationConditionId')[
                    'measurement'].std())
            ss.extend([np.mean(rdata.y[:, 0]) for rdata in rdatas if rdata.id.split('+')[0] in
                       measurement_df[(measurement_df['datasetId'] == d)].groupby(
                           'simulationConditionId')[
                           'measurement'].mean().index])

        scaling = compute_scaling(np.asarray(ms), np.asarray(ss), np.asarray(std))
        scalings[index] = scaling

    for i, (d, p) in enumerate(dataset_ids_and_params):  # iterate over datasets
        observable_simulations = []
        state_simulations = []
        for index in range(len(rdatas_list)):  # iterate over ensemble entries

            rdatas = [rdata for rdata in rdatas_list[index] if
                      rdata.id in simu_condition_ids[i]]

            doses = [transform_dose(petab_problem.condition_df.loc[rdata.id.split('+')[0]][p]) for
                     rdata in rdatas]
            if add_scaling:
                obs = [rdata.y[0][0] * scalings[index] for rdata in
                       rdatas]
            else:
                obs = [rdata.y[0][0] for rdata in rdatas]

            sorted_values = sorted(zip(doses, obs))
            doses, obs = zip(*sorted_values)

            observable_simulations.append(obs)

        # collect doses per dataset
        sim_x.append(doses)

        observable_simulations = np.array(observable_simulations)

        # compute mean and quantiles
        obs_means.append(np.mean(np.array(observable_simulations), axis=0))
        obs_stds.append(np.std(np.array(observable_simulations), axis=0))
        obs_quantiles.append(np.quantile(np.array(observable_simulations), quantiles, axis=0))

        if plot_trajectories:
            state_means.append(np.mean(np.array(state_simulations), axis=0))
            state_stds.append(np.std(np.array(state_simulations), axis=0))
            state_quantiles.append(np.quantile(np.array(state_simulations), quantiles, axis=0))

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

    fig, axs = plt.subplots(figsize=(9, 6.4), constrained_layout=True)

    relative_errors = []
    for d_index in range(len(simu_condition_ids)):
        rel_errors_per_condition = []

        p = axs.plot(sim_x[d_index], obs_means[d_index],
                     label=f"{dataset_id_to_label(petab_problem, dataset_ids_and_params[d_index][0])}")
        axs.fill_between(sim_x[d_index], obs_quantiles[d_index, 0],
                         obs_quantiles[d_index, 1], alpha=0.35)

        meas_color = p[0].get_color() if p else None
        if plot_measurements:
            mes_x = [transform_dose(
                petab_problem.condition_df.loc[s_c][dataset_ids_and_params[d_index][1]]) for s_c in
                     measurement_df[
                         measurement_df['datasetId'] == dataset_ids_and_params[d_index][0]][
                         'simulationConditionId'].unique()]

            meas_means = \
            measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                           (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                               0])].groupby(
                'simulationConditionId')['measurement'].mean()

            # compute relative errors
            for i, mx in enumerate(mes_x):
                sim_x_idx = np.where(np.array(sim_x[d_index]) == mx)[0][0]
                rel_errors_per_condition.append(np.abs(
                    (meas_means.iloc[i] - obs_means[d_index][sim_x_idx]) / meas_means.iloc[i]))
            relative_errors.append(rel_errors_per_condition)

            meas_std = \
            measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                           (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                               0])].groupby(
                'simulationConditionId')['measurement'].std()
            sqrt_n = np.sqrt(
                measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                               (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                   0])].groupby(
                    'simulationConditionId')['measurement'].size() - 1)
            meas_sem = meas_std / sqrt_n
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

    errors_df = pd.DataFrame(relative_errors, columns=mes_x)
    errors_df['mean'] = errors_df.mean(axis=1)
    errors_df.to_csv(
        os.path.join(os.path.dirname(figurepath), f'relative_errors_{e_id}_{len(rdatas_list)}.tsv'),
        sep='\t', index=False)

    fig.tight_layout()
    if savefig:
        plt.savefig(figurepath)


def custom_visualize_dataset14_ensemble(
        e_id,
        dataset_ids_and_params: list[Tuple[str, str]],
        measurement_df,
        petab_problem,
        rdatas_list,
        quantiles: float = (0.005, 0.995),
        plot_measurements=False,
        plot_trajectories=False,
        savefig=False,
        figurepath="output/ensemble_fit.png",
):
    obs_index = 0
    # set rcparams before figure creation
    plt.rcParams.update(
        {
            "font.size": 18,
            "figure.titlesize": "medium",
            "xtick.labelsize": 18,
            "ytick.labelsize": 18,
            "lines.markersize": 12,
            "lines.linewidth": 3,
            "legend.fontsize": "small",
        }
    )
    fig, axs = plt.subplots(figsize=(7, 5), constrained_layout=True)

    observable_ids = petab_problem.get_observable_ids()

    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df['experimentId'] == e_id]

    sim_x = []

    simu_condition_ids = []
    for d_i, _ in dataset_ids_and_params:
        dataset_simu_condition_ids = [
            f'{cond}+model1_data49' for cond in
            exp_measurements[(exp_measurements['datasetId'] == d_i)][
                'simulationConditionId'].unique()]
        simu_condition_ids.append(dataset_simu_condition_ids)

    obs_means = []
    obs_stds = []
    obs_quantiles = []
    state_means = []
    state_stds = []
    state_quantiles = []

    scalings = {}
    relative_errors = []
    for i, (d, p) in enumerate(dataset_ids_and_params):  # iterate over datasets
        observable_simulations = []
        state_simulations = []
        dataset_rel_errors = []

        for index in range(len(rdatas_list)):  # iterate over ensemble entries
            # keep only relevant conditions
            rdatas = [rdata for rdata in rdatas_list[index] if
                      rdata.id in simu_condition_ids[i]]

            if len(rdatas) == 1:
                measurement = np.mean(measurement_df[(measurement_df['datasetId'] == d) &
                                                     (measurement_df['time'] == 0)][
                                          'measurement'])  # at t=0
                scaling = measurement / rdatas[0].y[0, 0]
                if index not in scalings:
                    scalings[index] = scaling
                unique_vals, first_indices = np.unique(rdatas[0].ts, return_index=True)
                first_indices = first_indices[1:]
                unique_vals = unique_vals[1:] - 2
                observable_simulations.append(
                    rdatas[0].y[first_indices, 0] * scaling)
                if index == 0:
                    sim_x.append(unique_vals)

            else:
                simulation = [rdata.y[-1, 0] * scalings[index] for rdata in rdatas]
                observable_simulations.append(
                    simulation)

                if index == 0:
                    sim_x.append(
                        [petab_problem.condition_df.loc[rdata.id.split('+')[0]][p] for rdata in
                         rdatas])

        observable_simulations = np.array(observable_simulations)

        if plot_trajectories:
            for simulation in observable_simulations:
                p = axs.plot(sim_x[-1], simulation, color='k')

        # compute mean and quantiles
        obs_means.append(np.nanmean(np.array(observable_simulations), axis=0))
        obs_stds.append(np.nanstd(np.array(observable_simulations), axis=0))
        obs_quantiles.append(np.nanquantile(np.array(observable_simulations), quantiles, axis=0))


    print("Mean relative error:", np.mean(relative_errors) * 100)

    obs_means = np.array(obs_means)
    obs_stds = np.array(obs_stds)
    obs_quantiles = np.array(obs_quantiles)
    state_means = np.array(state_means)
    state_stds = np.array(state_stds)
    state_quantiles = np.array(state_quantiles)

    for d_index in range(len(simu_condition_ids)):
        rel_errors_per_condition = []

        p = axs.plot(
            sim_x[d_index], obs_means[d_index],
            label=f"{dataset_id_to_label(petab_problem, dataset_ids_and_params[d_index][0])}")
        axs.fill_between(sim_x[d_index], obs_quantiles[d_index, 0],
                         obs_quantiles[d_index, 1], alpha=0.35)

        meas_color = p[0].get_color() if p else None
        if plot_measurements:
            if dataset_ids_and_params[d_index][1] == 'time':  # control conditions
                mes_x = [0, 1, 2, 5, 10, 30]
                meas_means = \
                measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                               (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                   0])].groupby('time')['measurement'].mean()[1:]
                meas_std = \
                measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                               (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                   0])].groupby(
                    'time')['measurement'].std()[1:]
                sqrt_n = np.sqrt(
                    measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                                   (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                       0])].groupby('time')['measurement'].size() - 1)[1:]
                # compute relative errors
                for i, mx in enumerate(mes_x):
                    sim_x_idx = np.where(np.array(sim_x[d_index]) == mx)[0][0]
                    rel_errors_per_condition.append(
                        np.abs(
                            (meas_means.iloc[i] - obs_means[d_index][sim_x_idx]) / meas_means.iloc[
                                i]))
                relative_errors.append(rel_errors_per_condition)
            else:
                mes_x = [petab_problem.condition_df.loc[s_c][dataset_ids_and_params[d_index][1]] for
                         s_c in measurement_df[
                             (measurement_df['datasetId'] == dataset_ids_and_params[d_index][0]) &
                             (measurement_df['time'] != 0)]['simulationConditionId'].unique()]
                mes_x = sorted(mes_x)

                meas_means = \
                measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                               (measurement_df['time'] != 0) &
                               (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                   0])].groupby('simulationConditionId')['measurement'].mean()

                meas_std = \
                measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                               (measurement_df['time'] != 0) &
                               (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                   0])].groupby(
                    'simulationConditionId')['measurement'].std()
                sqrt_n = np.sqrt(
                    measurement_df[(measurement_df['observableId'] == observable_ids[obs_index]) &
                                   (measurement_df['time'] != 0) &
                                   (measurement_df['datasetId'] == dataset_ids_and_params[d_index][
                                       0])].groupby('simulationConditionId')[
                        'measurement'].size() - 1)

                # compute relative errors
                if 0 not in mes_x:
                    rel_errors_per_condition.append(np.nan)
                for i, mx in enumerate(mes_x):
                    sim_x_idx = np.where(np.array(sim_x[d_index]) == mx)[0][0]
                    rel_errors_per_condition.append(
                        np.abs(
                            (meas_means.iloc[i] - obs_means[d_index][sim_x_idx]) / meas_means.iloc[
                                i]))
                relative_errors.append(rel_errors_per_condition)

            meas_sem = meas_std / sqrt_n
            axs.scatter(mes_x, meas_means, color=meas_color)
            axs.errorbar(mes_x,
                         meas_means,
                         yerr=meas_sem,
                         fmt='o',
                         color=meas_color)

    errors_df = pd.DataFrame(relative_errors, columns=mes_x)
    errors_df['mean'] = errors_df.mean(axis=1)
    errors_df.to_csv(
        os.path.join(os.path.dirname(figurepath), f'relative_errors_{e_id}_{len(rdatas_list)}.tsv'),
        sep='\t', index=False)

    axs.set_xlabel("Pre-treatment duration [min]")
    axs.set_ylabel(f"{observable_ids[obs_index]} [au]")
    axs.set_title(f"{e_id}")
    axs.set_xticks([0, 1, 2, 5, 10, 15, 20, 25, 30])
    axs.legend()

    fig.tight_layout()
    if savefig:
        plt.savefig(figurepath)


def custom_simulate_and_visualize_ensemble(
        par_ensemble,
        original_pypesto_problem,
        petab_problem,
        measurement_df,
        figures_dir: str,
        quantiles: float = (0.001, 0.999),
        plot_measurements=False,
        plot_states=False,
        savefig=False,
        objective_customizer=None,
):
    rdatas_list = custom_simulate_ensemble(
        par_ensemble,
        original_pypesto_problem,
        petab_problem,
        objective_customizer=objective_customizer
    )

    for exp_id in ['JI09_160112_Drg443_442_DelayDoseResponse']:
        custom_visualize_dataset14_ensemble(
            exp_id,
            [
                ('JI09_160112_Drg443_442_DelayDoseResponse__Ctrl_and_Ctrl', 'time'),
                ('JI09_160112_Drg443_442_DelayDoseResponse__Fent_and_Ctrl', 'time'),
                ('JI09_160112_Drg443_442_DelayDoseResponse__Ctrl_and_5HT', 'fiveHT_time'),
                ('JI09_160112_Drg443_442_DelayDoseResponse__Ctrl_and_Fsk', 'Fsk_time'),
                ('JI09_160112_Drg443_442_DelayDoseResponse__Fent_and_5HT', 'fiveHT_time'),
                ('JI09_160112_Drg443_442_DelayDoseResponse__Fent_and_Fsk', 'Fsk_time')],
            measurement_df,
            petab_problem,
            rdatas_list,
            quantiles=quantiles,
            plot_measurements=plot_measurements,
            plot_trajectories=plot_states,
            savefig=savefig,
            figurepath=os.path.join(
                figures_dir,
                f'ensemble_fit_{exp_id}_{par_ensemble.n_vectors}_smooth.svg')
            )

    # 'LK038_35_MOR_DoseResponse_FentanylDAMGO_pH'
    dataset_ids1 = [
        ('LK038_35_MOR_DoseResponse_FentanylDAMGO_pH___DAMGO', 'DAMGO_level'),
        ('LK038_35_MOR_DoseResponse_FentanylDAMGO_pH___Fentanyl', 'Fentanyl_level')
    ]

    datasets = [dataset_ids1]
    xlabel = ["Concentration [$\mu$M]"]
    scales = ['log']
    for i, exp_id in enumerate(['LK038_35_MOR_DoseResponse_FentanylDAMGO_pH']):
        custom_visualize_doseresponse_ensemble(
            exp_id,
            datasets[i],
            measurement_df,
            petab_problem,
            rdatas_list,
            quantiles=quantiles,
            plot_measurements=plot_measurements,
            plot_trajectories=plot_states,
            savefig=savefig,
            figurepath=os.path.join(
                figures_dir,
                f'ensemble_fit_{exp_id}_{scales[i]}_{par_ensemble.n_vectors}.svg'),
            xlabel=xlabel[i],
            scale=scales[i],
            add_scaling=True
        )


def compute_relative_errors(petab_problem,
                            ensemble_prediction,
                            measurement_df,
                            e_id,
                            output_dir: str,
                            observable_id: str = "pRII_Microscopy"):
    exp_measurements = petab_problem.measurement_df[
        petab_problem.measurement_df["experimentId"] == e_id
        ]
    # select conditions per experiment
    simu_condition_ids = [
        f"model1_data49::{cond}"
        for cond in exp_measurements["simulationConditionId"].unique()
    ]
    sim_timepoints = None

    relative_errors = []
    for i_cond in simu_condition_ids:
        condition = i_cond.split("::")[1]
        m_timepoints = measurement_df[measurement_df['experimentId'] == e_id]['time'].unique()
        meas_means = [np.mean(
            measurement_df[
                (measurement_df['time'] == t) & (measurement_df['observableId'] == observable_id) &
                (measurement_df['simulationConditionId'] == condition)][
                'measurement'].values)
            for t in m_timepoints]

        relative_errors_per_cond = []
        observable_simulations = []
        for p_result in ensemble_prediction.prediction_results:
            c_ind = p_result.condition_ids.index(i_cond)
            cond_result = p_result.conditions[c_ind]
            obs_ind = cond_result.output_ids.index(observable_id)

            unique_vals, first_indices = np.unique(cond_result.timepoints, return_index=True)

            observable_simulations.append(
                cond_result.output[first_indices, obs_ind])  # take first replicate
            if sim_timepoints is None:
                sim_timepoints = cond_result.timepoints[first_indices]

        for i, t in enumerate(m_timepoints[1:]):
            simu_means = np.mean(np.array(observable_simulations), axis=0)
            s_idx = np.where(sim_timepoints == t)[0]
            relative_errors_per_cond.append(
                np.abs((meas_means[1:][i] - simu_means[s_idx]) / meas_means[i])[0])
        relative_errors.append(relative_errors_per_cond)
    errors_df = pd.DataFrame(relative_errors, columns=m_timepoints[1:])
    errors_df['mean'] = errors_df.mean(axis=1)
    errors_df.to_csv(
        os.path.join(output_dir,
                     f'relative_errors_{e_id}_{len(ensemble_prediction.prediction_results)}.tsv'),
                     sep='\t', index=False)
    print("Mean relative error:", np.mean(relative_errors) * 100)


def simulate_and_visualize_exp2(config, from_hist=True):
    model_name = config["model_name"] + "exp2"
    petab_dir = os.path.join(base_dir, "petab", "validation", "exp2")
    yaml_file = os.path.join(petab_dir, config["petab_model_yaml"])
    results_dir = os.path.join(base_dir,
                               "results")
    figures_dir = os.path.join(results_dir, "figures", "validation")

    os.makedirs(figures_dir, exist_ok=True)

    model, model_petab_problem = _model_import(
        base_dir=base_dir,
        yaml_file=yaml_file,
        model_name=model_name,
        force_compile=True
    )
    measurement_df = copy.deepcopy(model_petab_problem.measurement_df)
    measurement_df_smooth = petab.v1.get_measurement_df(
        os.path.join(petab_dir, "measurementData_exp2_smooth.tsv")
    )
    model_petab_problem.measurement_df = measurement_df_smooth

    # observables
    _, prediction = create_prediction(
        base_dir,
        model,
        model_petab_problem,
        results_dir,
        max_n_vectors=np.inf,
        tolerances=config["tolerances"],
        from_hist=from_hist,
        simulate_states=False,
    )
    compute_relative_errors(model_petab_problem, prediction, measurement_df,
                            e_id="JI09_150330_Drg350_348_CycNuc",
                            output_dir=figures_dir)

    figsize = (9, 6.4)

    for e_id in [
        "JI09_150330_Drg350_348_CycNuc",
    ]:
        observable_id = "pRII_Microscopy"
        # Figure 6a
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df=measurement_df,
            e_id=e_id,
            observable_id=observable_id,
            figurepath=os.path.join(figures_dir, e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements.svg"),
            plot_measurements=True,
            figsize=figsize
        )

        observable_id = "pRII_Microscopy_LK15_150727"
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df=measurement_df,
            e_id=e_id,
            observable_id=observable_id,
            figurepath=os.path.join(figures_dir, e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements.svg"),
            plot_measurements=True,
            figsize=figsize
        )

        observable_id = "Calpha_Microscopy"
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df=measurement_df,
            e_id=e_id,
            observable_id=observable_id,
            figurepath=os.path.join(figures_dir, e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements.svg"),
            plot_measurements=True,
            figsize=figsize
        )


if __name__ == "__main__":
    base_dir = "../model/"
    with open(os.path.join(base_dir, "config.yaml"), "r") as file:
        config = yaml.safe_load(file)

    # validation of dataset 2, Figure 6a
    simulate_and_visualize_exp2(config, from_hist=True)

    # validation of dataset 13 and 14 with scaling estimation, Figure 6b and 6c
    exp_with_scaling_estimate = True
    if exp_with_scaling_estimate:
        petab_dir = os.path.join(base_dir, "petab", "validation")
        yaml_file = os.path.join(petab_dir, "PKAcycleMOR_validation.yaml")
        results_dir = os.path.join(base_dir, "results")
        figures_dir = os.path.join(results_dir, "figures")

        os.makedirs(figures_dir, exist_ok=True)

        model_name = config["model_name"] + "exp13_14"
        model, model_petab_problem = _model_import(
            base_dir=base_dir,
            yaml_file=yaml_file,
            model_name=model_name,
            force_compile=True
        )

        measurement_df = petab.v1.get_measurement_df(
            os.path.join(petab_dir, 'measurementData_PKAcycleMOR_only_validation.tsv'))

        result = read_optimization_results(
            os.path.join(results_dir, 'result.h5'),
            os.path.join(results_dir, "histories", 'hist_result.h5'),
            read_histories=True)

        alpha = 0.01
        th = stats.chi2.ppf(1 - alpha, 1) / 2

        from_hist = True
        if from_hist:
            my_ensemble = Ensemble.from_optimization_history(result,
                                                             max_size=np.inf,
                                                             rel_cutoff=th
                                                             )
        else:
            my_ensemble = Ensemble.from_optimization_endpoints(result,
                                                               max_size=np.inf,
                                                               rel_cutoff=th
                                                               )

        # for validation simulations where scaling wasn't estimated during parameter estimation
        excluded_params = ['s_pRII_JI09_150302_Drg345_343_CycNuc',
                           's_pRII_JI09_150330_Drg353_351_CycNuc',
                           's_pRII_JI09_151102_Drg421_418_Age',
                           's_pRII_LK041_39_MOR_Kinetic_Fentanyl_Fsk',
                           's_pRII_LK023_21_MOR_Kinetik_DAMGO_Fsk',
                           's_pRII_LK15_150810_LK053_52_047_46_MOR_Kinetic_Fentanyl_5HT',
                           's_pRII_LK15_150727_LK051_48_MOR_Kinetic_10min_Fentanyl_Fsk',
                           's_pRII_LK020_18_LK014_12_MOR_Kinetik_DAMGO_5HT',
                           's_pRII_JI09_140331_Drg270_267_TiM']

        # remove parameters
        x_names_free = np.asarray(result.problem.x_names)[result.problem.x_free_indices]
        param_indices_remove = [idx for idx in range(len(x_names_free)) if
                                x_names_free[idx] in excluded_params]
        param_indices_keep = [idx for idx in range(len(x_names_free)) if
                              x_names_free[idx] not in excluded_params]
        my_ensemble.x_vectors = np.delete(my_ensemble.x_vectors, param_indices_remove, axis=0)

        my_ensemble.lower_bound = np.asarray(my_ensemble.lower_bound)[param_indices_keep]
        my_ensemble.upper_bound = np.asarray(my_ensemble.upper_bound)[param_indices_keep]
        my_ensemble.x_names = np.asarray(my_ensemble.x_names)[param_indices_keep]
        my_ensemble.n_x = len(param_indices_keep)

        # add parameters
        my_ensemble.x_vectors = np.insert(my_ensemble.x_vectors, [66, 66],
                                          [0] * my_ensemble.n_vectors,
                                          axis=0)

        my_ensemble.x_names = np.insert(my_ensemble.x_names, len(my_ensemble.x_names) - 1,
                                        's_pRII_JI09_160112_Drg443_442_DelayDoseResponse')
        my_ensemble.x_names = np.insert(my_ensemble.x_names, len(my_ensemble.x_names) - 1,
                                        's_pRII_LK038_35_MOR_DoseResponse_FentanylDAMGO_pH')

        my_ensemble.lower_bound = np.insert(my_ensemble.lower_bound,
                                            len(my_ensemble.lower_bound) - 1, -3)
        my_ensemble.lower_bound = np.insert(my_ensemble.lower_bound,
                                            len(my_ensemble.lower_bound) - 1, -3)

        my_ensemble.upper_bound = np.insert(my_ensemble.upper_bound,
                                            len(my_ensemble.upper_bound) - 1, 3)
        my_ensemble.upper_bound = np.insert(my_ensemble.upper_bound,
                                            len(my_ensemble.upper_bound) - 1, 3)

        my_ensemble.n_x += 2

        pypesto_problem, startpoint_method, importer = create_pypesto_problem(
            base_dir, model, model_petab_problem, config['tolerances'])

        pypesto_problem.objective._objectives[0].update_from_problem(
            dim_full=pypesto_problem.dim_full,
            x_free_indices=pypesto_problem.x_free_indices,
            x_fixed_indices=pypesto_problem.x_fixed_indices,
            x_fixed_vals=pypesto_problem.x_fixed_vals,
        )

        custom_simulate_and_visualize_ensemble(my_ensemble,
                                               pypesto_problem,
                                               model_petab_problem,
                                               measurement_df,
                                               figures_dir=os.path.join(figures_dir, 'validation'),
                                               plot_measurements=True,
                                               plot_states=False,
                                               savefig=True)
