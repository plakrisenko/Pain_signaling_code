<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.44 (Build 295) (http://www.copasi.org) at 2026-06-03T12:12:00Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="44" versionDevel="295" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000163" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_80" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_81" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Function for v_0" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_41">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        -ki_Sp8_Br_cAMPS_AM*(Sp8_Br_cAMPS-Sp8_Br_cAMPS_AM)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_275" name="Sp8_Br_cAMPS" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_274" name="Sp8_Br_cAMPS_AM" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="ki_Sp8_Br_cAMPS_AM" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for v_1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_42">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        -ki_Rp8_Br_cAMPS_pAB*(Rp8_Br_cAMPS-Rp8_Br_cAMPS_pAB)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_276" name="Rp8_Br_cAMPS" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_266" name="Rp8_Br_cAMPS_pAB" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="ki_Rp8_Br_cAMPS_pAB" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Function for v_2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_43">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        -ki_Rp8_pCPT_cAMPS_pAB*(Rp8_pCPT_cAMPS-Rp8_pCPT_cAMPS_pAB)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_279" name="Rp8_pCPT_cAMPS" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_278" name="Rp8_pCPT_cAMPS_pAB" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="ki_Rp8_pCPT_cAMPS_pAB" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for v_3" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_44">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        -ki_Rp_cAMPS_pAB*(Rp_cAMPS-Rp_cAMPS_pAB)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_282" name="Rp_cAMPS" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_281" name="Rp_cAMPS_pAB" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_280" name="ki_Rp_cAMPS_pAB" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for v_4" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_45">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        -ki_IBMX*(IBMX-IBMXex)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_285" name="IBMX" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_284" name="IBMXex" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="ki_IBMX" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for v_5" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_46">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        AC*Fsk*kf_Fsk
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_288" name="AC" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_287" name="Fsk" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="kf_Fsk" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for v_6" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_47">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (1-(AC+AC_alphaI_GTP+AC_alphaS_GTP))*KD_Fsk*kf_Fsk
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_291" name="AC" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_290" name="AC_alphaI_GTP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_289" name="AC_alphaS_GTP" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_292" name="KD_Fsk" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_293" name="kf_Fsk" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for v_39" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_48">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Csub*H89*kf_H89
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_298" name="Csub" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_297" name="H89" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_296" name="kf_H89" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for v_40" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_49">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (1-(Csub+RII_C_2+RIIp_C_2+RIIp_cAMP_C_2+RIIp_Rp8_Br_cAMPS_C_2+RIIp_Rp8_pCPT_cAMPS_C_2+RIIp_Rp_cAMPS_C_2+RIIp_Sp8_Br_cAMPS_C_2))*KD_H89*kf_H89
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_299" name="Csub" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_294" name="KD_H89" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_295" name="RII_C_2" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_300" name="RIIp_C_2" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_301" name="RIIp_Rp8_Br_cAMPS_C_2" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_302" name="RIIp_Rp8_pCPT_cAMPS_C_2" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_303" name="RIIp_Rp_cAMPS_C_2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_304" name="RIIp_Sp8_Br_cAMPS_C_2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_305" name="RIIp_cAMP_C_2" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_306" name="kf_H89" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for v_29" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_50">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*Rp8_Br_cAMPS*kf_cAMP*xi_b_Rp8_Br_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_316" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_315" name="Rp8_Br_cAMPS" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_314" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_313" name="xi_b_Rp8_Br_cAMPS" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for v_30" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_51">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_Rp8_Br_cAMPS_C_2*kf_cAMP*xi_b_Rp8_Br_cAMPS*xi_KD_Rp8_Br_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_309" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_310" name="RIIp_Rp8_Br_cAMPS_C_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_311" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_312" name="xi_KD_Rp8_Br_cAMPS" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_308" name="xi_b_Rp8_Br_cAMPS" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for v_31" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_52">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*Rp8_pCPT_cAMPS*kf_cAMP*xi_b_Rp8_pCPT_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_320" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_319" name="Rp8_pCPT_cAMPS" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_318" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_317" name="xi_b_Rp8_pCPT_cAMPS" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for v_32" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_53">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_Rp8_pCPT_cAMPS_C_2*kf_cAMP*xi_b_Rp8_pCPT_cAMPS*xi_KD_Rp8_pCPT_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_323" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_322" name="RIIp_Rp8_pCPT_cAMPS_C_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_321" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_307" name="xi_KD_Rp8_pCPT_cAMPS" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_324" name="xi_b_Rp8_pCPT_cAMPS" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for v_33" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_54">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*Rp_cAMPS*kf_cAMP*xi_b_Rp_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_329" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_328" name="Rp_cAMPS" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_327" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_326" name="xi_b_Rp_cAMPS" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="Function for v_34" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_55">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_Rp_cAMPS_C_2*kf_cAMP*xi_b_Rp_cAMPS*xi_KD_Rp_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_332" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_331" name="RIIp_Rp_cAMPS_C_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_330" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_325" name="xi_KD_Rp_cAMPS" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_333" name="xi_b_Rp_cAMPS" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for v_35" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_56">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*Sp8_Br_cAMPS*kf_cAMP*xi_b_Sp8_Br_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_338" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_337" name="Sp8_Br_cAMPS" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_336" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_335" name="xi_b_Sp8_Br_cAMPS" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_57" name="Function for v_36" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_57">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_Sp8_Br_cAMPS_C_2*kf_cAMP*xi_b_Sp8_Br_cAMPS*xi_KD_Sp8_Br_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_341" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_340" name="RIIp_Sp8_Br_cAMPS_C_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_339" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="xi_KD_Sp8_Br_cAMPS" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_342" name="xi_b_Sp8_Br_cAMPS" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for v_18" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_58">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*kf_RII_C_2__RII_2*xi_kf_RII_C_2__RII_2
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_347" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_346" name="kf_RII_C_2__RII_2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="xi_kf_RII_C_2__RII_2" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for v_19" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_59">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Csub*RIIp_2*kf_RII_2__RII_C_2*xi_kf_RII_2__RII_C_2
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_348" name="Csub" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_343" name="RIIp_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_344" name="kf_RII_2__RII_C_2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="xi_kf_RII_2__RII_C_2" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for v_38" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_60">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_Sp8_Br_cAMPS_2*kf_cAMP*xi_b_Sp8_Br_cAMPS*xi_KD_Sp8_Br_cAMPS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_353" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_352" name="RIIp_Sp8_Br_cAMPS_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_351" name="kf_cAMP" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_350" name="xi_KD_Sp8_Br_cAMPS" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="xi_b_Sp8_Br_cAMPS" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for v_23" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_61">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        RIIp_C_2*cAMP*kf_cAMP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_359" name="RIIp_C_2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_358" name="cAMP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_357" name="kf_cAMP" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for v_24" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_62">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_cAMP_C_2*kf_cAMP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_360" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_355" name="RIIp_cAMP_C_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_356" name="kf_cAMP" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for v_25" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_63">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_IBMX*RIIp_cAMP_C_2*kdeg_cAMP/(IBMX+KD_IBMX)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_363" name="IBMX" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_362" name="KD_IBMX" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_361" name="RIIp_cAMP_C_2" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_364" name="kdeg_cAMP" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for v_28" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_64">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_IBMX*RIIp_cAMP_2*kdeg_cAMP/(IBMX+KD_IBMX)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_368" name="IBMX" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_367" name="KD_IBMX" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_366" name="RIIp_cAMP_2" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_365" name="kdeg_cAMP" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for v_27" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_65">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_cAMP*RIIp_cAMP_2*kf_cAMP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_372" name="KD_cAMP" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_371" name="RIIp_cAMP_2" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_370" name="kf_cAMP" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for v_15" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_66">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        KD_IBMX*cAMP*kdeg_cAMP_free/(IBMX+KD_IBMX)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_374" name="IBMX" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_373" name="KD_IBMX" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_369" name="cAMP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_375" name="kdeg_cAMP_free" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_67" name="Function for v_13" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_67">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ks_AC_cAMP*AC
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_379" name="AC" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_378" name="ks_AC_cAMP" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for v_14" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_68">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ks_AC_cAMP*xi_AC_cAMP_Fsk*(1-(AC+AC_alphaI_GTP+AC_alphaS_GTP))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_376" name="AC" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_377" name="AC_alphaI_GTP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_380" name="AC_alphaS_GTP" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_381" name="ks_AC_cAMP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_382" name="xi_AC_cAMP_Fsk" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for cAMP_prod_AC_alphaS_GTP" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_69">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ks_AC_cAMP*xi_AC_cAMP_alphaS_GTP*AC_alphaS_GTP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_387" name="AC_alphaS_GTP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_386" name="ks_AC_cAMP" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_385" name="xi_AC_cAMP_alphaS_GTP" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for AC + alphaI_GTP __ AC_alphaI_GTP" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_70">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_AC_alphaI_GTP*KD_AC_alphaI_GTP*AC*alphaI_GTP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_388" name="AC" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_383" name="KD_AC_alphaI_GTP" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_384" name="alphaI_GTP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_389" name="kf_AC_alphaI_GTP" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for AC + alphaS_GTP __ AC_alphaS_GTP" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_71">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_AC_alphaS_GTP*KD_AC_alphaS_GTP*AC*alphaS_GTP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_393" name="AC" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_392" name="KD_AC_alphaS_GTP" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_391" name="alphaS_GTP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_390" name="kf_AC_alphaS_GTP" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for MOR___MOR_DAMGO" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_72">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        MOR*DAMGO*kf_DAMGO
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_397" name="DAMGO" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_396" name="MOR" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_395" name="kf_DAMGO" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for MOR_DAMGO___MOR" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_73">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        MOR_DAMGO*KD_DAMGO*kf_DAMGO
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_399" name="KD_DAMGO" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_398" name="MOR_DAMGO" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_394" name="kf_DAMGO" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for MOR____MOR_Fentanyl" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_74">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        MOR*Fentanyl*kf_Fentanyl
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_402" name="Fentanyl" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_401" name="MOR" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_400" name="kf_Fentanyl" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for MOR_Fentanyl____MOR" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_75">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        MOR_Fentanyl*kf_Fentanyl*KD_Fentanyl
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_405" name="KD_Fentanyl" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_404" name="MOR_Fentanyl" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_403" name="kf_Fentanyl" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for MOR___deg" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_76">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        NO_DAMGO_Fentanyl*MOR*MOR
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_408" name="MOR" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_407" name="NO_DAMGO_Fentanyl" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for MOR___syn" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_77">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        NO_DAMGO_Fentanyl*MOR
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_409" name="MOR" order="0" role="product"/>
        <ParameterDescription key="FunctionParameter_406" name="NO_DAMGO_Fentanyl" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for fiveHT4___fiveHT4_5HT" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_78">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        fiveHT4*fiveHT*kf_5HT
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_411" name="fiveHT" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_410" name="fiveHT4" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_412" name="kf_5HT" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_79" name="Function for fiveHT4_5HT___fiveHT4" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_79">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        fiveHT4_5HT*KD_5HT*kf_5HT
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_415" name="KD_5HT" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_414" name="fiveHT4_5HT" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_413" name="kf_5HT" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_80" name="Function for fiveHT4___deg" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_80">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        NO_fiveHT*fiveHT4*fiveHT4
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_418" name="NO_fiveHT" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_417" name="fiveHT4" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_81" name="Function for fiveHT4___syn" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_81">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        NO_fiveHT*fiveHT4
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_419" name="NO_fiveHT" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_416" name="fiveHT4" order="1" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_82" name="Function for alphaI_GDP + betaI_gammaI -> alphaI_betaI_gammaI" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_82">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI*(1-(alphaI_betaI_gammaI+alphaI_GTP+AC_alphaI_GTP))*(1-alphaI_betaI_gammaI)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_421" name="AC_alphaI_GTP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_420" name="alphaI_GTP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_422" name="alphaI_betaI_gammaI" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_423" name="kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_83" name="Function for alphaS_GDP + betaS_gammaS -> alphaS_betaS_gammaS" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_83">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS*(1-(alphaS_betaS_gammaS+alphaS_GTP+AC_alphaS_GTP))*(1-alphaS_betaS_gammaS)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_427" name="AC_alphaS_GTP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_426" name="alphaS_GTP" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_425" name="alphaS_betaS_gammaS" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_424" name="kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_84" name="Function for alphaS_betaS_gammaS  -> alphaS_GTP + betaS_gammaS, 2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_84">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_alphaS_betaS_gammaS*xi_alphaS_betaS_gammaS__fiveHT4_5HT*fiveHT4_5HT*alphaS_betaS_gammaS
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_431" name="alphaS_betaS_gammaS" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_430" name="fiveHT4_5HT" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_429" name="kf_alphaS_betaS_gammaS" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_428" name="xi_alphaS_betaS_gammaS__fiveHT4_5HT" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_85" name="Function for alphaI_betaI_gammaI -> alphaI_GTP + betaI_gammaI, 2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_85">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_alphaI_betaI_gammaI*xi_alphaI_betaI_gammaI__MOR_DAMGO*MOR_DAMGO*alphaI_betaI_gammaI
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_435" name="MOR_DAMGO" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_434" name="alphaI_betaI_gammaI" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_433" name="kf_alphaI_betaI_gammaI" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_432" name="xi_alphaI_betaI_gammaI__MOR_DAMGO" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_86" name="Function for alphaI_betaI_gammaI -> alphaI_GTP + betaI_gammaI, 3" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_86">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        kf_alphaI_betaI_gammaI*xi_alphaI_betaI_gammaI__MOR_Fentanyl*MOR_Fentanyl*alphaI_betaI_gammaI
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_439" name="MOR_Fentanyl" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_438" name="alphaI_betaI_gammaI" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_437" name="kf_alphaI_betaI_gammaI" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_436" name="xi_alphaI_betaI_gammaI__MOR_Fentanyl" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_87" name="Function for v_17" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_87">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Csub*(1-(RIIp_2+RII_C_2+RIIp_C_2+RIIp_cAMP_C_2+RIIp_cAMP_2+RIIp_Rp8_Br_cAMPS_C_2+RIIp_Rp8_pCPT_cAMPS_C_2+RIIp_Rp_cAMPS_C_2+RIIp_Sp8_Br_cAMPS_C_2+RIIp_Sp8_Br_cAMPS_2))*kf_RII_2__RII_C_2
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_443" name="Csub" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_442" name="RII_C_2" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_441" name="RIIp_2" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_440" name="RIIp_C_2" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_444" name="RIIp_Rp8_Br_cAMPS_C_2" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_445" name="RIIp_Rp8_pCPT_cAMPS_C_2" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_446" name="RIIp_Rp_cAMPS_C_2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_447" name="RIIp_Sp8_Br_cAMPS_2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_448" name="RIIp_Sp8_Br_cAMPS_C_2" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_449" name="RIIp_cAMP_2" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_450" name="RIIp_cAMP_C_2" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_451" name="kf_RII_2__RII_C_2" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="PKA cycle and MOR" simulationType="time" timeUnit="min" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221407599999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2026-06-01T12:14:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="default" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_1" name="cyt" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_2" name="nuc" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="AC" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="cAMP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="C" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="RII_2:C_2" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="pRII_2:C_2" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="pRII_2:C_2:cAMP_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="pRII_2:cAMP_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="Sp8-Br-cAMPS" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="Rp-8-Br-cAMPS" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="Rp-8-pCPT-cAMPS" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="Rp-cAMPS" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="pRII_2:C_2:Rp-8-Br-cAMPS_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_12" name="pRII_2:C_2:Rp-8-pCPT-cAMPS_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="pRII_2:C_2:Rp-cAMPS_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_14" name="pRII_2:C_2:Sp-8-Br-cAMPS_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="pRII_2:Sp-8-Br-cAMPS_4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_16" name="pRII_2" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="IBMX" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_18" name="fiveHT4" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_19" name="fiveHT4_5HT" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_20" name="MOR" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_21" name="MOR_DAMGO" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_21">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_22" name="MOR_Fentanyl" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_22">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_23" name="alphaS_betaS_gammaS" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_23">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_24" name="alphaI_betaI_gammaI" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_24">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_25" name="alphaS_GTP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_25">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_26" name="alphaI_GTP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_26">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_27" name="AC_alphaS_GTP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_27">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_28" name="AC_alphaI_GTP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_28">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="fiveHT" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time> lt &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT_time],Reference=Value>,0,&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT_level],Reference=Value>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="Fsk" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="DAMGO" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time> lt &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO_time],Reference=Value>,0,&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO_level],Reference=Value>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="Fentanyl" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="NO_DAMGO_Fentanyl" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          if(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl_level],Reference=Value>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO_level],Reference=Value> gt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="NO_fiveHT" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          if(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT_level],Reference=Value> gt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="IBMXex" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMX_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMX_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_7" name="H89" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[H89_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[H89_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_8" name="Sp8_Br_cAMPS_AM" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="Rp8_Br_cAMPS_pAB" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="Rp8_pCPT_cAMPS_pAB" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="Rp_cAMPS_pAB" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="fourABnOH" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fourABnOH_level],Reference=Value>*if(&lt;CN=Root,Model=PKA cycle and MOR,Reference=Time>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fourABnOH_time],Reference=Value> lt 0,0,1)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="AC_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_14" name="RII2_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_15" name="fiveHT4_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_16" name="MOR_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_17" name="alphaS_betaS_gammaS_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_18" name="alphaI_betaI_gammaI_total" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_19" name="kf_Fsk" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_20" name="kf_H89" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_21" name="kf_RII_2__RII_C_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_21">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_22" name="kf_RII_C_2__RII_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_22">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_23" name="kf_RII_C_2__RIIp_C_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_23">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_24" name="kf_RIIp_2__RII_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_24">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_25" name="kf_RIIp_C_2__RII_C_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_25">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_26" name="kf_RIIp_cAMP_C_2__RIIp_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_26">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_27" name="kf_cAMP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_27">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_28" name="KD_Fsk" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_28">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_29" name="KD_H89" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_29">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_30" name="KD_IBMX" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_30">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_31" name="KD_cAMP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_31">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_32" name="ki_IBMX" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_32">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_33" name="ki_Rp8_Br_cAMPS_pAB" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_33">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_34" name="ki_Rp8_pCPT_cAMPS_pAB" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_34">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_35" name="ki_Rp_cAMPS_pAB" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_35">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_36" name="ki_Sp8_Br_cAMPS_AM" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_36">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_37" name="kdeg_cAMP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_37">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_38" name="kdeg_cAMP_free" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_38">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_39" name="xi_AC_cAMP_Fsk" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_39">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_40" name="xi_KD_Rp8_Br_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_40">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_41" name="xi_KD_Rp8_pCPT_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_41">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_42" name="xi_KD_Rp_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_42">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_43" name="xi_KD_Sp8_Br_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_43">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_44" name="xi_b_Rp8_Br_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_44">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_45" name="xi_b_Rp8_pCPT_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_45">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_46" name="xi_b_Rp_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_46">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_47" name="xi_b_Sp8_Br_cAMPS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_47">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_48" name="xi_kf_RII_2__RII_C_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_48">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_49" name="xi_kf_RII_C_2__RII_2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_49">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_50" name="Fsk_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_50">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_51" name="Fsk_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_51">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_52" name="H89_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_52">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_53" name="IBMX_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_53">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_54" name="Rp8_Br_cAMPS_pAB_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_54">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_55" name="Rp8_Br_cAMPS_pAB_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_55">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_56" name="H89_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_56">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_57" name="IBMX_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_57">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_58" name="Rp8_pCPT_cAMPS_pAB_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_58">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_59" name="Rp8_pCPT_cAMPS_pAB_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_59">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_60" name="Rp_cAMPS_pAB_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_60">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_61" name="Rp_cAMPS_pAB_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_61">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_62" name="Sp8_Br_cAMPS_AM_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_62">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_63" name="Sp8_Br_cAMPS_AM_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_63">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_64" name="fourABnOH_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_64">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          mol
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_65" name="fourABnOH_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_65">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Unit>
          min
        </Unit>
      </ModelValue>
      <ModelValue key="ModelValue_66" name="fiveHT_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_66">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_67" name="fiveHT_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_67">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_68" name="DAMGO_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_68">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_69" name="DAMGO_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_69">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_70" name="Fentanyl_time" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_70">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_71" name="Fentanyl_level" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_71">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_72" name="ks_AC_cAMP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_72">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_73" name="rel_open" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_73">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_74" name="xi_rel_open" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_74">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_75" name="Calpha" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_75">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_76" name="kf_DAMGO" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_76">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_77" name="KD_DAMGO" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_77">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_78" name="kf_Fentanyl" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_78">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_79" name="KD_Fentanyl" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_79">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_80" name="kf_5HT" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_80">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_81" name="KD_5HT" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_81">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_82" name="kdeg_DAMGO" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_82">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_83" name="kdeg_Fentanyl" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_83">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_84" name="kdeg_5HT" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_84">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_85" name="kf_alphaS_GTP__alphaS_GDP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_85">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_86" name="kf_alphaI_GTP__alphaI_GDP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_86">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_87" name="kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_87">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_88" name="kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_88">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_89" name="kf_alphaS_betaS_gammaS" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_89">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_90" name="xi_alphaS_betaS_gammaS__fiveHT4_5HT" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_90">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_91" name="kf_alphaI_betaI_gammaI" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_91">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_92" name="xi_alphaI_betaI_gammaI__MOR_DAMGO" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_92">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_93" name="xi_alphaI_betaI_gammaI__MOR_Fentanyl" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_93">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_94" name="kf_AC_alphaI_GTP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_94">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_95" name="KD_AC_alphaI_GTP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_95">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_96" name="kf_AC_alphaS_GTP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_96">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_97" name="KD_AC_alphaS_GTP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_97">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_98" name="xi_AC_cAMP_alphaS_GTP" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_98">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_99" name="pRII_total" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_99">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[s_j],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[s_pRII_global],Reference=InitialValue>*(2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2],Reference=Concentration>+2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:cAMP_4],Reference=Concentration>+2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:Sp-8-Br-cAMPS_4],Reference=Concentration>+2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-Br-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-pCPT-cAMPS_4],Reference=Concentration>)+2*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_rel_open],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>-1))*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:cAMP_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Sp-8-Br-cAMPS_4],Reference=Concentration>))+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[b_pRII_global],Reference=InitialValue>*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[b_j],Reference=InitialValue>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_100" name="Calpha_total" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_100">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[s_j],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[s_Calpha_global],Reference=InitialValue>*(2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[C],Reference=Concentration>+2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Calpha_H89],Reference=Value>+2*&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-Br-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-pCPT-cAMPS_4],Reference=Concentration>)+2*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>-&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_rel_open],Reference=InitialValue>*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open],Reference=InitialValue>-1))*(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:cAMP_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Sp-8-Br-cAMPS_4],Reference=Concentration>))+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[b_Calpha_global],Reference=InitialValue>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_101" name="Calpha_H89" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_101">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          1-(&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[C],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[RII_2:C_2],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:cAMP_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-Br-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-pCPT-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-cAMPS_4],Reference=Concentration>+&lt;CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-Br-cAMPS_4],Reference=Concentration>)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_102" name="s_j" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_102">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_103" name="s_pRII_global" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_103">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_104" name="b_j" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_104">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_105" name="b_pRII_global" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_105">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_106" name="s_Calpha_global" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_106">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_107" name="b_Calpha_global" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_107">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_108" name="s_pRII_Western" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_108">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="v_0" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6922" name="Sp8_Br_cAMPS_AM" value="0"/>
          <Constant key="Parameter_6925" name="ki_Sp8_Br_cAMPS_AM" value="0.0725005"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="ModelValue_36"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="v_1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_5512" name="Rp8_Br_cAMPS_pAB" value="0"/>
          <Constant key="Parameter_5513" name="ki_Rp8_Br_cAMPS_pAB" value="4.45643"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_33"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="v_2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_5515" name="Rp8_pCPT_cAMPS_pAB" value="0"/>
          <Constant key="Parameter_5511" name="ki_Rp8_pCPT_cAMPS_pAB" value="5.502"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="ModelValue_34"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="v_3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_5514" name="Rp_cAMPS_pAB" value="0"/>
          <Constant key="Parameter_4680" name="ki_Rp_cAMPS_pAB" value="0.0177867"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="ModelValue_35"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="v_4" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4681" name="IBMXex" value="0"/>
          <Constant key="Parameter_4684" name="ki_IBMX" value="3635.82"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="v_5" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4679" name="Fsk" value="0"/>
          <Constant key="Parameter_4683" name="kf_Fsk" value="0.0839741"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_19"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="v_6" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_28" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4682" name="KD_Fsk" value="18.2975"/>
          <Constant key="Parameter_6928" name="kf_Fsk" value="0.0839741"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="ModelValue_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_19"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="v_39" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6929" name="H89" value="0"/>
          <Constant key="Parameter_6932" name="kf_H89" value="0.000806377"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="ModelValue_20"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="v_40" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_2" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_4" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_12" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6927" name="KD_H89" value="0.0479867"/>
          <Constant key="Parameter_6931" name="kf_H89" value="0.000806377"/>
        </ListOfConstants>
        <KineticLaw function="Function_49" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="ModelValue_20"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="v_29" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6930" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_4652" name="xi_b_Rp8_Br_cAMPS" value="0.0199655"/>
        </ListOfConstants>
        <KineticLaw function="Function_50" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="ModelValue_44"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="v_30" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4653" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_4659" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_4651" name="xi_KD_Rp8_Br_cAMPS" value="0.0996332"/>
          <Constant key="Parameter_4658" name="xi_b_Rp8_Br_cAMPS" value="0.0199655"/>
        </ListOfConstants>
        <KineticLaw function="Function_51" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="ModelValue_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="ModelValue_44"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="v_31" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4657" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_4656" name="xi_b_Rp8_pCPT_cAMPS" value="0.0140703"/>
        </ListOfConstants>
        <KineticLaw function="Function_52" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="ModelValue_45"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="v_32" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4655" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_4654" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_7512" name="xi_KD_Rp8_pCPT_cAMPS" value="0.332521"/>
          <Constant key="Parameter_7513" name="xi_b_Rp8_pCPT_cAMPS" value="0.0140703"/>
        </ListOfConstants>
        <KineticLaw function="Function_53" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="ModelValue_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="ModelValue_45"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="v_33" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7516" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_7511" name="xi_b_Rp_cAMPS" value="0.352892"/>
        </ListOfConstants>
        <KineticLaw function="Function_54" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="ModelValue_46"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="v_34" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7515" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_7514" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_6031" name="xi_KD_Rp_cAMPS" value="0.193785"/>
          <Constant key="Parameter_6032" name="xi_b_Rp_cAMPS" value="0.352892"/>
        </ListOfConstants>
        <KineticLaw function="Function_55" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="ModelValue_42"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="ModelValue_46"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="v_35" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6034" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_6030" name="xi_b_Sp8_Br_cAMPS" value="12.4386"/>
        </ListOfConstants>
        <KineticLaw function="Function_56" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_47"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="v_36" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6033" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_6515" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_6516" name="xi_KD_Sp8_Br_cAMPS" value="0.166906"/>
          <Constant key="Parameter_6518" name="xi_b_Sp8_Br_cAMPS" value="12.4386"/>
        </ListOfConstants>
        <KineticLaw function="Function_57" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="ModelValue_47"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="v_37" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6514" name="k1" value="0.0344965"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="v_26" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6517" name="k1" value="0.0344965"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="v_18" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7350" name="kf_RII_C_2__RII_2" value="0.00659629"/>
          <Constant key="Parameter_7351" name="xi_kf_RII_C_2__RII_2" value="0.831243"/>
        </ListOfConstants>
        <KineticLaw function="Function_58" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="ModelValue_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="ModelValue_49"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="v_19" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7353" name="kf_RII_2__RII_C_2" value="0.320697"/>
          <Constant key="Parameter_7349" name="xi_kf_RII_2__RII_C_2" value="0.0180507"/>
        </ListOfConstants>
        <KineticLaw function="Function_59" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="ModelValue_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="ModelValue_48"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="v_20" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_21">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_7352" name="k1" value="0.0203731"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="v_38" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_22">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4931" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_4932" name="kf_cAMP" value="0.84643"/>
          <Constant key="Parameter_4934" name="xi_KD_Sp8_Br_cAMPS" value="0.166906"/>
          <Constant key="Parameter_4930" name="xi_b_Sp8_Br_cAMPS" value="12.4386"/>
        </ListOfConstants>
        <KineticLaw function="Function_60" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="ModelValue_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="ModelValue_47"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="v_23" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_23">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4933" name="kf_cAMP" value="0.84643"/>
        </ListOfConstants>
        <KineticLaw function="Function_61" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="v_24" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_24">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6782" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_6783" name="kf_cAMP" value="0.84643"/>
        </ListOfConstants>
        <KineticLaw function="Function_62" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="v_25" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_25">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6785" name="KD_IBMX" value="12.463"/>
          <Constant key="Parameter_6781" name="kdeg_cAMP" value="1.41482e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_63" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="ModelValue_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="ModelValue_37"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="v_28" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_26">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6784" name="KD_IBMX" value="12.463"/>
          <Constant key="Parameter_8037" name="kdeg_cAMP" value="1.41482e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_64" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="ModelValue_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="ModelValue_37"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="v_27" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_27">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_16" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8038" name="KD_cAMP" value="2.89846"/>
          <Constant key="Parameter_8040" name="kf_cAMP" value="0.84643"/>
        </ListOfConstants>
        <KineticLaw function="Function_65" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="ModelValue_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="v_15" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_28">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_8036" name="KD_IBMX" value="12.463"/>
          <Constant key="Parameter_8039" name="kdeg_cAMP_free" value="2.82896"/>
        </ListOfConstants>
        <KineticLaw function="Function_66" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="ModelValue_30"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="ModelValue_38"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_29" name="v_13" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_29">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_8012" name="ks_AC_cAMP" value="0.126002"/>
        </ListOfConstants>
        <KineticLaw function="Function_67" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="ModelValue_72"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_30" name="v_14" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_30">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_0" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_28" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_8013" name="ks_AC_cAMP" value="0.126002"/>
          <Constant key="Parameter_8015" name="xi_AC_cAMP_Fsk" value="1184.85"/>
        </ListOfConstants>
        <KineticLaw function="Function_68" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="ModelValue_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="ModelValue_39"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_31" name="cAMP_prod_AC_alphaS_GTP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_31">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_8011" name="ks_AC_cAMP" value="0.126002"/>
          <Constant key="Parameter_8014" name="xi_AC_cAMP_alphaS_GTP" value="99998.6"/>
        </ListOfConstants>
        <KineticLaw function="Function_69" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="ModelValue_72"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="ModelValue_98"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="AC_alphaI_GTP __ AC + alphaI_GTP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_32">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6843" name="k1" value="1.04883"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_94"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_33" name="AC + alphaI_GTP __ AC_alphaI_GTP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_33">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6844" name="KD_AC_alphaI_GTP" value="6802.01"/>
          <Constant key="Parameter_6846" name="kf_AC_alphaI_GTP" value="1.04883"/>
        </ListOfConstants>
        <KineticLaw function="Function_70" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="ModelValue_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="ModelValue_94"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="AC_alphaS_GTP __ AC + alphaS_GTP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_34">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6842" name="k1" value="87172.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_96"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_35" name="AC + alphaS_GTP __ AC_alphaS_GTP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_35">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6845" name="KD_AC_alphaS_GTP" value="0.510578"/>
          <Constant key="Parameter_6631" name="kf_AC_alphaS_GTP" value="87172.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_71" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="ModelValue_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="ModelValue_96"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_36" name="MOR___MOR_DAMGO" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_36">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6632" name="DAMGO" value="0"/>
          <Constant key="Parameter_6634" name="kf_DAMGO" value="7.58998"/>
        </ListOfConstants>
        <KineticLaw function="Function_72" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="ModelValue_76"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_37" name="MOR_DAMGO___MOR" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_37">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6630" name="KD_DAMGO" value="0.92709"/>
          <Constant key="Parameter_6633" name="kf_DAMGO" value="7.58998"/>
        </ListOfConstants>
        <KineticLaw function="Function_73" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="ModelValue_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="ModelValue_76"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_38" name="MOR____MOR_Fentanyl" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_38">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8672" name="Fentanyl" value="0"/>
          <Constant key="Parameter_8673" name="kf_Fentanyl" value="2.54989"/>
        </ListOfConstants>
        <KineticLaw function="Function_74" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="ModelValue_78"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_39" name="MOR_Fentanyl____MOR" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_39">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8675" name="KD_Fentanyl" value="0.0446061"/>
          <Constant key="Parameter_8671" name="kf_Fentanyl" value="2.54989"/>
        </ListOfConstants>
        <KineticLaw function="Function_75" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="ModelValue_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_78"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_40" name="MOR_DAMGO___" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_40">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_8674" name="k1" value="0.0337442"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_82"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_41" name="MOR___deg" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_41">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_8147" name="NO_DAMGO_Fentanyl" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_42" name="MOR___syn" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_42">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_20" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8148" name="NO_DAMGO_Fentanyl" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_43" name="MOR_Fentanyl__" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_43">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_8150" name="k1" value="0.0107448"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_44" name="fiveHT4___fiveHT4_5HT" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_44">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8146" name="fiveHT" value="0"/>
          <Constant key="Parameter_8149" name="kf_5HT" value="100000"/>
        </ListOfConstants>
        <KineticLaw function="Function_78" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="ModelValue_80"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_45" name="fiveHT4_5HT___fiveHT4" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_45">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5744" name="KD_5HT" value="0.0111425"/>
          <Constant key="Parameter_5745" name="kf_5HT" value="100000"/>
        </ListOfConstants>
        <KineticLaw function="Function_79" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="ModelValue_81"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="ModelValue_80"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_46" name="fiveHT4_5HT___" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_46">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_5747" name="k1" value="0.0176947"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_84"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_47" name="fiveHT4___deg" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_47">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_5743" name="NO_fiveHT" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_80" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_48" name="fiveHT4___syn" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_48">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_18" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5746" name="NO_fiveHT" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_81" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Metabolite_18"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_49" name="alphaS_GTP -> alphaS_GDP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_49">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6194" name="k1" value="35.9355"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_85"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_50" name="alphaI_GTP -> alphaI_GDP" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_50">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_6195" name="k1" value="99999.7"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_86"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_51" name="alphaI_GDP + betaI_gammaI -> alphaI_betaI_gammaI" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_51">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_24" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_26" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_28" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6197" name="kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI" value="100000"/>
        </ListOfConstants>
        <KineticLaw function="Function_82" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Metabolite_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Metabolite_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="ModelValue_87"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_52" name="alphaS_GDP + betaS_gammaS -> alphaS_betaS_gammaS" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_52">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6193" name="kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS" value="0.0123465"/>
        </ListOfConstants>
        <KineticLaw function="Function_83" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="ModelValue_88"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_53" name="alphaS_betaS_gammaS  -> alphaS_GTP + betaS_gammaS" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_53">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6196" name="k1" value="0.000804255"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_54" name="alphaS_betaS_gammaS  -> alphaS_GTP + betaS_gammaS, 2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_54">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6626" name="kf_alphaS_betaS_gammaS" value="0.000804255"/>
          <Constant key="Parameter_6627" name="xi_alphaS_betaS_gammaS__fiveHT4_5HT" value="192.041"/>
        </ListOfConstants>
        <KineticLaw function="Function_84" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="ModelValue_90"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_55" name="alphaI_betaI_gammaI -> alphaI_GTP + betaI_gammaI" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_55">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6629" name="k1" value="0.0358323"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_56" name="alphaI_betaI_gammaI -> alphaI_GTP + betaI_gammaI, 2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_56">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6625" name="kf_alphaI_betaI_gammaI" value="0.0358323"/>
          <Constant key="Parameter_6628" name="xi_alphaI_betaI_gammaI__MOR_DAMGO" value="7986.98"/>
        </ListOfConstants>
        <KineticLaw function="Function_85" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="ModelValue_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="ModelValue_92"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_57" name="alphaI_betaI_gammaI -> alphaI_GTP + betaI_gammaI, 3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_57">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_24" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_26" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_22" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7776" name="kf_alphaI_betaI_gammaI" value="0.0358323"/>
          <Constant key="Parameter_7777" name="xi_alphaI_betaI_gammaI__MOR_Fentanyl" value="7303.19"/>
        </ListOfConstants>
        <KineticLaw function="Function_86" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Metabolite_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Metabolite_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="ModelValue_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="ModelValue_93"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_58" name="v_17" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_58">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_16" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_4" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_12" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_14" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7779" name="kf_RII_2__RII_C_2" value="0.320697"/>
        </ListOfConstants>
        <KineticLaw function="Function_87" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Metabolite_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="ModelValue_21"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_59" name="v_16" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_59">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7775" name="k1" value="0.00659629"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_60" name="v_21" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_60">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7778" name="k1" value="0.00670956"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_61" name="v_22" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_61">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7812" name="k1" value="0.0119648"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_1">
      <ModelParameterSet key="ModelParameterSet_1" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[default]" value="1" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt]" value="1" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[nuc]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[AC]" value="6.0074778712334002e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[cAMP]" value="5.0570627425877002e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[C]" value="1.0083589341683822e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[RII_2:C_2]" value="3.6319961305356235e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2]" value="1.3434043700811335e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:cAMP_4]" value="3.8381325214867983e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:cAMP_4]" value="5.3967696828753084e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[Sp8-Br-cAMPS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[Rp-8-Br-cAMPS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[Rp-8-pCPT-cAMPS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[Rp-cAMPS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-Br-cAMPS_4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-8-pCPT-cAMPS_4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Rp-cAMPS_4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:C_2:Sp-8-Br-cAMPS_4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2:Sp-8-Br-cAMPS_4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[pRII_2]" value="4.071800382560562e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[IBMX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[fiveHT4]" value="6.0221407599999871e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[fiveHT4_5HT]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[MOR]" value="6.0221407599999871e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[MOR_DAMGO]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[MOR_Fentanyl]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[alphaS_betaS_gammaS]" value="4.6683224985634559e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[alphaI_betaI_gammaI]" value="6.0066899216774342e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[alphaS_GTP]" value="1.0447025125791068e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[alphaI_GTP]" value="2.1526292414728701e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[AC_alphaS_GTP]" value="5.3212026281104753e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Compartments[cyt],Vector=Metabolites[AC_alphaI_GTP]" value="1.4609676740305617e+21" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_DAMGO_Fentanyl]" value="1" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_fiveHT]" value="1" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMXex]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[H89]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fourABnOH]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[AC_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[RII2_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT4_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[MOR_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[alphaS_betaS_gammaS_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[alphaI_betaI_gammaI_total]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fsk]" value="0.083974094599999993" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_H89]" value="0.00080637721900000004" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_2__RII_C_2]" value="0.32069740079999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_C_2__RII_2]" value="0.0065962945449999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_C_2__RIIp_C_2]" value="0.0067095647750000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_2__RII_2]" value="0.020373114219999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_C_2__RII_C_2]" value="0.01196481699" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_cAMP_C_2__RIIp_2]" value="0.03449649095" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP]" value="0.84642955630000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_Fsk]" value="18.297535570000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_H89]" value="0.047986669619999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_IBMX]" value="12.462966570000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP]" value="2.8984624609999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_IBMX]" value="3635.8221410000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp8_Br_cAMPS_pAB]" value="4.4564282640000004" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp8_pCPT_cAMPS_pAB]" value="5.5019978959999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp_cAMPS_pAB]" value="0.0177866832" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Sp8_Br_cAMPS_AM]" value="0.072500479679999993" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_cAMP]" value="1.41481547e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_cAMP_free]" value="2.828958262" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_AC_cAMP_Fsk]" value="1184.852774" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp8_Br_cAMPS]" value="0.099633236400000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp8_pCPT_cAMPS]" value="0.33252070480000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp_cAMPS]" value="0.1937851592" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Sp8_Br_cAMPS]" value="0.16690599189999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_Br_cAMPS]" value="0.019965457799999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_pCPT_cAMPS]" value="0.014070344800000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp_cAMPS]" value="0.3528916225" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Sp8_Br_cAMPS]" value="12.43856413" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_kf_RII_2__RII_C_2]" value="0.018050676799999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_kf_RII_C_2__RII_2]" value="0.83124267860000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[H89_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMX_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[H89_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMX_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fourABnOH_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fourABnOH_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl_time]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl_level]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[ks_AC_cAMP]" value="0.12600170450000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[rel_open]" value="0.20375817330000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_rel_open]" value="0.91217769660000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Calpha]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_DAMGO]" value="7.5899799379999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_DAMGO]" value="0.92708977640000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fentanyl]" value="2.5498940239999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_Fentanyl]" value="0.044606095300000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_5HT]" value="100000" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_5HT]" value="0.0111424946" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_DAMGO]" value="0.033744229100000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_Fentanyl]" value="0.010744807800000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_5HT]" value="0.017694677299999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_GTP__alphaS_GDP]" value="35.93553867" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_GTP__alphaI_GDP]" value="99999.656889999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI]" value="100000" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS]" value="0.012346466800000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_betaS_gammaS]" value="0.0008042549" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaS_betaS_gammaS__fiveHT4_5HT]" value="192.04113240000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_betaI_gammaI]" value="0.0358322602" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaI_betaI_gammaI__MOR_DAMGO]" value="7986.9759670000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaI_betaI_gammaI__MOR_Fentanyl]" value="7303.1859940000004" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaI_GTP]" value="1.048826467" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_AC_alphaI_GTP]" value="6802.0146269999996" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaS_GTP]" value="87172.453720000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_AC_alphaS_GTP]" value="0.51057807740000005" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_AC_cAMP_alphaS_GTP]" value="99998.641010000007" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[pRII_total]" value="1000.6764503393771" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Calpha_total]" value="0.47218396329013801" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Calpha_H89]" value="-1.1102230246251565e-15" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[s_j]" value="1.078915082199045" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[s_pRII_global]" value="2565.2638041728856" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[b_j]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[b_pRII_global]" value="316.51500456818707" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[s_Calpha_global]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[b_Calpha_global]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[s_pRII_Western]" value="0" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_0]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_0],ParameterGroup=Parameters,Parameter=Sp8_Br_cAMPS_AM" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Sp8_Br_cAMPS_AM],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_0],ParameterGroup=Parameters,Parameter=ki_Sp8_Br_cAMPS_AM" value="0.072500479679999993" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Sp8_Br_cAMPS_AM],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_1],ParameterGroup=Parameters,Parameter=Rp8_Br_cAMPS_pAB" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_Br_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_1],ParameterGroup=Parameters,Parameter=ki_Rp8_Br_cAMPS_pAB" value="4.4564282640000004" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp8_Br_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_2],ParameterGroup=Parameters,Parameter=Rp8_pCPT_cAMPS_pAB" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp8_pCPT_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_2],ParameterGroup=Parameters,Parameter=ki_Rp8_pCPT_cAMPS_pAB" value="5.5019978959999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp8_pCPT_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_3],ParameterGroup=Parameters,Parameter=Rp_cAMPS_pAB" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Rp_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_3],ParameterGroup=Parameters,Parameter=ki_Rp_cAMPS_pAB" value="0.0177866832" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_Rp_cAMPS_pAB],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_4],ParameterGroup=Parameters,Parameter=IBMXex" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[IBMXex],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_4],ParameterGroup=Parameters,Parameter=ki_IBMX" value="3635.8221410000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ki_IBMX],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_5]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_5],ParameterGroup=Parameters,Parameter=Fsk" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fsk],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_5],ParameterGroup=Parameters,Parameter=kf_Fsk" value="0.083974094599999993" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fsk],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_6]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_6],ParameterGroup=Parameters,Parameter=KD_Fsk" value="18.297535570000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_Fsk],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_6],ParameterGroup=Parameters,Parameter=kf_Fsk" value="0.083974094599999993" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fsk],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_39]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_39],ParameterGroup=Parameters,Parameter=H89" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[H89],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_39],ParameterGroup=Parameters,Parameter=kf_H89" value="0.00080637721900000004" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_H89],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_40]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_40],ParameterGroup=Parameters,Parameter=KD_H89" value="0.047986669619999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_H89],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_40],ParameterGroup=Parameters,Parameter=kf_H89" value="0.00080637721900000004" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_H89],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_29]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_29],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_29],ParameterGroup=Parameters,Parameter=xi_b_Rp8_Br_cAMPS" value="0.019965457799999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_30]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_30],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_30],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_30],ParameterGroup=Parameters,Parameter=xi_KD_Rp8_Br_cAMPS" value="0.099633236400000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_30],ParameterGroup=Parameters,Parameter=xi_b_Rp8_Br_cAMPS" value="0.019965457799999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_31]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_31],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_31],ParameterGroup=Parameters,Parameter=xi_b_Rp8_pCPT_cAMPS" value="0.014070344800000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_pCPT_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_32]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_32],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_32],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_32],ParameterGroup=Parameters,Parameter=xi_KD_Rp8_pCPT_cAMPS" value="0.33252070480000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp8_pCPT_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_32],ParameterGroup=Parameters,Parameter=xi_b_Rp8_pCPT_cAMPS" value="0.014070344800000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp8_pCPT_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_33]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_33],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_33],ParameterGroup=Parameters,Parameter=xi_b_Rp_cAMPS" value="0.3528916225" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_34]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_34],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_34],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_34],ParameterGroup=Parameters,Parameter=xi_KD_Rp_cAMPS" value="0.1937851592" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Rp_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_34],ParameterGroup=Parameters,Parameter=xi_b_Rp_cAMPS" value="0.3528916225" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Rp_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_35]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_35],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_35],ParameterGroup=Parameters,Parameter=xi_b_Sp8_Br_cAMPS" value="12.43856413" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Sp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_36]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_36],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_36],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_36],ParameterGroup=Parameters,Parameter=xi_KD_Sp8_Br_cAMPS" value="0.16690599189999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Sp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_36],ParameterGroup=Parameters,Parameter=xi_b_Sp8_Br_cAMPS" value="12.43856413" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Sp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_37]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_37],ParameterGroup=Parameters,Parameter=k1" value="0.03449649095" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_cAMP_C_2__RIIp_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_26]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_26],ParameterGroup=Parameters,Parameter=k1" value="0.03449649095" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_cAMP_C_2__RIIp_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_18]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_18],ParameterGroup=Parameters,Parameter=kf_RII_C_2__RII_2" value="0.0065962945449999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_C_2__RII_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_18],ParameterGroup=Parameters,Parameter=xi_kf_RII_C_2__RII_2" value="0.83124267860000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_kf_RII_C_2__RII_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_19]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_19],ParameterGroup=Parameters,Parameter=kf_RII_2__RII_C_2" value="0.32069740079999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_2__RII_C_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_19],ParameterGroup=Parameters,Parameter=xi_kf_RII_2__RII_C_2" value="0.018050676799999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_kf_RII_2__RII_C_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_20]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_20],ParameterGroup=Parameters,Parameter=k1" value="0.020373114219999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_2__RII_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_38]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_38],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_38],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_38],ParameterGroup=Parameters,Parameter=xi_KD_Sp8_Br_cAMPS" value="0.16690599189999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_KD_Sp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_38],ParameterGroup=Parameters,Parameter=xi_b_Sp8_Br_cAMPS" value="12.43856413" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_b_Sp8_Br_cAMPS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_23]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_23],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_24]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_24],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_24],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_25]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_25],ParameterGroup=Parameters,Parameter=KD_IBMX" value="12.462966570000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_IBMX],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_25],ParameterGroup=Parameters,Parameter=kdeg_cAMP" value="1.41481547e-05" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_28]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_28],ParameterGroup=Parameters,Parameter=KD_IBMX" value="12.462966570000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_IBMX],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_28],ParameterGroup=Parameters,Parameter=kdeg_cAMP" value="1.41481547e-05" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_27]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_27],ParameterGroup=Parameters,Parameter=KD_cAMP" value="2.8984624609999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_27],ParameterGroup=Parameters,Parameter=kf_cAMP" value="0.84642955630000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_15]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_15],ParameterGroup=Parameters,Parameter=KD_IBMX" value="12.462966570000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_IBMX],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_15],ParameterGroup=Parameters,Parameter=kdeg_cAMP_free" value="2.828958262" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_cAMP_free],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_13]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_13],ParameterGroup=Parameters,Parameter=ks_AC_cAMP" value="0.12600170450000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ks_AC_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_14]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_14],ParameterGroup=Parameters,Parameter=ks_AC_cAMP" value="0.12600170450000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ks_AC_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_14],ParameterGroup=Parameters,Parameter=xi_AC_cAMP_Fsk" value="1184.852774" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_AC_cAMP_Fsk],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[cAMP_prod_AC_alphaS_GTP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[cAMP_prod_AC_alphaS_GTP],ParameterGroup=Parameters,Parameter=ks_AC_cAMP" value="0.12600170450000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[ks_AC_cAMP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[cAMP_prod_AC_alphaS_GTP],ParameterGroup=Parameters,Parameter=xi_AC_cAMP_alphaS_GTP" value="99998.641010000007" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_AC_cAMP_alphaS_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC_alphaI_GTP __ AC + alphaI_GTP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC_alphaI_GTP __ AC + alphaI_GTP],ParameterGroup=Parameters,Parameter=k1" value="1.048826467" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaI_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaI_GTP __ AC_alphaI_GTP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaI_GTP __ AC_alphaI_GTP],ParameterGroup=Parameters,Parameter=KD_AC_alphaI_GTP" value="6802.0146269999996" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_AC_alphaI_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaI_GTP __ AC_alphaI_GTP],ParameterGroup=Parameters,Parameter=kf_AC_alphaI_GTP" value="1.048826467" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaI_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC_alphaS_GTP __ AC + alphaS_GTP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC_alphaS_GTP __ AC + alphaS_GTP],ParameterGroup=Parameters,Parameter=k1" value="87172.453720000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaS_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaS_GTP __ AC_alphaS_GTP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaS_GTP __ AC_alphaS_GTP],ParameterGroup=Parameters,Parameter=KD_AC_alphaS_GTP" value="0.51057807740000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_AC_alphaS_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[AC + alphaS_GTP __ AC_alphaS_GTP],ParameterGroup=Parameters,Parameter=kf_AC_alphaS_GTP" value="87172.453720000005" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_AC_alphaS_GTP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___MOR_DAMGO]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___MOR_DAMGO],ParameterGroup=Parameters,Parameter=DAMGO" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___MOR_DAMGO],ParameterGroup=Parameters,Parameter=kf_DAMGO" value="7.5899799379999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_DAMGO___MOR]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_DAMGO___MOR],ParameterGroup=Parameters,Parameter=KD_DAMGO" value="0.92708977640000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_DAMGO___MOR],ParameterGroup=Parameters,Parameter=kf_DAMGO" value="7.5899799379999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR____MOR_Fentanyl]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR____MOR_Fentanyl],ParameterGroup=Parameters,Parameter=Fentanyl" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR____MOR_Fentanyl],ParameterGroup=Parameters,Parameter=kf_Fentanyl" value="2.5498940239999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_Fentanyl____MOR]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_Fentanyl____MOR],ParameterGroup=Parameters,Parameter=KD_Fentanyl" value="0.044606095300000002" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_Fentanyl____MOR],ParameterGroup=Parameters,Parameter=kf_Fentanyl" value="2.5498940239999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_DAMGO___]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_DAMGO___],ParameterGroup=Parameters,Parameter=k1" value="0.033744229100000002" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___deg]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___deg],ParameterGroup=Parameters,Parameter=NO_DAMGO_Fentanyl" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_DAMGO_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___syn]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR___syn],ParameterGroup=Parameters,Parameter=NO_DAMGO_Fentanyl" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_DAMGO_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_Fentanyl__]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[MOR_Fentanyl__],ParameterGroup=Parameters,Parameter=k1" value="0.010744807800000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___fiveHT4_5HT]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___fiveHT4_5HT],ParameterGroup=Parameters,Parameter=fiveHT" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[fiveHT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___fiveHT4_5HT],ParameterGroup=Parameters,Parameter=kf_5HT" value="100000" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_5HT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4_5HT___fiveHT4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4_5HT___fiveHT4],ParameterGroup=Parameters,Parameter=KD_5HT" value="0.0111424946" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[KD_5HT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4_5HT___fiveHT4],ParameterGroup=Parameters,Parameter=kf_5HT" value="100000" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_5HT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4_5HT___]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4_5HT___],ParameterGroup=Parameters,Parameter=k1" value="0.017694677299999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kdeg_5HT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___deg]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___deg],ParameterGroup=Parameters,Parameter=NO_fiveHT" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_fiveHT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___syn]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[fiveHT4___syn],ParameterGroup=Parameters,Parameter=NO_fiveHT" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[NO_fiveHT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_GTP -\> alphaS_GDP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_GTP -\> alphaS_GDP],ParameterGroup=Parameters,Parameter=k1" value="35.93553867" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_GTP__alphaS_GDP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_GTP -\> alphaI_GDP]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_GTP -\> alphaI_GDP],ParameterGroup=Parameters,Parameter=k1" value="99999.656889999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_GTP__alphaI_GDP],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_GDP + betaI_gammaI -\> alphaI_betaI_gammaI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_GDP + betaI_gammaI -\> alphaI_betaI_gammaI],ParameterGroup=Parameters,Parameter=kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI" value="100000" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_GDP + betaS_gammaS -\> alphaS_betaS_gammaS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_GDP + betaS_gammaS -\> alphaS_betaS_gammaS],ParameterGroup=Parameters,Parameter=kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS" value="0.012346466800000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_betaS_gammaS  -\> alphaS_GTP + betaS_gammaS]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_betaS_gammaS  -\> alphaS_GTP + betaS_gammaS],ParameterGroup=Parameters,Parameter=k1" value="0.0008042549" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_betaS_gammaS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_betaS_gammaS  -\> alphaS_GTP + betaS_gammaS\, 2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_betaS_gammaS  -\> alphaS_GTP + betaS_gammaS\, 2],ParameterGroup=Parameters,Parameter=kf_alphaS_betaS_gammaS" value="0.0008042549" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaS_betaS_gammaS],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaS_betaS_gammaS  -\> alphaS_GTP + betaS_gammaS\, 2],ParameterGroup=Parameters,Parameter=xi_alphaS_betaS_gammaS__fiveHT4_5HT" value="192.04113240000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaS_betaS_gammaS__fiveHT4_5HT],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI],ParameterGroup=Parameters,Parameter=k1" value="0.0358322602" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_betaI_gammaI],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 2],ParameterGroup=Parameters,Parameter=kf_alphaI_betaI_gammaI" value="0.0358322602" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_betaI_gammaI],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 2],ParameterGroup=Parameters,Parameter=xi_alphaI_betaI_gammaI__MOR_DAMGO" value="7986.9759670000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaI_betaI_gammaI__MOR_DAMGO],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 3],ParameterGroup=Parameters,Parameter=kf_alphaI_betaI_gammaI" value="0.0358322602" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_alphaI_betaI_gammaI],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[alphaI_betaI_gammaI -\> alphaI_GTP + betaI_gammaI\, 3],ParameterGroup=Parameters,Parameter=xi_alphaI_betaI_gammaI__MOR_Fentanyl" value="7303.1859940000004" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[xi_alphaI_betaI_gammaI__MOR_Fentanyl],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_17]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_17],ParameterGroup=Parameters,Parameter=kf_RII_2__RII_C_2" value="0.32069740079999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_2__RII_C_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_16]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_16],ParameterGroup=Parameters,Parameter=k1" value="0.0065962945449999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_C_2__RII_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_21]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_21],ParameterGroup=Parameters,Parameter=k1" value="0.0067095647750000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RII_C_2__RIIp_C_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_22]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=PKA cycle and MOR,Vector=Reactions[v_22],ParameterGroup=Parameters,Parameter=k1" value="0.01196481699" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=PKA cycle and MOR,Vector=Values[kf_RIIp_C_2__RII_C_2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_20"/>
      <StateTemplateVariable objectReference="Metabolite_16"/>
      <StateTemplateVariable objectReference="Metabolite_26"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_18"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_24"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_22"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_28"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_99"/>
      <StateTemplateVariable objectReference="ModelValue_100"/>
      <StateTemplateVariable objectReference="ModelValue_101"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="Compartment_2"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_14"/>
      <StateTemplateVariable objectReference="ModelValue_15"/>
      <StateTemplateVariable objectReference="ModelValue_16"/>
      <StateTemplateVariable objectReference="ModelValue_17"/>
      <StateTemplateVariable objectReference="ModelValue_18"/>
      <StateTemplateVariable objectReference="ModelValue_19"/>
      <StateTemplateVariable objectReference="ModelValue_20"/>
      <StateTemplateVariable objectReference="ModelValue_21"/>
      <StateTemplateVariable objectReference="ModelValue_22"/>
      <StateTemplateVariable objectReference="ModelValue_23"/>
      <StateTemplateVariable objectReference="ModelValue_24"/>
      <StateTemplateVariable objectReference="ModelValue_25"/>
      <StateTemplateVariable objectReference="ModelValue_26"/>
      <StateTemplateVariable objectReference="ModelValue_27"/>
      <StateTemplateVariable objectReference="ModelValue_28"/>
      <StateTemplateVariable objectReference="ModelValue_29"/>
      <StateTemplateVariable objectReference="ModelValue_30"/>
      <StateTemplateVariable objectReference="ModelValue_31"/>
      <StateTemplateVariable objectReference="ModelValue_32"/>
      <StateTemplateVariable objectReference="ModelValue_33"/>
      <StateTemplateVariable objectReference="ModelValue_34"/>
      <StateTemplateVariable objectReference="ModelValue_35"/>
      <StateTemplateVariable objectReference="ModelValue_36"/>
      <StateTemplateVariable objectReference="ModelValue_37"/>
      <StateTemplateVariable objectReference="ModelValue_38"/>
      <StateTemplateVariable objectReference="ModelValue_39"/>
      <StateTemplateVariable objectReference="ModelValue_40"/>
      <StateTemplateVariable objectReference="ModelValue_41"/>
      <StateTemplateVariable objectReference="ModelValue_42"/>
      <StateTemplateVariable objectReference="ModelValue_43"/>
      <StateTemplateVariable objectReference="ModelValue_44"/>
      <StateTemplateVariable objectReference="ModelValue_45"/>
      <StateTemplateVariable objectReference="ModelValue_46"/>
      <StateTemplateVariable objectReference="ModelValue_47"/>
      <StateTemplateVariable objectReference="ModelValue_48"/>
      <StateTemplateVariable objectReference="ModelValue_49"/>
      <StateTemplateVariable objectReference="ModelValue_50"/>
      <StateTemplateVariable objectReference="ModelValue_51"/>
      <StateTemplateVariable objectReference="ModelValue_52"/>
      <StateTemplateVariable objectReference="ModelValue_53"/>
      <StateTemplateVariable objectReference="ModelValue_54"/>
      <StateTemplateVariable objectReference="ModelValue_55"/>
      <StateTemplateVariable objectReference="ModelValue_56"/>
      <StateTemplateVariable objectReference="ModelValue_57"/>
      <StateTemplateVariable objectReference="ModelValue_58"/>
      <StateTemplateVariable objectReference="ModelValue_59"/>
      <StateTemplateVariable objectReference="ModelValue_60"/>
      <StateTemplateVariable objectReference="ModelValue_61"/>
      <StateTemplateVariable objectReference="ModelValue_62"/>
      <StateTemplateVariable objectReference="ModelValue_63"/>
      <StateTemplateVariable objectReference="ModelValue_64"/>
      <StateTemplateVariable objectReference="ModelValue_65"/>
      <StateTemplateVariable objectReference="ModelValue_66"/>
      <StateTemplateVariable objectReference="ModelValue_67"/>
      <StateTemplateVariable objectReference="ModelValue_68"/>
      <StateTemplateVariable objectReference="ModelValue_69"/>
      <StateTemplateVariable objectReference="ModelValue_70"/>
      <StateTemplateVariable objectReference="ModelValue_71"/>
      <StateTemplateVariable objectReference="ModelValue_72"/>
      <StateTemplateVariable objectReference="ModelValue_73"/>
      <StateTemplateVariable objectReference="ModelValue_74"/>
      <StateTemplateVariable objectReference="ModelValue_75"/>
      <StateTemplateVariable objectReference="ModelValue_76"/>
      <StateTemplateVariable objectReference="ModelValue_77"/>
      <StateTemplateVariable objectReference="ModelValue_78"/>
      <StateTemplateVariable objectReference="ModelValue_79"/>
      <StateTemplateVariable objectReference="ModelValue_80"/>
      <StateTemplateVariable objectReference="ModelValue_81"/>
      <StateTemplateVariable objectReference="ModelValue_82"/>
      <StateTemplateVariable objectReference="ModelValue_83"/>
      <StateTemplateVariable objectReference="ModelValue_84"/>
      <StateTemplateVariable objectReference="ModelValue_85"/>
      <StateTemplateVariable objectReference="ModelValue_86"/>
      <StateTemplateVariable objectReference="ModelValue_87"/>
      <StateTemplateVariable objectReference="ModelValue_88"/>
      <StateTemplateVariable objectReference="ModelValue_89"/>
      <StateTemplateVariable objectReference="ModelValue_90"/>
      <StateTemplateVariable objectReference="ModelValue_91"/>
      <StateTemplateVariable objectReference="ModelValue_92"/>
      <StateTemplateVariable objectReference="ModelValue_93"/>
      <StateTemplateVariable objectReference="ModelValue_94"/>
      <StateTemplateVariable objectReference="ModelValue_95"/>
      <StateTemplateVariable objectReference="ModelValue_96"/>
      <StateTemplateVariable objectReference="ModelValue_97"/>
      <StateTemplateVariable objectReference="ModelValue_98"/>
      <StateTemplateVariable objectReference="ModelValue_102"/>
      <StateTemplateVariable objectReference="ModelValue_103"/>
      <StateTemplateVariable objectReference="ModelValue_104"/>
      <StateTemplateVariable objectReference="ModelValue_105"/>
      <StateTemplateVariable objectReference="ModelValue_106"/>
      <StateTemplateVariable objectReference="ModelValue_107"/>
      <StateTemplateVariable objectReference="ModelValue_108"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 1.3434043700811335e+23 1.0083589341683822e+23 6.0074778712334002e+23 6.0221407599999871e+23 4.071800382560562e+22 2.1526292414728701e+17 1.0447025125791068e+19 5.0570627425877002e+22 6.0221407599999871e+23 3.8381325214867983e+21 3.6319961305356235e+23 0 6.0066899216774342e+23 0 0 4.6683224985634559e+23 0 5.3967696828753084e+19 0 0 0 0 0 0 0 0 1.4609676740305617e+21 0 5.3212026281104753e+18 0 0 0 0 1 1 0 0 0 0 0 0 0 1000.6764503393771 0.47218396329013801 -1.1102230246251565e-15 1 1 1 1 1 1 1 1 1 0.083974094599999993 0.00080637721900000004 0.32069740079999998 0.0065962945449999999 0.0067095647750000003 0.020373114219999999 0.01196481699 0.03449649095 0.84642955630000005 18.297535570000001 0.047986669619999998 12.462966570000001 2.8984624609999998 3635.8221410000001 4.4564282640000004 5.5019978959999998 0.0177866832 0.072500479679999993 1.41481547e-05 2.828958262 1184.852774 0.099633236400000005 0.33252070480000001 0.1937851592 0.16690599189999999 0.019965457799999999 0.014070344800000001 0.3528916225 12.43856413 0.018050676799999998 0.83124267860000001 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.12600170450000001 0.20375817330000001 0.91217769660000003 0 7.5899799379999999 0.92708977640000001 2.5498940239999999 0.044606095300000002 100000 0.0111424946 0.033744229100000002 0.010744807800000001 0.017694677299999999 35.93553867 99999.656889999998 100000 0.012346466800000001 0.0008042549 192.04113240000001 0.0358322602 7986.9759670000003 7303.1859940000004 1.048826467 6802.0146269999996 87172.453720000005 0.51057807740000005 99998.641010000007 1.078915082199045 2565.2638041728856 1 316.51500456818707 1 0 0 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_17" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_18" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="434"/>
        <Parameter name="StepSize" type="float" value="0.29953917050691242"/>
        <Parameter name="Duration" type="float" value="130"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_19" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Subtask Output" type="string" value="subTaskDuring"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_20" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_21" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="DisplayPopulations" type="bool" value="0"/>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_22" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
        <Parameter name="DisplayPopulations" type="bool" value="0"/>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_23" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_24" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_25" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_18" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_26" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_19" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_27" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_20" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_28" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_29" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_21" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_30" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_11" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_12" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_13" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_14" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_17" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_18" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_19" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_20" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_21" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <ListOfPlots>
    <PlotSpecification name="pRII_total" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <Parameter name="plot engine" type="string" value="QCustomPlot"/>
      <Parameter name="x axis" type="string" value=""/>
      <Parameter name="y axis" type="string" value=""/>
      <Parameter name="z axis" type="string" value=""/>
      <ListOfPlotItems>
        <PlotItem name="Values[pRII_total]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1.2"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=PKA cycle and MOR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[pRII_total],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Calpha_total" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <Parameter name="plot engine" type="string" value="QCustomPlot"/>
      <Parameter name="x axis" type="string" value=""/>
      <Parameter name="y axis" type="string" value=""/>
      <Parameter name="z axis" type="string" value=""/>
      <ListOfPlotItems>
        <PlotItem name="Values[Calpha_total]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1.2"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=PKA cycle and MOR,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=PKA cycle and MOR,Vector=Values[Calpha_total],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <SBMLReference file="PKAcycleMOR_model.xml">
    <SBMLMap SBMLid="AC" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="AC___alphaI_GTP____AC_alphaI_GTP" COPASIkey="Reaction_33"/>
    <SBMLMap SBMLid="AC___alphaS_GTP_____AC_alphaS_GTP" COPASIkey="Reaction_35"/>
    <SBMLMap SBMLid="AC_alphaI_GTP" COPASIkey="Metabolite_28"/>
    <SBMLMap SBMLid="AC_alphaI_GTP____AC___alphaI_GTP" COPASIkey="Reaction_32"/>
    <SBMLMap SBMLid="AC_alphaS_GTP" COPASIkey="Metabolite_27"/>
    <SBMLMap SBMLid="AC_alphaS_GTP_____AC___alphaS_GTP" COPASIkey="Reaction_34"/>
    <SBMLMap SBMLid="AC_total" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="Calpha" COPASIkey="ModelValue_75"/>
    <SBMLMap SBMLid="Csub" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="DAMGO" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="DAMGO_level" COPASIkey="ModelValue_69"/>
    <SBMLMap SBMLid="DAMGO_time" COPASIkey="ModelValue_68"/>
    <SBMLMap SBMLid="Fentanyl" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="Fentanyl_level" COPASIkey="ModelValue_71"/>
    <SBMLMap SBMLid="Fentanyl_time" COPASIkey="ModelValue_70"/>
    <SBMLMap SBMLid="Fsk" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="Fsk_level" COPASIkey="ModelValue_50"/>
    <SBMLMap SBMLid="Fsk_time" COPASIkey="ModelValue_51"/>
    <SBMLMap SBMLid="H89" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="H89_level" COPASIkey="ModelValue_52"/>
    <SBMLMap SBMLid="H89_time" COPASIkey="ModelValue_56"/>
    <SBMLMap SBMLid="IBMX" COPASIkey="Metabolite_17"/>
    <SBMLMap SBMLid="IBMX_level" COPASIkey="ModelValue_53"/>
    <SBMLMap SBMLid="IBMX_time" COPASIkey="ModelValue_57"/>
    <SBMLMap SBMLid="IBMXex" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="KD_5HT" COPASIkey="ModelValue_81"/>
    <SBMLMap SBMLid="KD_AC_alphaI_GTP" COPASIkey="ModelValue_95"/>
    <SBMLMap SBMLid="KD_AC_alphaS_GTP" COPASIkey="ModelValue_97"/>
    <SBMLMap SBMLid="KD_DAMGO" COPASIkey="ModelValue_77"/>
    <SBMLMap SBMLid="KD_Fentanyl" COPASIkey="ModelValue_79"/>
    <SBMLMap SBMLid="KD_Fsk" COPASIkey="ModelValue_28"/>
    <SBMLMap SBMLid="KD_H89" COPASIkey="ModelValue_29"/>
    <SBMLMap SBMLid="KD_IBMX" COPASIkey="ModelValue_30"/>
    <SBMLMap SBMLid="KD_cAMP" COPASIkey="ModelValue_31"/>
    <SBMLMap SBMLid="MOR" COPASIkey="Metabolite_20"/>
    <SBMLMap SBMLid="MOR_DAMGO" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="MOR_DAMGO___" COPASIkey="Reaction_40"/>
    <SBMLMap SBMLid="MOR_DAMGO____MOR" COPASIkey="Reaction_37"/>
    <SBMLMap SBMLid="MOR_Fentanyl" COPASIkey="Metabolite_22"/>
    <SBMLMap SBMLid="MOR_Fentanyl__" COPASIkey="Reaction_43"/>
    <SBMLMap SBMLid="MOR_Fentanyl____MOR" COPASIkey="Reaction_39"/>
    <SBMLMap SBMLid="MOR____MOR_DAMGO" COPASIkey="Reaction_36"/>
    <SBMLMap SBMLid="MOR____MOR_Fentanyl" COPASIkey="Reaction_38"/>
    <SBMLMap SBMLid="MOR___deg" COPASIkey="Reaction_41"/>
    <SBMLMap SBMLid="MOR___syn" COPASIkey="Reaction_42"/>
    <SBMLMap SBMLid="MOR_total" COPASIkey="ModelValue_16"/>
    <SBMLMap SBMLid="NO_DAMGO_Fentanyl" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="NO_fiveHT" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="RII2_total" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="RII_C_2" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="RIIp_2" COPASIkey="Metabolite_16"/>
    <SBMLMap SBMLid="RIIp_C_2" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="RIIp_Rp8_Br_cAMPS_C_2" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="RIIp_Rp8_pCPT_cAMPS_C_2" COPASIkey="Metabolite_12"/>
    <SBMLMap SBMLid="RIIp_Rp_cAMPS_C_2" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="RIIp_Sp8_Br_cAMPS_2" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="RIIp_Sp8_Br_cAMPS_C_2" COPASIkey="Metabolite_14"/>
    <SBMLMap SBMLid="RIIp_cAMP_2" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="RIIp_cAMP_C_2" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="Rp8_Br_cAMPS" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="Rp8_Br_cAMPS_pAB" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="Rp8_Br_cAMPS_pAB_level" COPASIkey="ModelValue_54"/>
    <SBMLMap SBMLid="Rp8_Br_cAMPS_pAB_time" COPASIkey="ModelValue_55"/>
    <SBMLMap SBMLid="Rp8_pCPT_cAMPS" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="Rp8_pCPT_cAMPS_pAB" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="Rp8_pCPT_cAMPS_pAB_level" COPASIkey="ModelValue_58"/>
    <SBMLMap SBMLid="Rp8_pCPT_cAMPS_pAB_time" COPASIkey="ModelValue_59"/>
    <SBMLMap SBMLid="Rp_cAMPS" COPASIkey="Metabolite_10"/>
    <SBMLMap SBMLid="Rp_cAMPS_pAB" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="Rp_cAMPS_pAB_level" COPASIkey="ModelValue_60"/>
    <SBMLMap SBMLid="Rp_cAMPS_pAB_time" COPASIkey="ModelValue_61"/>
    <SBMLMap SBMLid="Sp8_Br_cAMPS" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="Sp8_Br_cAMPS_AM" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="Sp8_Br_cAMPS_AM_level" COPASIkey="ModelValue_62"/>
    <SBMLMap SBMLid="Sp8_Br_cAMPS_AM_time" COPASIkey="ModelValue_63"/>
    <SBMLMap SBMLid="alphaI_GDP___betaI_gammaI____alphaI_betaI_gammaI" COPASIkey="Reaction_51"/>
    <SBMLMap SBMLid="alphaI_GTP" COPASIkey="Metabolite_26"/>
    <SBMLMap SBMLid="alphaI_GTP____alphaI_GDP" COPASIkey="Reaction_50"/>
    <SBMLMap SBMLid="alphaI_betaI_gammaI" COPASIkey="Metabolite_24"/>
    <SBMLMap SBMLid="alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI" COPASIkey="Reaction_55"/>
    <SBMLMap SBMLid="alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__2" COPASIkey="Reaction_56"/>
    <SBMLMap SBMLid="alphaI_betaI_gammaI____alphaI_GTP___betaI_gammaI__3" COPASIkey="Reaction_57"/>
    <SBMLMap SBMLid="alphaI_betaI_gammaI_total" COPASIkey="ModelValue_18"/>
    <SBMLMap SBMLid="alphaS_GDP___betaS_gammaS____alphaS_betaS_gammaS" COPASIkey="Reaction_52"/>
    <SBMLMap SBMLid="alphaS_GTP" COPASIkey="Metabolite_25"/>
    <SBMLMap SBMLid="alphaS_GTP____alphaS_GDP" COPASIkey="Reaction_49"/>
    <SBMLMap SBMLid="alphaS_betaS_gammaS" COPASIkey="Metabolite_23"/>
    <SBMLMap SBMLid="alphaS_betaS_gammaS_____alphaS_GTP___betaS_gammaS" COPASIkey="Reaction_53"/>
    <SBMLMap SBMLid="alphaS_betaS_gammaS_____alphaS_GTP___betaS_gammaS__2" COPASIkey="Reaction_54"/>
    <SBMLMap SBMLid="alphaS_betaS_gammaS_total" COPASIkey="ModelValue_17"/>
    <SBMLMap SBMLid="cAMP" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="cAMP_prod_AC_alphaS_GTP" COPASIkey="Reaction_31"/>
    <SBMLMap SBMLid="cyt" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="default" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="fiveHT" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="fiveHT4" COPASIkey="Metabolite_18"/>
    <SBMLMap SBMLid="fiveHT4_5HT" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="fiveHT4_5HT___" COPASIkey="Reaction_46"/>
    <SBMLMap SBMLid="fiveHT4_5HT___fiveHT4" COPASIkey="Reaction_45"/>
    <SBMLMap SBMLid="fiveHT4___deg" COPASIkey="Reaction_47"/>
    <SBMLMap SBMLid="fiveHT4___fiveHT4_5HT" COPASIkey="Reaction_44"/>
    <SBMLMap SBMLid="fiveHT4___syn" COPASIkey="Reaction_48"/>
    <SBMLMap SBMLid="fiveHT4_total" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="fiveHT_level" COPASIkey="ModelValue_67"/>
    <SBMLMap SBMLid="fiveHT_time" COPASIkey="ModelValue_66"/>
    <SBMLMap SBMLid="fourABnOH" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="fourABnOH_level" COPASIkey="ModelValue_64"/>
    <SBMLMap SBMLid="fourABnOH_time" COPASIkey="ModelValue_65"/>
    <SBMLMap SBMLid="kdeg_5HT" COPASIkey="ModelValue_84"/>
    <SBMLMap SBMLid="kdeg_DAMGO" COPASIkey="ModelValue_82"/>
    <SBMLMap SBMLid="kdeg_Fentanyl" COPASIkey="ModelValue_83"/>
    <SBMLMap SBMLid="kdeg_cAMP" COPASIkey="ModelValue_37"/>
    <SBMLMap SBMLid="kdeg_cAMP_free" COPASIkey="ModelValue_38"/>
    <SBMLMap SBMLid="kf_5HT" COPASIkey="ModelValue_80"/>
    <SBMLMap SBMLid="kf_AC_alphaI_GTP" COPASIkey="ModelValue_94"/>
    <SBMLMap SBMLid="kf_AC_alphaS_GTP" COPASIkey="ModelValue_96"/>
    <SBMLMap SBMLid="kf_DAMGO" COPASIkey="ModelValue_76"/>
    <SBMLMap SBMLid="kf_Fentanyl" COPASIkey="ModelValue_78"/>
    <SBMLMap SBMLid="kf_Fsk" COPASIkey="ModelValue_19"/>
    <SBMLMap SBMLid="kf_H89" COPASIkey="ModelValue_20"/>
    <SBMLMap SBMLid="kf_RII_2__RII_C_2" COPASIkey="ModelValue_21"/>
    <SBMLMap SBMLid="kf_RII_C_2__RII_2" COPASIkey="ModelValue_22"/>
    <SBMLMap SBMLid="kf_RII_C_2__RIIp_C_2" COPASIkey="ModelValue_23"/>
    <SBMLMap SBMLid="kf_RIIp_2__RII_2" COPASIkey="ModelValue_24"/>
    <SBMLMap SBMLid="kf_RIIp_C_2__RII_C_2" COPASIkey="ModelValue_25"/>
    <SBMLMap SBMLid="kf_RIIp_cAMP_C_2__RIIp_2" COPASIkey="ModelValue_26"/>
    <SBMLMap SBMLid="kf_alphaI_GDP__betaI_gammaI____alphaI_betaI_gammaI" COPASIkey="ModelValue_87"/>
    <SBMLMap SBMLid="kf_alphaI_GTP__alphaI_GDP" COPASIkey="ModelValue_86"/>
    <SBMLMap SBMLid="kf_alphaI_betaI_gammaI" COPASIkey="ModelValue_91"/>
    <SBMLMap SBMLid="kf_alphaS_GDP__betaS_gammaS____alphaS_betaS_gammaS" COPASIkey="ModelValue_88"/>
    <SBMLMap SBMLid="kf_alphaS_GTP__alphaS_GDP" COPASIkey="ModelValue_85"/>
    <SBMLMap SBMLid="kf_alphaS_betaS_gammaS" COPASIkey="ModelValue_89"/>
    <SBMLMap SBMLid="kf_cAMP" COPASIkey="ModelValue_27"/>
    <SBMLMap SBMLid="ki_IBMX" COPASIkey="ModelValue_32"/>
    <SBMLMap SBMLid="ki_Rp8_Br_cAMPS_pAB" COPASIkey="ModelValue_33"/>
    <SBMLMap SBMLid="ki_Rp8_pCPT_cAMPS_pAB" COPASIkey="ModelValue_34"/>
    <SBMLMap SBMLid="ki_Rp_cAMPS_pAB" COPASIkey="ModelValue_35"/>
    <SBMLMap SBMLid="ki_Sp8_Br_cAMPS_AM" COPASIkey="ModelValue_36"/>
    <SBMLMap SBMLid="ks_AC_cAMP" COPASIkey="ModelValue_72"/>
    <SBMLMap SBMLid="nuc" COPASIkey="Compartment_2"/>
    <SBMLMap SBMLid="rel_open" COPASIkey="ModelValue_73"/>
    <SBMLMap SBMLid="v14_v_13" COPASIkey="Reaction_29"/>
    <SBMLMap SBMLid="v15_v_14" COPASIkey="Reaction_30"/>
    <SBMLMap SBMLid="v16_v_15" COPASIkey="Reaction_28"/>
    <SBMLMap SBMLid="v17_v_16" COPASIkey="Reaction_59"/>
    <SBMLMap SBMLid="v18_v_17" COPASIkey="Reaction_58"/>
    <SBMLMap SBMLid="v19_v_18" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="v1_v_0" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="v20_v_19" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="v21_v_20" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="v22_v_21" COPASIkey="Reaction_60"/>
    <SBMLMap SBMLid="v23_v_22" COPASIkey="Reaction_61"/>
    <SBMLMap SBMLid="v24_v_23" COPASIkey="Reaction_23"/>
    <SBMLMap SBMLid="v25_v_24" COPASIkey="Reaction_24"/>
    <SBMLMap SBMLid="v26_v_25" COPASIkey="Reaction_25"/>
    <SBMLMap SBMLid="v27_v_26" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="v28_v_27" COPASIkey="Reaction_27"/>
    <SBMLMap SBMLid="v29_v_28" COPASIkey="Reaction_26"/>
    <SBMLMap SBMLid="v2_v_1" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="v30_v_29" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="v31_v_30" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="v32_v_31" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="v33_v_32" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="v34_v_33" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="v35_v_34" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="v36_v_35" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="v37_v_36" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="v38_v_37" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="v39_v_38" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="v3_v_2" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="v40_v_39" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="v41_v_40" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="v4_v_3" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="v5_v_4" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="v6_v_5" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="v7_v_6" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="xi_AC_cAMP_Fsk" COPASIkey="ModelValue_39"/>
    <SBMLMap SBMLid="xi_AC_cAMP_alphaS_GTP" COPASIkey="ModelValue_98"/>
    <SBMLMap SBMLid="xi_KD_Rp8_Br_cAMPS" COPASIkey="ModelValue_40"/>
    <SBMLMap SBMLid="xi_KD_Rp8_pCPT_cAMPS" COPASIkey="ModelValue_41"/>
    <SBMLMap SBMLid="xi_KD_Rp_cAMPS" COPASIkey="ModelValue_42"/>
    <SBMLMap SBMLid="xi_KD_Sp8_Br_cAMPS" COPASIkey="ModelValue_43"/>
    <SBMLMap SBMLid="xi_alphaI_betaI_gammaI__MOR_DAMGO" COPASIkey="ModelValue_92"/>
    <SBMLMap SBMLid="xi_alphaI_betaI_gammaI__MOR_Fentanyl" COPASIkey="ModelValue_93"/>
    <SBMLMap SBMLid="xi_alphaS_betaS_gammaS__fiveHT4_5HT" COPASIkey="ModelValue_90"/>
    <SBMLMap SBMLid="xi_b_Rp8_Br_cAMPS" COPASIkey="ModelValue_44"/>
    <SBMLMap SBMLid="xi_b_Rp8_pCPT_cAMPS" COPASIkey="ModelValue_45"/>
    <SBMLMap SBMLid="xi_b_Rp_cAMPS" COPASIkey="ModelValue_46"/>
    <SBMLMap SBMLid="xi_b_Sp8_Br_cAMPS" COPASIkey="ModelValue_47"/>
    <SBMLMap SBMLid="xi_kf_RII_2__RII_C_2" COPASIkey="ModelValue_48"/>
    <SBMLMap SBMLid="xi_kf_RII_C_2__RII_2" COPASIkey="ModelValue_49"/>
    <SBMLMap SBMLid="xi_rel_open" COPASIkey="ModelValue_74"/>
  </SBMLReference>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_65" name="minute" symbol="min">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_64">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        60*s
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
