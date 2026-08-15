import os
import yaml

import numpy as np

from ensemble import (create_prediction, create_prediction_from_profiles, visualize_ensemble,
                      visualize_ensemble_states)
from utils import (_model_import)


if __name__ == "__main__":
    base_dir = "../model/"
    with open(os.path.join(base_dir, "config.yaml"), "r") as file:
        config = yaml.safe_load(file)

    model_name = config["model_name"]

    petab_dir = os.path.join(base_dir, "petab", "in_silico_exp")
    yaml_file = os.path.join(petab_dir, config["petab_model_yaml"])
    results_dir = os.path.join(base_dir, "results")
    figures_dir = os.path.join(results_dir, "figures")

    os.makedirs(figures_dir, exist_ok=True)


    model, model_petab_problem = _model_import(
        base_dir=base_dir,
        yaml_file=yaml_file,
        model_name=model_name,
        force_compile=True
    )

    measurement_df = None
    ens_from_profiles = True

    # observables
    if ens_from_profiles:
        _, prediction = create_prediction_from_profiles(
            base_dir,
            model,
            model_petab_problem,
            results_dir,
            max_n_vectors=np.inf,
            tolerances=config["tolerances"],
            simulate_states=False,
        )
    else:
        _, prediction = create_prediction(
            base_dir,
            model,
            model_petab_problem,
            results_dir,
            max_n_vectors=np.inf,
            tolerances=config["tolerances"],
            from_hist=True,
            simulate_states=False,
        )

    for e_id in [
        "insilico_DAMGO_5HT",
        "insilico_Fentanyl_5HT",
    ]:
        observable_id = "pRII_Microscopy"
        # Figure 7a
        visualize_ensemble(
            model_petab_problem,
            prediction,
            measurement_df = measurement_df,
            e_id=e_id,
            observable_id = observable_id,
            figurepath=os.path.join(figures_dir, "ensemble_simulation", "in_silico", e_id,
                                    f"{e_id}_{len(prediction.prediction_results)}_{observable_id}_"
                                    f"measurements.svg"),
            plot_measurements=False
        )


    # states
    if ens_from_profiles:
        _, prediction = create_prediction_from_profiles(
            base_dir,
            model,
            model_petab_problem,
            results_dir,
            max_n_vectors=np.inf,
            tolerances=config["tolerances"],
            simulate_states=True,
        )
    else:
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
        "insilico_DAMGO_5HT",
        "insilico_Fentanyl_5HT",
    ]:
        for state_name in [
            "total_5HT4",
            "total_MOR",
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
            # Figure 7b and 7c
            visualize_ensemble_states(
                model,
                model_petab_problem,
                prediction,
                e_id=e_id,
                figures_dir=os.path.join(figures_dir, "ensemble_simulation", "in_silico",
                                         "states", e_id),
                state_name=state_name,
                subplots=(3,3) # to visualize multiple trajectories
            )