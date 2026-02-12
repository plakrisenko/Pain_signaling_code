"""Utilities for importing AMICI models from PEtab problems and working with
PyPESTO optimization results.

This module provides helper functions to:
- import and (optionally) compile AMICI models from PEtab YAML descriptions,
- configure AMICI solvers and sensitivity settings,
- map PEtab condition/dataset IDs to visualization labels, and
- read and extract results from PyPESTO HDF5 result files.
"""

import os
from typing import Any, Dict, Optional, Tuple

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


# Mapping from internal parameter/experiment identifiers to display-friendly
# labels (LaTeX or short names). 
PARAMETER_DISPLAY_MAP = [
    # PKA and cAMP
    ('xi_kf_RII_C_2__RII_2',
     '$\\xi_{\\text{k}_\\text{f}, \\text{RII}_2:\\text{C}_2, \\text{RII}_2}$'),
    ('xi_kf_RII_2__RII_C_2',
     '$\\xi_{\\text{k}_\\text{f}, \\text{RII}_2, \\text{RII}_2:\\text{C}_2}$'),
    ('kf_RIIp_cAMP_C_2__RIIp_2',
     'k$_{\\text{f}, \\text{pRII}_2:\\text{C}_2:\\text{cAMP}_4, \\text{pRII}_2}$'),
    ('kf_RIIp_C_2__RII_C_2',
     'k$_{\\text{f}, \\text{pRII}_2:\\text{C}_2, \\text{RII}_2:\\text{C}_2}$'),
    ('kf_RIIp_2__RII_2', 'k$_{\\text{f}, \\text{pRII}_2, \\text{RII}_2}$'),
    ('kf_RII_C_2__RIIp_C_2',
     'k$_{\\text{f}, \\text{RII}_2:\\text{C}_2, \\text{pRII}_2:\\text{C}_2}$'),
    ('kf_RII_C_2__RII_2', 'k$_{\\text{f}, \\text{RII}_2:\\text{C}_2, \\text{RII}_2}$'),
    ('kf_RII_2__RII_C_2', 'k$_{\\text{f}, \\text{RII}_2, \\text{RII}_2:\\text{C}_2}$'),

    ('xi_AC_cAMP_Fsk', '$\\xi_{\\text{AC}, \\text{cAMP}, \\text{Fsk}}$'),
    ('ks_AC_cAMP', 'k$_{\\text{s}, \\text{AC}, \\text{cAMP}}$'),
    ('kf_Fsk', 'k$_{\\text{f}, \\text{Fsk}}$'),
    ('kdeg_cAMP_free', 'k$_{\\text{deg}, \\text{cAMP}, \\text{free}}$'),
    ('kf_cAMP', 'k$_{\\text{f}, \\text{cAMP}}$'),
    ('kdeg_cAMP', 'k$_{\\text{deg}, \\text{cAMP}}$'),
    ('KD_cAMP', 'K$_{\\text{D}, \\text{cAMP}}$'),
    ('ki_IBMX', 'k$_{\\text{i}, \\text{IBMX}}$'),
    ('KD_IBMX', 'K$_{\\text{D}, \\text{IBMX}}$'),
    ('kf_H89', 'k$_{\\text{f}, \\text{H-89}}$'),
    ('KD_H89', 'K$_{\\text{D}, \\text{H-89}}$'),
    ('KD_Fsk', 'K$_{\\text{D}, \\text{Fsk}}$'),

    # receptors
    ('kdeg_5HT', 'k$_{\\text{int}, \\text{5-HT}}$'),
    ('KD_5HT', 'K$_{\\text{D}, \\text{5-HT}}$'),
    ('kf_5HT', 'k$_{\\text{f}, \\text{5-HT}}$'),

    ('kdeg_DAMGO', 'k$_{\\text{int}, \\text{DAMGO}}$'),
    ('KD_DAMGO', 'K$_{\\text{D}, \\text{DAMGO}}$'),
    ('kf_DAMGO', 'k$_{\\text{f}, \\text{DAMGO}}$'),

    ('kdeg_Fentanyl', 'k$_{\\text{int}, \\text{Fentanyl}}$'),
    ('KD_Fentanyl', 'K$_{\\text{D}, \\text{Fentanyl}}$'),
    ('kf_Fentanyl', 'k$_{\\text{f}, \\text{Fentanyl}}$'),

    ('xi_b_Sp8_Br_cAMPS', '$\\xi_{\\text{b}, \\text{Sp-8-Br-cAMPS}}$'),
    ('xi_b_Rp_cAMPS', '$\\xi_{\\text{b}, \\text{Rp-cAMPS}}$'),
    ('xi_b_Rp8_pCPT_cAMPS', '$\\xi_{\\text{b}, \\text{Rp-8-pCPT-cAMPS}}$'),
    ('xi_b_Rp8_Br_cAMPS', '$\\xi_{\\text{b}, \\text{Rp-8-Br-cAMPS}}$'),

    ('xi_KD_Sp8_Br_cAMPS', '$\\xi_{K_\\text{D}, \\text{Sp-8-Br-cAMPS}}$'),
    ('xi_KD_Rp_cAMPS', '$\\xi_{K_\\text{D}, \\text{Rp-cAMPS}}$'),
    ('xi_KD_Rp8_pCPT_cAMPS', '$\\xi_{K_\\text{D}, \\text{Rp-8-pCPT-cAMPS}}$'),
    ('xi_KD_Rp8_Br_cAMPS', '$\\xi_{K_\\text{D}, \\text{Rp-8-Br-cAMPS}}$'),

    ('ki_Sp8_Br_cAMPS_AM', '$k_{\\text{i}, \\text{Sp-8-Br-cAMPS-AM}}$'),
    ('ki_Rp_cAMPS_pAB', '$k_{\\text{i}, \\text{Rp-cAMPS-pAB}}$'),
    ('ki_Rp8_pCPT_cAMPS_pAB', '$k_{\\text{i}, \\text{Rp-8-pCPT-cAMPS-pAB}}$'),
    ('ki_Rp8_Br_cAMPS_pAB', '$k_{\\text{i}, \\text{Rp-8-Br-cAMPS-pAB}}$'),

    ('xi_AC_cAMP_alphaS_GTP', '$\\xi_{\\text{AC}, \\text{cAMP}, \\alpha_\\text{S}\\text{GTP}}$'),
    ('KD_AC_alphaS_GTP', 'K$_{\\text{D}, \\text{AC}, \\alpha_\\text{S}\\text{GTP}}$'),
    ('kf_AC_alphaS_GTP', 'k$_{\\text{f}, \\text{AC}, \\alpha_\\text{S}\\text{GTP}}$'),
    ('KD_AC_alphaI_GTP', 'K$_{\\text{D}, \\text{AC}, \\alpha_\\text{I}\\text{GTP}}$'),
    ('kf_AC_alphaI_GTP', 'k$_{\\text{f}, \\text{AC}, \\alpha_\\text{I}\\text{GTP}}$'),
    ('kf_alphaI_GTP__alphaI_GDP', 'k$_{\\text{f}, \\alpha_\\text{I}\\text{GTP}, '
                                  '\\alpha_\\text{I}\\text{GDP}}$'),
    ('kf_alphaS_GTP__alphaS_GDP', 'k$_{\\text{f}, \\alpha_\\text{S}\\text{GTP}, '
                                  '\\alpha_\\text{S}\\text{GDP}}$'),
    ('xi_alphaI_betaI_gammaI__MOR_Fentanyl', '$\\xi_{\\alpha_I\\beta_I\\gamma_I, '
                                             '\\text{MOR}, \\text{Fentanyl}}$'),
    ('xi_alphaI_betaI_gammaI__MOR_DAMGO', '$\\xi_{\\alpha_I\\beta_I\\gamma_I, '
                                          '\\text{MOR}, \\text{DAMGO}}$'),
    ('kf_alphaI_betaI_gammaI', 'k$_{\\text{f}, \\alpha_I\\beta_I\\gamma_I}$'),
    ('xi_alphaS_betaS_gammaS__fiveHT4_5HT', '$\\xi_{\\alpha_S\\beta_S\\gamma_S, \\text{5-HT}_4, '
                                            '\\text{5-HT}}$'),
    ('kf_alphaS_betaS_gammaS', 'k$_{\\text{f}, \\alpha_S\\beta_S\\gamma_S}$'),
    ('kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS',
     'k$_{\\text{f}, \\alpha_S\\text{GDP}, \\beta_S\\gamma_S, \\alpha_S\\beta_S\\gamma_S}$'),
    ('kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI',
     'k$_{\\text{f}, \\alpha_I\\text{GDP}, \\beta_I\\gamma_I, \\alpha_I\\beta_I\\gamma_I}$'),
]


