# A mechanistic model of protein kinase A dynamics under pro- and anti-nociceptive inputs

This repository contains all python files and (supplementary) figures for the manuscript 
"A mechanistic model of protein kinase A dynamics under pro- and anti-nociceptive inputs".

![image](figures/main_figure.png)

## Models
We developed a mechanistic model of PKA activity in nociceptive neurons that explicitly links 
receptor activation to downstream kinase regulation. The model is implemented in the Systems Biology Markup Language ([SBML](https://sbml.org/)), 
and the parameter estimation problem was described in the [PEtab format](https://github.com/PEtab-dev/PEtab). 

- `model/petab`  
  PEtab files for the core model of PKA activity in nociceptive neurons. The model captures ligand-dependent receptor
  activation, subsequent G-protein signaling, and its regulatory effects on AC activity and
  cAMP synthesis, ultimately linking these processes to PKA activation through cAMP
  binding.
  - `in_silico_exp`  
    This folder contains PEtab files for _in silico_ experiments performed in the study.
  - `validation`  
    This folder contains PEtab files for performing model validation.
  - `experimentalCondition_PKAcycleMOR.tsv`  
    [Condition table](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#condition-table). 
    Conditions ending in `_\d+` (e.g. `model1_data1_1`-`model1_data1_9`) are added to the table for simulation and visualization purposes.
    All other conditions describe conditions of actually performed experiments.
  - `measurementData_PKAcycleMOR.tsv`  
    Measurement table that contains experimental measurements that were used for parameter estimation (the training dataset).
  - `measurements_smooth.tsv`  
    Measurement table for model simulation and visualization, including additional time points and conditions to enable finer resolution and smoother trajectories.
  - `observables_PKAcycleMOR.tsv`  
    [Observables table](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#observables-table).
  - `parameters_PKAcycleMOR.tsv`  
    [Parameter table](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#parameter-table).
  - `PKAcycleMOR.yaml`  
    [YAML file for grouping files](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#yaml-file-for-grouping-files).
  - `PKAcycleMOR_model.xml`  
    [SBML model definition](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#visualization-table).
  - `visualizationSpecification_PKAcycleMOR.tsv`  
    [Visualization table](https://petab.readthedocs.io/en/latest/v1/documentation_data_format.html#visualization-table).

- `model/petab_feedback`  
  PEtab files for the extended model, where an additional reaction for G<sub>I</sub> protein activation, 
  with a rate proportional to the concentration of the pRII<sub>2</sub>:cAMP<sub>4</sub> complex was added to the core model.


## Scripts

This repository includes several analysis scripts in `src/` used to run optimization, ensemble predictions and generate the paper figures. Short descriptions:

- `src/optimization.py`  
  Implements the startpoint sampling, parameter estimation, saving results to HDF5, simulation with best parameter vectors, and profile posterior calculations. Key entry points: `sample_startpoints()`, `optimize()`, `simulate_w_best_parameter()` / `simulate_and_visualize()`, and `create_profiles()`.

- `src/in_silico_experiments.py`  
  Driver script for running in‑silico experiments (uses the PEtab problem in `petab/in_silico_exp`). It builds ensembles from optimization results and produces ensemble visualizations and state trajectory plots via `create_prediction()` and the plotting helpers in `src/ensemble.py`.

- `src/feedback_hypothesis.py`  
  Utilities for exploring the proposed feedback mechanism: simulate state trajectories from chosen parameter vectors, write flux tables (per-condition), and plot G-protein activation flux contributions. Useful functions include `simulate_states_petab()`, `write_fluxes()`, and `visualize_Gactivity_flux()`.

- `src/ensemble.py`  
  Core ensemble utilities: construct ensembles (from optimization endpoints or histories), predict observables and full state trajectories for all ensemble members, and state visualizations.
