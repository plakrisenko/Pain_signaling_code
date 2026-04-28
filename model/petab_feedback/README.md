# Extended model

The extended model includes an additional reaction for ligand-triggered G<sub>I</sub> protein 
activation, with a rate proportional to the concentration of the pRII<sub>2</sub>:cAMP<sub>4</sub> 
complex. Specifically, the core model was extended by two reactions, one for each ligand:

$`kf_{\alpha_I\beta_I\gamma_I} \cdot \xi_{\alpha_I\beta_I\gamma_I,\mathrm{MOR_DAMGO}} \cdot \xi_{\alpha_I\beta_I\gamma_I,\mathrm{RIIp\\_cAMP}} \cdot \mathrm{MOR\_DAMGO} \cdot  
\left( \mathrm{RIIp\_cAMP\_2} + \mathrm{RIIp\_Sp8\_Br\_cAMPS\_2} \right) \cdot \alpha_I\beta_I\gamma_I`$,

and

$`kf_{\alpha_I\beta_I\gamma_I} \cdot \xi_{\alpha_I\beta_I\gamma_I,\mathrm{MOR_Fentanyl}} \cdot \xi_{\alpha_I\beta_I\gamma_I,\mathrm{RIIp\\_cAMP}} \cdot \mathrm{MOR\_Fentanyl} \cdot  
\left( \mathrm{RIIp\_cAMP\_2} + \mathrm{RIIp\_Sp8\_Br\_cAMPS\_2} \right) \cdot \alpha_I\beta_I\gamma_I`$.

Compared to the core model, the extended model depends on one additional parameter 
$`\xi_{\alpha_I\beta_I\gamma_I,\,RIIp\_cAMP}`$ that needs to be estimated from the data.