def parameter_names_display(x: str) -> str:
    """Return a display-friendly label for a parameter name.

    Args:
        x: Parameter or experiment identifier to convert. Any non-string
            value is converted with ``str()``; passing ``None`` returns an
            empty string.

    Returns:
        A string suitable for use in figure labels or legends.
    """
    if x is None:
        return ''

    s = str(x)
    s = s.replace('JI09_150302_Drg345_343_CycNuc', 'exp1')
    s = s.replace('JI09_150330_Drg350_348_CycNuc', 'exp2')
    s = s.replace('JI09_150330_Drg353_351_CycNuc', 'exp3')
    s = s.replace('JI09_151102_Drg421_418_Age', 'exp4')
    s = s.replace('JI09_160201_Drg453_452_CycNuc', 'exp6')

    s = s.replace('LK041_39_MOR_Kinetic_Fentanyl_Fsk', 'exp7')
    s = s.replace('LK023_21_MOR_Kinetik_DAMGO_Fsk', 'exp8')
    s = s.replace('LK15_150727_LK051_48_MOR_Kinetic_10min_Fentanyl_Fsk', 'exp9')
    s = s.replace('LK15_150810_LK053_52_047_46_MOR_Kinetic_Fentanyl_5HT', 'exp10')
    s = s.replace('LK020_18_LK014_12_MOR_Kinetik_DAMGO_5HT', 'exp11')
    s = s.replace('JI09_140331_Drg270_267_TiM', 'exp12')

    for old, new in PARAMETER_DISPLAY_MAP:
        if s == old:
            return new
    return s


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


def create_pypesto_problem(base_dir: str,
                           amici_model: amici.Model,
                           petab_problem: petab.v1.Problem,
                           tolerances: Dict[str, Any],
                           hierarchical: bool = False):
    """Create a PyPESTO problem and a corresponding startpoint method.

    Args:
        base_dir: Base output directory where the importer will write model
            artifacts (string path).
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

