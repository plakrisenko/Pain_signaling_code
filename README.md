# A mechanistic model of protein kinase A dynamics under pro- and anti-nociceptive inputs

This repository contains all python files and (supplementary) figures for the manuscript 
"A mechanistic model of protein kinase A dynamics under pro- and anti-nociceptive inputs".

![image](figures/main_figure.png)

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
