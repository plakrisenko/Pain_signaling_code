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

from ensemble import create_prediction, visualize_ensemble, visualize_doseresponse_ensemble
from utils import (
    _model_import,
    create_pypesto_problem,
    read_optimization_results,
    condition_id_to_label,
    dataset_id_to_label
)

plt.style.use("tableau-colorblind10")


def simulate_and_visualize_exp2():
    petab_dir = os.path.join(base_dir, "petab", "validation", "exp2")
    yaml_file = os.path.join(petab_dir, config["petab_model_yaml"])
    results_dir = os.path.join(base_dir,
                               "results_full")
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
        max_n_vectors=3,
        tolerances=config["tolerances"],
        from_hist=True,
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
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df=measurement_df,
            e_id=e_id,
            observable_id=observable_id,
            figurepath=os.path.join(figures_dir, "validation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
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
            figurepath=os.path.join(figures_dir, "validation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
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
            figurepath=os.path.join(figures_dir, "validation", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements_minmaxband.svg"),
            plot_measurements=True,
            figsize=figsize
        )


if __name__ == "__main__":
    base_dir = "../model/"
    with open(os.path.join(base_dir, "config.yaml"), "r") as file:
        config = yaml.safe_load(file)

    model_name = config["model_name"]

    simulate_and_visualize_exp2()
