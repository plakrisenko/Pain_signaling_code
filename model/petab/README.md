# A mechanistic model of protein kinase A dynamics under pro- and anti-nociceptive inputs

## Conserved quantities
In order to take advantage of a more efficient method for sensitivities computation at steady state, we
reformulated the model by removing conserved quantities. This method requires the system Jacobian to be
non-singular, a condition that is violated when conserved quantities are present. The model originally included
several conserved quantities:  
1. AC + AC:Fsk + AC:α<sub>I</sub>GTP + AC:α<sub>S</sub>GTP = const;
2. RII<sub>2</sub>:C<sub>2</sub> + pRII<sub>2</sub>:C<sub>2</sub> + pRII<sub>2</sub>:C<sub>2</sub>:cAMP<sub>4</sub> + pRII<sub>2</sub>:cAMP<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp8-Br-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp8-pCPT-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Sp8-Br-cAMPS<sub>4</sub> + pRII<sub>2</sub>:Sp8-Br-cAMPS<sub>4</sub> + pRII<sub>2</sub> + RII<sub>2</sub> = const;
3. C + C:H-89 + RII<sub>2</sub>:C<sub>2</sub> + pRII<sub>2</sub>:C<sub>2</sub> + pRII<sub>2</sub>:C<sub>2</sub>:cAMP<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp8-Br-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp8-pCPT-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Rp-cAMPS<sub>4</sub> + pRII<sub>2</sub>:C<sub>2</sub>:Sp8-Br-cAMPS<sub>4</sub> = const;
4. α<sub>I</sub>β<sub>I</sub>γ<sub>I</sub> + α<sub>I</sub>GTP + α<sub>I</sub>GDP + AC:α<sub>I</sub>GTP = const;
5. α<sub>S</sub>β<sub>S</sub>γ<sub>S</sub> + α<sub>S</sub>GTP + α<sub>S</sub>GDP + AC:α<sub>S</sub>GTP = const;
6. α<sub>I</sub>β<sub>I</sub>γ<sub>I</sub> + β<sub>I</sub>γ<sub>I</sub> = const;
7. α<sub>S</sub>β<sub>S</sub>γ<sub>S</sub> + β<sub>S</sub>γ<sub>S</sub> = const.

We removed 7 species from the model, by representing them as follows:  
- AC_Fsk       = 1 - (AC + AC_alphaI_GTP + AC_alphaS_GTP)  
- RII_2        = 1 - RIIp_2 - RII_C_2 - RIIp_C_2 - RIIp_cAMP_C_2
             - RIIp_cAMP_2 - RIIp_Rp8_Br_cAMPS_C_2
             - RIIp_Rp8_pCPT_cAMPS_C_2 - RIIp_Rp_cAMPS_C_2
             - RIIp_Sp8_Br_cAMPS_C_2 - RIIp_Sp8_Br_cAMPS_2  
- Csub_H89     = 1 - (Csub + RII_C_2 + RIIp_C_2 + RIIp_cAMP_C_2 + RIIp_Rp8_Br_cAMPS_C_2 + RIIp_Rp8_pCPT_cAMPS_C_2 + RIIp_Rp_cAMPS_C_2 + RIIp_Sp8_Br_cAMPS_C_2)  
- betaI_gammaI = 1 - alphaI_betaI_gammaI  
- betaS_gammaS = 1 - alphaS_betaS_gammaS  
- alphaI_GDP   = 1 - (alphaI_betaI_gammaI + alphaI_GTP + AC_alphaI_GTP)  
- alphaS_GDP   = 1 - (alphaS_betaS_gammaS + alphaS_GTP + AC_alphaS_GTP)  

The dynamics of the removed species can be derived from the above equations and are therefore implicitly captured by the model.

### Workaround for receptors

Additionally, in the original formulation, two conserved quantities arise that hold only in the absence of receptor ligands. 
Specifically, the total amount of MOR is conserved when no ligand (DAMGO or Fentanyl) is present, 
as we assume that MOR undergoes noticeable degradation (or internalization) only when bound to a ligand. 
As a result, in ligand-free conditions, an additional conservation law emerges, which can lead to numerical difficulties. 
The same issue applies to the 5-HT$_4$ receptor in the absence of its ligand, 5-HT.
This situation occurs, for example, in the control condition used in our study, 
which does not include any receptor ligands and is employed for model pre-equilibration during each simulation.
To address this issue, we introduce additional synthesis and degradation reactions that are active only in the absence of ligands.
For MOR, we define synthesis and degradation rates as
$$
\text{MOR} \cdot
\begin{cases}
    0, & \text{Fentanyl_level} + \text{DAMGO_level} > 0 \\
    1, & \text{else}
\end{cases},
$$
and
$$
\text{MOR}^2 \cdot
\begin{cases}
    0, & \text{Fentanyl_level} + \text{DAMGO_level} > 0 \\
    1, & \text{else}
\end{cases},
$$
respectively.
Analogously, for the 5-HT$_4$ receptor, we introduce a synthesis reaction with rate
$$
\text{5-HT}_4 \cdot
\begin{cases}
    0, & \text{5-HT_level} > 0 \\
    1, & \text{else}
\end{cases},
$$
and a degradation reaction with rate
$$
\text{5-HT}_4^2 \cdot
\begin{cases}
    0, & \text{5-HT_level} > 0 \\
    1, & \text{else}
\end{cases}.
$$
These additional reactions break the conservation in ligand-free conditions and ensure 
stable numerical pre-equilibration without affecting the dynamics when ligands are present.
Therefore, conceptually, the model comprises 58 reactions, while the additional 4 reactions 
included in the SBML representation serve solely this technical purpose.