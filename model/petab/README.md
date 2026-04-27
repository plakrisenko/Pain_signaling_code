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
AC_Fsk       = 1 - (AC + AC_alphaI_GTP + AC_alphaS_GTP)  
RII_2        = 1 - RIIp_2 - RII_C_2 - RIIp_C_2 - RIIp_cAMP_C_2
             - RIIp_cAMP_2 - RIIp_Rp8_Br_cAMPS_C_2
             - RIIp_Rp8_pCPT_cAMPS_C_2 - RIIp_Rp_cAMPS_C_2
             - RIIp_Sp8_Br_cAMPS_C_2 - RIIp_Sp8_Br_cAMPS_2  
Csub_H89     = 1 - (Csub + RII_C_2 + RIIp_C_2 + RIIp_cAMP_C_2 + RIIp_Rp8_Br_cAMPS_C_2 + RIIp_Rp8_pCPT_cAMPS_C_2 + RIIp_Rp_cAMPS_C_2 + RIIp_Sp8_Br_cAMPS_C_2)  
betaI_gammaI = 1 - alphaI_betaI_gammaI  
betaS_gammaS = 1 - alphaS_betaS_gammaS  
alphaI_GDP   = 1 - (alphaI_betaI_gammaI + alphaI_GTP + AC_alphaI_GTP)  
alphaS_GDP   = 1 - (alphaS_betaS_gammaS + alphaS_GTP + AC_alphaS_GTP)  

The dynamics of the removed species can be derived from the above equations and are therefore implicitly captured by the model.
