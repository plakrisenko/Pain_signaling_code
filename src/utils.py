"""Utilities for importing AMICI models from PEtab problems and working with
PyPESTO optimization results.

This module provides helper functions to:
- import and (optionally) compile AMICI models from PEtab YAML descriptions,
- configure AMICI solvers and sensitivity settings,
- map PEtab condition/dataset IDs to visualization labels, and
- read and extract results from PyPESTO HDF5 result files.
"""

import os
from typing import Dict, Optional, Tuple

import amici
import amici.petab
import pandas as pd
import petab
import pypesto
import pypesto.petab
import pypesto.startpoint

from pypesto import Result
from pypesto.store import OptimizationResultHDF5Reader, ProblemHDF5Reader


def _model_import(
        base_dir: str,
        model_name: str,
        yaml_file: str,
        force_compile: bool = False,
        fix_isensee: bool = False
) -> Tuple[amici.Model, petab.v1.Problem]:
    """Import an AMICI model from a PEtab problem YAML file.

    Args:
        base_dir: Directory where generated AMICI model code will be placed.
        model_name: Name to use for the generated AMICI python module.
        yaml_file: Path to the PEtab YAML file describing the problem.
        force_compile: If True, force compilation of the generated AMICI
            module even if compiled artifacts already exist.
        fix_isensee: If True, apply a project-specific hack that replaces the
            first 61 parameter estimates with zeros in the PEtab problem's
            parameter table. This mirrors historic preprocessing used in the
            repository and should be used only when reproducing those runs.

    Returns:
        A tuple (amici_model, petab_problem) where `amici_model` is the
        imported AMICI model instance and `petab_problem` is the loaded
        PEtab `petab.v1.Problem` object.
    """

    model_output_dir = os.path.join(base_dir, model_name)

    os.environ['AMICI_CXXFLAGS'] = '-fopenmp'
    os.environ['AMICI_LDFLAGS'] = '-fopenmp'
    os.environ["AMICI_EXPERIMENTAL_SBML_NONCONST_CLS"] = "1"

    petab_problem = petab.v1.Problem.from_yaml(yaml_file)

    if fix_isensee:
        estimate = [0 if idx <= 60 else value for idx, value in enumerate(
            petab_problem.parameter_df['estimate'])]
        petab_problem.parameter_df['estimate'] = estimate

    model = amici.petab.petab_import.import_petab_problem(
        petab_problem,  model_output_dir, model_name,
        compile_=force_compile)
    return model, petab_problem


def _setup_amici(
        amici_model: amici.Model,
        model_config: Optional[Dict] = None,
) -> Tuple[amici.Model, amici.Solver]:
    """Configure an AMICI model and its solver for sensitivity-enabled runs.

    The function enables first-order sensitivities and applies optional
    solver/model settings supplied via `model_config`.

    Args:
        amici_model: An AMICI model instance (returned by import).
        model_config: Optional dict with solver/model settings.

    Returns:
        A tuple (amici_model, amici_solver) with the configured model and
        solver instances.
    """

    amici_solver = amici_model.getSolver()
    amici_solver.setSensitivityOrder(amici.SensitivityOrder_first)

    if model_config:
        if 'sensitivity_method' in model_config:
            if model_config['sensitivity_method'] == 'forward':
                amici_solver.setSensitivityMethod(
                    amici.SensitivityMethod.forward)
            if model_config['sensitivity_method'] == 'adjoint':
                amici_solver.setSensitivityMethod(
                    amici.SensitivityMethod.adjoint)
        if 'SteadyStateSensitivityMode' in model_config:
            if model_config['SteadyStateSensitivityMode'] == 'newtonOnly':
                # amici_model.setSteadyStateComputationMode(
                #     amici.SteadyStateComputationMode.newtonOnly)
                amici_model.setSteadyStateSensitivityMode(
                    amici.SteadyStateSensitivityMode.newtonOnly)
        if 'max_steps' in model_config:
            amici_solver.setMaxSteps(model_config['max_steps'])
        if 'atol' in model_config:
            amici_solver.setAbsoluteTolerance(model_config['atol'])
        if 'rtol' in model_config:
            amici_solver.setRelativeTolerance(model_config['rtol'])

    return amici_model, amici_solver


def condition_id_to_label(petab_problem, cond_id: str) -> str:
    """Map a PEtab simulation condition ID to the visualization legend label.

    The function accepts condition IDs that may be namespaced ("dataset::cond")
    or combined ("something+cond") and extracts the condition part before
    looking up the corresponding `datasetId` in `petab_problem.measurement_df`.
    It then returns the `legendEntry` from `petab_problem.visualization_df`.

    Args:
        petab_problem: A `petab.v1.Problem` instance.
        cond_id: The simulation condition id as found in the measurement
            table.

    Returns:
        The legend label string corresponding to the condition's dataset.
    """
    if '::' in cond_id:
        cond_id = cond_id.split('::')[1]
    elif '+' in cond_id:
        cond_id = cond_id.split('+')[1]
    dataset_id = \
        petab_problem.measurement_df[petab_problem.measurement_df['simulationConditionId'] ==
                                     cond_id]['datasetId'].values[0]

    return \
    petab_problem.visualization_df[petab_problem.visualization_df['datasetId'] == dataset_id][
        'legendEntry'].values[0]


def dataset_id_to_label(petab_problem, dataset_id: str) -> str:
    """Return the visualization legend label for a given PEtab dataset id.

    Args:
        petab_problem: A `petab.v1.Problem` instance.
        dataset_id: The dataset id as present in `petab_problem.measurement_df`.

    Returns:
        The legend label string for `dataset_id`.
    """
    return \
    petab_problem.visualization_df[petab_problem.visualization_df['datasetId'] == dataset_id][
        'legendEntry'].values[0]


def create_pypesto_problem(base_dir, amici_model, petab_problem,
                           tolerances, hierarchical: bool = False):
    """Create a PyPESTO problem and a corresponding startpoint method.

    Args:
        base_dir: Base output directory where the importer will write model
            artifacts.
        amici_model: Configured AMICI model instance.
        petab_problem: Loaded `petab.v1.Problem` instance.
        tolerances: Dict-like object containing solver/tolerance options. The
            function expects at least the key `n_threads` and optionally other
            solver settings consumed by `_setup_amici`.
        hierarchical: If True, create a hierarchical parameter problem in
            PyPESTO when supported by the importer.

    Returns:
        A tuple (pypesto_problem, startpoint_method, importer) where
        `pypesto_problem` is the created PyPESTO problem, `startpoint_method`
        is the startpoint generation helper and `importer` is the
        `PetabImporter` instance used.
    """
    model_name = amici_model.getName()
    importer = pypesto.petab.PetabImporter(
        petab_problem,
        output_folder=os.path.join(base_dir, model_name),
        model_name=model_name,
        hierarchical=hierarchical)

    amici_model, solver = _setup_amici(amici_model, tolerances)
    pypesto_problem = importer.create_problem(
        model=amici_model, solver=solver, n_threads=tolerances['n_threads'])

    startpoint_method = importer.create_startpoint_method(
        check_fval=True, check_grad=True)

    return pypesto_problem, startpoint_method, importer


def read_optimization_results(filepath: str,
                              histories_fn: str = '',
                              read_histories: bool = False) -> Result:
    """Read a PyPESTO optimization result HDF5 file and optionally attach histories.

    Args:
        filepath: Path to the PyPESTO HDF5 result file (created by
            `pypesto.store.OptimizationResultHDF5Writer`).
        histories_fn: Optional path to an HDF5 file containing optimization
            histories. If provided and `read_histories` is True, the function
            will load per-run histories using `pypesto.Hdf5History.load` and
            attach them to each optimize result entry.
        read_histories: Whether to attempt loading and attaching histories.

    Returns:
        A `pypesto.Result` instance with `result.problem` set to the problem
        read from the file. When `read_histories` is True, each optimize
        result in `result.optimize_result.list` will have its `.history`
        attribute set when a matching history entry is found.
    """

    opt_result_reader = OptimizationResultHDF5Reader(filepath)
    problem_reader = ProblemHDF5Reader(filepath)
    read_problem = problem_reader.read()
    result = opt_result_reader.read()
    result.problem = read_problem

    if read_histories:
        results_dir = os.path.dirname(filepath)
        filename = os.path.basename(filepath).split('.')[0]
        for opt_result in result.optimize_result.list:
            hist_id = opt_result.id
            file = histories_fn
            result_hist = pypesto.Hdf5History.load(
                id=hist_id,
                file=file)

            opt_result.history = result_hist

    return result


def get_best_parameters(
        result: Result,
        n_par_vector: int = 1,
        out_path: Optional[str] = None,
        end_p: bool = True
) -> pd.DataFrame:
    """Return the best parameter vectors from a PyPESTO `Result` as a DataFrame.

    The function extracts the top `n_par_vector` parameter vectors from the
    optimization result. If `end_p` is True (default) it extracts final
    parameters using the key 'x'; otherwise it extracts initial parameter
    guesses with the key 'x0'. Returned vectors are expanded to full-length
    parameter vectors (including fixed parameters) via
    `result.problem.get_full_vector` and labeled by `result.problem.x_names`.

    Args:
        result: A `pypesto.Result` instance (typically returned by
            `read_optimization_results` or created by PyPESTO).
        n_par_vector: Number of top parameter vectors to return (1-based).
        out_path: Optional path to write the resulting DataFrame as a tab-
            separated file. If provided the DataFrame is written with
            `index=False` and `sep='\t'`.
        end_p: If True use the final parameter vectors ('x'), otherwise use
            the initial guesses ('x0').

    Returns:
        A pandas DataFrame with shape (n_par_vector, n_parameters) whose
        columns correspond to `result.problem.x_names`.
    """

    key = 'x' if end_p else 'x0'
    par_vectors = result.optimize_result.get_for_key(key)[:n_par_vector]
    par_values_df = pd.DataFrame(
        (
            result.problem.get_full_vector(
                x=par_values,
                x_fixed_vals=result.problem.x_fixed_vals
            )
            for par_values in par_vectors),
        columns=result.problem.x_names
    )

    if out_path:
        par_values_df.to_csv(out_path, index=False, sep="\t")
    return par_values_df

