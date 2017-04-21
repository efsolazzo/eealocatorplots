********************************************************************************
$ontext

   CAPRI project

   GAMS file : CAPRI_IN_NIR_SETS.GMS

   @purpose  : Translate CAPRI GHG inventory output into the format of the NIR as depicted in allagri.xls.
               CAPRI results are then processed using R to generate a comparison between CAPRI inventories and the NIR.
   @author   :
   @date     : 25.02.16
   @refDoc   :
   @seeAlso  :
   @calledBy :CAPRI_IN_NIR_FORMAT.GMS

$offtext
************************************************************************
*---------------------------------
*          ---Definition of relevant UIDs for mapping between CAPRI and NIR (IDEAG-Ng project)
*---------------------------------
***NOTE: Some UIDs of the NIR-file (eealocator change between submissions). Therefore the following UIDs are no-longer needed
$ontext
EEALocator-file 160202

"EUGIRP20160202-20160204-1615.18-ckYSuC"
EUGIRP20160202-20160204-1615.18-2CGXDu
6D3E0AAF-9851-4110-B390-80302A38DDF4
EUGIRP20160202-20160204-1615.20-WKpyZc
252829AA-3E89-479C-A652-5E458CA59CCB
EUGIRP20160202-20160204-1615.21-y7FbFZ
EUGIRP20160202-20160204-1616.45-Uc26gd
EUGIRP20160202-20160204-1615.21-U2QoL9
C0CBD1EE-FE26-4671-8D3E-EDD08C6E08DF
4215E9E4-001B-43D6-8BEC-8AFE8348115E


March (eealocator_20160322)

"EUGIRP20160322-20160322-1727.40-LX2pSS"       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"21A569EE-2526-49DB-9DA6-27E3A6E94102"         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
"EUGIRP20160322-20160322-1727.43-bShnSp"       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"8997F140-482A-4724-A25C-3F5ED41F3CFD"         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"EUGIRP20160322-20160322-1727.45-uLg5Ry"       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"F56815AC-FE4F-4E37-A7D4-965970F1CF23"         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"EUGIRP20160322-20160322-1727.44-Cc0Z64"       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
"0C84BC70-D3DC-4DEF-A945-D45311B1EF40"         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
"EUGIRP20160322-20160322-1730.09-RSZj1W"       "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
"EUGIRP20160322-20160322-1727.39-qi8AnI"       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"

August (eealocator_20160810)
"3B1A4414-A756-4FC6-9553-0E15F1D76654"  "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
"DD226591-C2F4-4200-90BF-BB0668DAE323"   "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"
"BA59E1AA-8682-40DD-92BD-6055528111C1"   "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
"252829AA-3E89-479C-A652-5E458CA59CCB" "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"    [reverted to UID from Feb]
"3CCE5B8B-8744-4710-898C-E0EC5BEDE9D1"        "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"
"eugirp3A100CattlPOP00000000000no0000"       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
"eugirp3A100CattlEM000000000000CH0000   "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"eugirp3B110CattlEM000000000000CH0000"       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B210CattlEM000000000000no0000"       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlEM000000000000N20000"        "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B210CattlNRA00000000000N20000"        "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
"AB1CC8F6-D71C-46A1-A846-B5E76E2DE3A2"        "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"eugirp3B210CattlNEX00000Liq000no0000"        "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"
"eugirp3B210CattlNEX00000Sol000no0000"       "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"
"eugirp3B210CattlNEX00000Pas000no0000"       "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"
"AC010177-61D1-4033-98AD-D60E29983130"       "NEXC,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"
"4D716761-7CC7-4C90-884A-55659E08CA04"       "NEXC,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"



$offtext

SET variableUID 'IPCC unique identifier in allagri.xls'/
*---------------------------------
*          --- Emissions   (meastype EM)
*---------------------------------

******************************
**In kt CO2eq
"1D3FFBBD-28D5-4AD6-A543-9C6CC01B3F3B"         "EM,Agg GHG,kt CO2eq,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"27B33A5D-17DF-462F-9B69-26DBA0FB200D"         "EM,Agg GHG,kt CO2eq,3,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"FC3813C1-1A50-4129-80B7-8345B0D04B59"         "EM,Agg GHG,kt CO2eq,3,Farming,*,Manure Management, *,*,*,*,*,Emissions   "
"A2043DCA-0841-48AC-AE35-CFC81552469B"         "EM,Agg GHG,kt CO2eq,3,Farming,*,Rice Cultivation, *,*,*,*,*,Emissions    "
"60689367-A22C-458E-974C-1CB7DE307DEA"         "EM,Agg GHG,kt CO2eq,3,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions  "
******************************
**Aggregates
"7E14217F-992A-447B-8BDE-D1DF6983657C"         "EM,CH4,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"6BE90122-C924-441C-A545-4FFD5294C1E5"         "EM,N2O,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"C25717DE-689C-497A-824B-09CD99ECF463"         "EM,CO2,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
******************************
**Enteric fermentation IPCC 3.A
"56F82A08-818C-4251-8499-D28803E0FBB9"         "EM,CH4,kt,3.A,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.18-ckYSuC"       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.40-LX2pSS"       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"eugirp3A100CattlEM000000000000CH0000"   "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"

"C1B82D3E-5D07-483B-8A6E-7E2DA2A127DE"         "EM,CH4,kt,3.A.1,Dairy Cattle,Enteric Fermentation"
"2F742951-9B92-45C3-99F2-65547EDC4271"         "EM,CH4,kt,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"B34B3E53-0112-41A0-AD31-8EF5180B0BD5"         "EM,CH4,kt,3.A.2,Sheep,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"6D3E0AAF-9851-4110-B390-80302A38DDF4"         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"21A569EE-2526-49DB-9DA6-27E3A6E94102"         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
"BA59E1AA-8682-40DD-92BD-6055528111C1"   "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"

"BF075830-C9C1-4BE0-BF10-9ECCB74F6B97"         "EM,CH4,kt,3.A.4,OtherLivestock,*,Enteric Fermentation,*,*,*,*,*, Emissions"
******************************
**Manure management  IPCC 3.B
*** CH4
"F83FCBD3-1CE1-406D-B545-92DACC58BA13"         "EM,CH4,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"D6B972B8-8A43-4118-8F2D-220ED7F1D3A0"         "EM,CH4,kt,3.B.1,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.20-WKpyZc"       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.43-bShnSp"       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
 "eugirp3B110CattlEM000000000000CH0000"       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"5F44FD41-114C-49B4-B9AB-C89A5A0E417B"   "EM,CH4,kt,3.B.1.1,Dairy Cattle,Manure Management"
"5817C8C5-0D22-4A71-B460-B289621EA924"   "EM,CH4,kt,3.B.1.1,Non-Dairy Cattle,Manure Management"

"08CEBAE2-D4C5-4C7E-8315-F78C314676AF"         "EM,CH4,kt,3.B.1.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
*"252829AA-3E89-479C-A652-5E458CA59CCB"         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"8997F140-482A-4724-A25C-3F5ED41F3CFD"         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"252829AA-3E89-479C-A652-5E458CA59CCB" "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"

"83756D4C-3AD6-4274-9688-D13915A1B0CA"         "EM,CH4,kt,3.B.1.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"
*** N2O
"8764881E-1EE0-4224-9B92-A156AA8C0951"         "EM,N2O,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"94E5A98A-6DC9-41BA-A75B-0C9414CE8592"         "EM,N2O,kt,3.B.2,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.21-y7FbFZ"       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.45-uLg5Ry"       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B210CattlEM000000000000N20000"        "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"BB47CC01-777F-4394-AD0A-1C6E99EFC8CA"   "EM,N2O,kt,3.B.2.1,Dairy Cattle,Manure Management"
"AFD31612-BE01-4F42-842E-EC2A74F4C995"   "EM,N2O,kt,3.B.2.1,Non-Dairy Cattle,Manure Management"

"AD5A71B5-6761-4D06-BAA0-E6CA8AADB947"         "EM,N2O,kt,3.B.2.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
*"4215E9E4-001B-43D6-8BEC-8AFE8348115E"         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"F56815AC-FE4F-4E37-A7D4-965970F1CF23"         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"AB1CC8F6-D71C-46A1-A846-B5E76E2DE3A2"        "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"

"C138B1DF-321C-4556-8274-A1D78427BC3C"         "EM,N2O,kt,3.B.2.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"

"8332828A-BBF4-4C8B-B6FD-AE2553118257"         "EM,N2O,kt,3.B.2.5,Indirect Emissions,*,Manure Management,*,*,*,*,*, Emissions"
******************************
**Rice cultivation  IPCC 3.C
"5098CB0E-B1C0-46AC-819A-A418AD072686"          "EM,CH4,kt,3.C,Farming,*,Rice, *,*,*,*,*,Emissions"
"2C014B8D-1F97-4DF6-8122-5E150E072DB4"          "EM,CH4,kt,3.C.1,Farming,*,Rice, *,*,*,*,*,Emissions"

******************************
**Agricultural Soils  IPCC 3.D
"57E1FDDC-2BC9-4D33-8FC6-E92722CB4F58"          " EM,N2O,kt,3.D,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions                  "
"95E9B3AE-0FAE-4F85-A1DA-D6282420DC21"          " EM,N2O,kt,3.D.1,Direct Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions      "
"09593187-3F6D-461C-BF0A-F6DA94340987"          " EM,N2O,kt,3.D.1.1,Inorganic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E32D13FB-140A-4AB2-8210-95AA4F85FF66"          " EM,N2O,kt,3.D.1.2,Organic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"2BBA4ED8-BAF6-4B64-93BA-016E5B20C82A"          " EM,N2O,kt,3.D.1.2.a,Applied Manure,*,Agricultural Soils, *,*,*,*,*,Emissions"

"55CE4641-7669-45FE-B6F0-16CE93B62C7E"          " EM,N2O,kt,3.D.1.3,Grazing,*,Agricultural Soils, *,*,*,*,*,Emissions       "
"DC2A3455-2E57-4172-9A71-7C1710FFCD03"          " EM,N2O,kt,3.D.1.4,Crop Residues,*,Agricultural Soils, *,*,*,*,*,Emissions"

"3745CA8B-C2BC-49A4-9AF6-2249B6589BD9"         " EM,N2O,kt,3.D.1.6,Histosols,*,Agricultural Soils, *,*,*,*,*,Emissions"

"9CD26AF3-D663-4F65-AA05-31685EF77698"         " EM,N2O,kt,3.D.2,Indirect Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E93B25A2-2A1D-4F56-9DEE-06C4B6DA5DC4"         " EM,N2O,kt,3.D.2.1,Deposition,*,Agricultural Soils, *,*,*,*,*,Emissions"
"3E515E28-BEC2-44ED-B7BF-0F35D060590D"         " EM,N2O,kt,3.D.2.2,Leaching,*,Agricultural Soils, *,*,*,*,*,Emissions"

******************************
**Liming IPCC 3.G
"1A58E7E3-7119-4E78-8225-427C70B50AE9"         "EM,CO2,kt,3.G,Farming,*,Liming, *,*,*,*,*,Emissions"

**Urea Application 3.H
"9BAA5620-F155-4FEB-ACC8-45D3C994137D"         "EM,CO2,kt,3.H,Farming,*,Urea Application, *,*,*,*,*,Emissions"

*----------------------------------------
* N excretion by animals
*----------------------------------------
*****Total N excreted
**Manure Management
*"EUGIRP20160202-20160204-1615.21-U2QoL9"       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
*"EUGIRP20160322-20160322-1727.44-Cc0Z64"       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlEM000000000000no0000"       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"

"43430FA4-F810-440C-B162-653A5E397DB1"   "EM,no gas,kt N/year,3.B.2.1,Dairy Cattle,Manure Management"
"D111BD96-9E34-4EE7-B191-10FB3E1B5858"   "EM,no gas,kt N/year,3.B.2.1,Non-Dairy Cattle,Manure Management"

"068CD34B-9068-4502-8D91-1711C6DA94D7"         "EM,no gas,kt N/year,3.B.2.2,Sheep,*,Manure Management"
*"C0CBD1EE-FE26-4671-8D3E-EDD08C6E08DF"         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
*"0C84BC70-D3DC-4DEF-A945-D45311B1EF40"         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
"3B1A4414-A756-4FC6-9553-0E15F1D76654"  "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"

"3B779BAE-5380-4707-AB54-183A8F9DCAB1"         "EM,no gas,kt N/year,3.B.2.4,Other,*,Manure Management"

******N excreted per management system
*Cattle
*"EUGIRP20160322-20160322-1727.45-1vE9EZ"  "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"
*"EUGIRP20160322-20160322-1727.45-CQkLOt"  "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"
*"EUGIRP20160322-20160322-1727.45-vrk1jx"  "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"

"eugirp3B210CattlNEX00000Liq000no0000"        "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"
"eugirp3B210CattlNEX00000Sol000no0000"       "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"
"eugirp3B210CattlNEX00000Pas000no0000"       "NEXC,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"

*Dairy cattle
"EE5F1943-C0C3-438B-81C1-E87D32E57736"   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Liquid,Manure Management"

"D6897BEB-9D08-4520-A966-A59899C07834"   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Solid,Manure Management"

"3CFC3C5B-4E75-43D0-923A-144022CFE313"   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Pasture,Manure Management"

*Non-dairy cattle

"55CB462A-56EC-4DEE-AC04-0FDD30DE796F"       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Liquid,Manure Management"

"31E7BC5E-8FE1-476E-977E-DF1424493295"       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Solid,Manure Management"

"B7BD3158-E56C-4CFB-9B9A-257EC73988FF"       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Pasture,Manure Management"


*Sheep

"6CB83B55-0ADF-446B-914F-5A5C2DB16B23"  "NEXC,no gas,kt N/year,3.B.2.2,Sheep,Liquid,Manure Management"
"3564BF98-D065-4347-8ADB-B692E3B528E2"  "NEXC,no gas,kt N/year,3.B.2.2,Sheep,Solid,Manure Management"
"27F7C980-43A5-45D1-B8B8-2BEBE2090CB6"  "NEXC,no gas,kt N/year,3.B.2.2,Sheep,Pasture,Manure Management"


*Swine
"FB46F3E0-3436-4338-BEFA-3E5FD8E07B10" "NEXC,no gas,kt N/year,3.B.2.3,Swine,Liquid,Manure Management"
*"3FB4B8CB-B0A8-4BA1-8D81-CD412F301D1B"  "NEXC,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"
"AC010177-61D1-4033-98AD-D60E29983130"       "NEXC,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"

*"3FB36E10-9143-4C0C-968B-A2479C3EE2DB" "NEXC,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"
"4D716761-7CC7-4C90-884A-55659E08CA04"       "NEXC,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"

******  N excretion rate (meastype NRATE)

*"EUGIRP20160202-20160204-1616.45-Uc26gd"       "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
*"EUGIRP20160322-20160322-1730.09-RSZj1W"       "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlNRA00000000000N20000"        "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"

"98555F37-0F50-48DF-8BCA-DD57EB7E160C"         "NRATE,no gas,kg N/head/year,3.B.2.2,Sheep,*,Manure Management"
"9C754B49-4CB9-4A48-905C-0816529DC9B2"         "NRATE,no gas,kg N/head/year,3.B.2.3,Swine,*,Manure Management"

*----------------------------------------
* N input to soils (kt N/year)
*----------------------------------------
"81698429-9A0A-4581-A5FD-E2E51136F494"    "AD,no gas,kt N/year,3.D.1.1,Inorganic Fertilizer,*,Agricultural Soils"

"55762DBD-C95D-4CDC-BF06-BFC614E5948D"    "AD,no gas,kt N/year,3.D.1.2,Organic Fertilizer,*,Agricultural Soils"
"11A3B4C7-8D11-499F-831B-F86155A901FD"    "AD,no gas,kt N/year,3.D.1.2,Organic Fertilizer,Manure,Agricultural Soils"

"91D64DBE-F344-426A-9097-9DEFFD731DF0"    "AD,no gas,kt N/year,3.D.1.4,Crop Residues,*,Agricultural Soils"

"200C50F9-B172-40BC-A8EB-7110EBA69E10"    "AREA,no gas,ha/year,3.D.1.6,Histosols,*,Agricultural Soils"

"FD253921-C432-4B94-9D0A-2B1BEBAAAFC2"    "AD,no gas,kt N/year,3.D.2.1,Atmosph. Deposition,*,Agricultural Soils"

"47A679D1-E78C-45F4-89D3-9775B22E92E3"    "AD,no gas,kt N/year,3.D.2.2,Leaching and Run-off,*,Agricultural Soils"


*---------------------------------
*          ---   Population (meastype POP)
*---------------------------------
**Enteric Fermentation
*"EUGIRP20160202-20160204-1615.18-2CGXDu"       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
*"EUGIRP20160322-20160322-1727.39-qi8AnI"       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
"eugirp3A100CattlPOP00000000000no0000"       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"

"A5D9804F-99F0-49A8-9E3C-5422EF839F39"    "POP,no gas,1000s,3.A.1,Dairy Cattle,Enteric Fermentation"
"F578FB5F-544E-4FDD-A670-FC7E435435C2"   "POP,no gas,1000s,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"3F9C4313-F734-425C-AB3C-FE4BDE146086"         "POP,no gas,1000s,3.A.2,Sheep,*,Enteric Fermentation"
"91817067-8DB6-41D6-A348-57E2C17B655D"         "POP,no gas,1000s,3.A.3,Swine,*,Enteric Fermentation"
"69C10658-1D80-49A9-82D6-64802AD7729F"         "POP,no gas,1000s,3.A.4,Other,*,Enteric Fermentation"
**Manure Management
"10F410FB-6F10-4B09-8572-9772A2DCC6A9"         "POP,no gas,1000s,3.B.1.2,Sheep,*,Manure Management"
*"BC5A63BA-2DF1-45B8-9B58-3E3AD8C6EE61"         "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"
"3CCE5B8B-8744-4710-898C-E0EC5BEDE9D1"        "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"

"62C716E7-E2EB-4F1D-BA1E-D7788D9A4547"         "POP,no gas,1000s,3.B.1.4,Other,*,Manure Management"

"C329A125-EA9A-4B2C-A2B8-784B18D1BF55"         "POP,no gas,1000s,3.B.2.2,Sheep,*,Manure Management"
*"1E78E006-F4A6-4410-AB92-3095B414C09D"         "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"
"DD226591-C2F4-4200-90BF-BB0668DAE323"   "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"

"03CBE8C9-84C7-4FC5-92E9-BA6832032CB2"         "POP,no gas,1000s,3.B.2.4,Other,*,Manure Management"


/;

*---------------------------------
*          ---Mapping of relevant UIDs for mapping between CAPRI and NIR (IDEAG-Ng project)
*---------------------------------

SET UID_TO_GHG(variableUID,GHGS)/
*---------------------------------
*          --- Emissions   (meastype EM)
*---------------------------------
**In kt CO2eq
"1D3FFBBD-28D5-4AD6-A543-9C6CC01B3F3B".(CH4ENT,CH4MAN,CH4RIC,CO2LIME,CO2UREA,N2OAPP,N2OGRA,N2OSYN,N2OHIS,N2OCRO,N2OLEA,N2OindMM, N2OindAS,N2OMAN)   "EM,Agg GHG,kt CO2eq,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"27B33A5D-17DF-462F-9B69-26DBA0FB200D".(CH4ENT)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"FC3813C1-1A50-4129-80B7-8345B0D04B59".(CH4MAN,N2OMAN)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Manure Management, *,*,*,*,*,Emissions   "
"A2043DCA-0841-48AC-AE35-CFC81552469B".(CH4RIC)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Rice Cultivation, *,*,*,*,*,Emissions    "
"60689367-A22C-458E-974C-1CB7DE307DEA".(N2OSYN,N2OAPP,N2OGRA,N2OCRO,N2OHIS,N2OindAS,N2OLEA)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions  "
******************************

**Aggregates
"7E14217F-992A-447B-8BDE-D1DF6983657C".(CH4ENT,CH4MAN,CH4RIC)         "EM,CH4,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"6BE90122-C924-441C-A545-4FFD5294C1E5".(N2OMAN,N2OSYN,N2OAPP,N2OGRA,N2OCRO,N2OHIS,N2OindMM,N2OindAS,N2OLEA)       "EM,N2O,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"C25717DE-689C-497A-824B-09CD99ECF463".(CO2LIME,CO2UREA)               "EM,CO2,kt,3G and 3H,Farming,*,Agriculture, *,*,*,*,*,Emissions"

******************************
**Enteric fermentation
"56F82A08-818C-4251-8499-D28803E0FBB9".(CH4ENT)         "EM,CH4,kt,3.A,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.18-ckYSuC".(CH4ENT)       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.40-LX2pSS".(CH4ENT)       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"eugirp3A100CattlEM000000000000CH0000".(CH4ENT)       "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"C1B82D3E-5D07-483B-8A6E-7E2DA2A127DE".(CH4ENT)         "EM,CH4,kt,3.A.1,Dairy Cattle,Enteric Fermentation"
"2F742951-9B92-45C3-99F2-65547EDC4271".(CH4ENT)         "EM,CH4,kt,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"B34B3E53-0112-41A0-AD31-8EF5180B0BD5".(CH4ENT)         "EM,CH4,kt,3.A.2,Sheep,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"6D3E0AAF-9851-4110-B390-80302A38DDF4".(CH4ENT)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"21A569EE-2526-49DB-9DA6-27E3A6E94102".(CH4ENT)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
"BA59E1AA-8682-40DD-92BD-6055528111C1".(CH4ENT)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"

"BF075830-C9C1-4BE0-BF10-9ECCB74F6B97".(CH4ENT)         "EM,CH4,kt,3.A.4,OtherLivestock,*,Enteric Fermentation,*,*,*,*,*, Emissions"

******************************
**Manure management
"F83FCBD3-1CE1-406D-B545-92DACC58BA13".(CH4MAN)         "EM,CH4,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"D6B972B8-8A43-4118-8F2D-220ED7F1D3A0".(CH4MAN)         "EM,CH4,kt,3.B.1,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.20-WKpyZc".(CH4MAN)       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.43-bShnSp".(CH4MAN)       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B110CattlEM000000000000CH0000".(CH4MAN)       "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"5F44FD41-114C-49B4-B9AB-C89A5A0E417B".(CH4MAN)   "EM,CH4,kt,3.B.1.1,Dairy Cattle,Manure Management"
"5817C8C5-0D22-4A71-B460-B289621EA924".(CH4MAN)   "EM,CH4,kt,3.B.1.1,Non-Dairy Cattle,Manure Management"


"08CEBAE2-D4C5-4C7E-8315-F78C314676AF".(CH4MAN)         "EM,CH4,kt,3.B.1.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
"252829AA-3E89-479C-A652-5E458CA59CCB".(CH4MAN)         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"8997F140-482A-4724-A25C-3F5ED41F3CFD".(CH4MAN)         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"83756D4C-3AD6-4274-9688-D13915A1B0CA".(CH4MAN)         "EM,CH4,kt,3.B.1.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"

"8764881E-1EE0-4224-9B92-A156AA8C0951".(N2OMAN)         "EM,N2O,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"94E5A98A-6DC9-41BA-A75B-0C9414CE8592".(N2OMAN)         "EM,N2O,kt,3.B.2,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.21-y7FbFZ".(N2OMAN)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.45-uLg5Ry".(N2OMAN)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B210CattlEM000000000000N20000".(N2OMAN)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"BB47CC01-777F-4394-AD0A-1C6E99EFC8CA".(N2OMAN)   "EM,N2O,kt,3.B.2.1,Dairy Cattle,Manure Management"
"AFD31612-BE01-4F42-842E-EC2A74F4C995".(N2OMAN)   "EM,N2O,kt,3.B.2.1,Non-Dairy Cattle,Manure Management"


"AD5A71B5-6761-4D06-BAA0-E6CA8AADB947".(N2OMAN)         "EM,N2O,kt,3.B.2.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
*"4215E9E4-001B-43D6-8BEC-8AFE8348115E".(N2OMAN)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"F56815AC-FE4F-4E37-A7D4-965970F1CF23".(N2OMAN)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"AB1CC8F6-D71C-46A1-A846-B5E76E2DE3A2".(N2OMAN)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"

"C138B1DF-321C-4556-8274-A1D78427BC3C".(N2OMAN)         "EM,N2O,kt,3.B.2.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"

"8332828A-BBF4-4C8B-B6FD-AE2553118257".(N2OindMM)        "EM,N2O,kt,3.B.2.5,Indirect Emissions,*,Manure Management,*,*,*,*,*, Emissions"
******************************
**Rice cultivation
"5098CB0E-B1C0-46AC-819A-A418AD072686".(CH4RIC)          "EM,CH4,kt,3.C,Farming,*,Rice, *,*,*,*,*,Emissions"
"2C014B8D-1F97-4DF6-8122-5E150E072DB4".(CH4RIC)          "EM,CH4,kt,3.C.1,Farming,*,Rice, *,*,*,*,*,Emissions"

******************************
**Agricultural Soils
"57E1FDDC-2BC9-4D33-8FC6-E92722CB4F58".(N2OSYN,N2OAPP,N2OGRA,N2OCRO,N2OHIS,N2OindAS,N2OLEA)          " EM,N2O,kt,3.D,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions                  "
"95E9B3AE-0FAE-4F85-A1DA-D6282420DC21".(N2OSYN,N2OAPP,N2OGRA,N2OCRO,N2OHIS)          " EM,N2O,kt,3.D.1,Direct Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions      "
"09593187-3F6D-461C-BF0A-F6DA94340987".(N2OSYN)          " EM,N2O,kt,3.D.1.1,Inorganic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E32D13FB-140A-4AB2-8210-95AA4F85FF66".(N2OAPP)          " EM,N2O,kt,3.D.1.2,Organic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"2BBA4ED8-BAF6-4B64-93BA-016E5B20C82A".(N2OAPP)          " EM,N2O,kt,3.D.1.2.a,Applied Manure,*,Agricultural Soils, *,*,*,*,*,Emissions"

"55CE4641-7669-45FE-B6F0-16CE93B62C7E".(N2OGRA)          " EM,N2O,kt,3.D.1.3,Grazing,*,Agricultural Soils, *,*,*,*,*,Emissions       "
"DC2A3455-2E57-4172-9A71-7C1710FFCD03".(N2OCRO)          " EM,N2O,kt,3.D.1.4,Crop Residues,*,Agricultural Soils, *,*,*,*,*,Emissions"

"3745CA8B-C2BC-49A4-9AF6-2249B6589BD9".(N2OHIS)         " EM,N2O,kt,3.D.1.6,Histosols,*,Agricultural Soils, *,*,*,*,*,Emissions"

"9CD26AF3-D663-4F65-AA05-31685EF77698".(N2OindAS,N2OLEA)         " EM,N2O,kt,3.D.2,Indirect Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E93B25A2-2A1D-4F56-9DEE-06C4B6DA5DC4".(N2OindAS)         " EM,N2O,kt,3.D.2.1,Deposition,*,Agricultural Soils, *,*,*,*,*,Emissions"
"3E515E28-BEC2-44ED-B7BF-0F35D060590D".(N2OLEA)         " EM,N2O,kt,3.D.2.2,Leaching,*,Agricultural Soils, *,*,*,*,*,Emissions"

******************************
**Liming IPCC 3.G
"1A58E7E3-7119-4E78-8225-427C70B50AE9".(CO2LIME)         "EM,CO2,kt,3.G,Farming,*,Liming, *,*,*,*,*,Emissions"

**Urea Application 3.H
"9BAA5620-F155-4FEB-ACC8-45D3C994137D".(CO2UREA)         "EM,CO2,kt,3.H,Farming,*,Urea Application, *,*,*,*,*,Emissions"


/;



SET UID_TO_MPACT(variableUID,MPACT)/
*---------------------------------
*          --- Emissions   (meastype EM)
*---------------------------------
**Aggregates
"7E14217F-992A-447B-8BDE-D1DF6983657C".(SET.MPACT)                   "EM,CH4,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"6BE90122-C924-441C-A545-4FFD5294C1E5".(SET.MPACT)                   "EM,N2O,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"

******************************
**Enteric fermentation
"56F82A08-818C-4251-8499-D28803E0FBB9".(SET.MPACT)         "EM,CH4,kt,3.A,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.18-ckYSuC".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)      "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.40-LX2pSS".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)      "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"eugirp3A100CattlEM000000000000CH0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)      "EM,CH4,kt,3.A.1,Cattle,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"C1B82D3E-5D07-483B-8A6E-7E2DA2A127DE".(DCOL,DCOH)         "EM,CH4,kt,3.A.1,Dairy Cattle,Enteric Fermentation"
"2F742951-9B92-45C3-99F2-65547EDC4271".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)         "EM,CH4,kt,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"B34B3E53-0112-41A0-AD31-8EF5180B0BD5".(SHGM,SHGF)         "EM,CH4,kt,3.A.2,Sheep,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"6D3E0AAF-9851-4110-B390-80302A38DDF4".(PIGF,SOWS)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
*"21A569EE-2526-49DB-9DA6-27E3A6E94102".(PIGF,SOWS)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"
"BA59E1AA-8682-40DD-92BD-6055528111C1".(PIGF,SOWS)         "EM,CH4,kt,3.A.3,Swine,*,Enteric Fermentation,*,*,*,*,*, Emissions"

"BF075830-C9C1-4BE0-BF10-9ECCB74F6B97".(HENS,POUF,OANI)         "EM,CH4,kt,3.A.4,OtherLivestock,*,Enteric Fermentation,*,*,*,*,*, Emissions"

******************************
**Manure management
"F83FCBD3-1CE1-406D-B545-92DACC58BA13".(SET.MPACT)          "EM,CH4,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"D6B972B8-8A43-4118-8F2D-220ED7F1D3A0".(SET.MPACT)        "EM,CH4,kt,3.B.1,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.20-WKpyZc".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.43-bShnSp".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B110CattlEM000000000000CH0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,CH4,kt,3.B.1.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"5F44FD41-114C-49B4-B9AB-C89A5A0E417B".(DCOL,DCOH)    "EM,CH4,kt,3.B.1.1,Dairy Cattle,Manure Management"
"5817C8C5-0D22-4A71-B460-B289621EA924".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,CH4,kt,3.B.1.1,Non-Dairy Cattle,Manure Management"


"08CEBAE2-D4C5-4C7E-8315-F78C314676AF".(SHGM,SHGF)        "EM,CH4,kt,3.B.1.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
"252829AA-3E89-479C-A652-5E458CA59CCB".(PIGF,SOWS)         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"8997F140-482A-4724-A25C-3F5ED41F3CFD".(PIGF,SOWS)         "EM,CH4,kt,3.B.1.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"83756D4C-3AD6-4274-9688-D13915A1B0CA".(HENS,POUF,OANI)         "EM,CH4,kt,3.B.1.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"

"8764881E-1EE0-4224-9B92-A156AA8C0951".(SET.MPACT)          "EM,N2O,kt,3.B,Farming,*,Manure Management, *,*,*,*,*,Emissions"
"94E5A98A-6DC9-41BA-A75B-0C9414CE8592".(SET.MPACT)          "EM,N2O,kt,3.B.2,Farming,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160202-20160204-1615.21-y7FbFZ".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
*"EUGIRP20160322-20160322-1727.45-uLg5Ry".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"
"eugirp3B210CattlEM000000000000N20000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "EM,N2O,kt,3.B.2.1,Cattle,*,Manure Management, *,*,*,*,*,Emissions"

"BB47CC01-777F-4394-AD0A-1C6E99EFC8CA".(DCOL,DCOH)    "EM,N2O,kt,3.B.2.1,Dairy Cattle,Manure Management"
"AFD31612-BE01-4F42-842E-EC2A74F4C995".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,N2O,kt,3.B.2.1,Non-Dairy Cattle,Manure Management"


"AD5A71B5-6761-4D06-BAA0-E6CA8AADB947".(SHGM,SHGF)         "EM,N2O,kt,3.B.2.2,Sheep,*,Manure Management,*,*,*,*,*, Emissions"
*"4215E9E4-001B-43D6-8BEC-8AFE8348115E".(PIGF,SOWS)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
*"F56815AC-FE4F-4E37-A7D4-965970F1CF23".(PIGF,SOWS)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"
"AB1CC8F6-D71C-46A1-A846-B5E76E2DE3A2".(PIGF,SOWS)         "EM,N2O,kt,3.B.2.3,Swine,*,Manure Management,*,*,*,*,*, Emissions"

"C138B1DF-321C-4556-8274-A1D78427BC3C".(HENS,POUF,OANI)         "EM,N2O,kt,3.B.2.4,OtherLivestock,*,Manure Management,*,*,*,*,*, Emissions"

"8332828A-BBF4-4C8B-B6FD-AE2553118257".(SET.MPACT)             "EM,N2O,kt,3.B.2.5,Indirect Emissions,*,Manure Management,*,*,*,*,*, Emissions"
******************************
**Rice cultivation
"5098CB0E-B1C0-46AC-819A-A418AD072686".(PARI)          "EM,CH4,kt,3.C,Farming,*,Rice, *,*,*,*,*,Emissions"
"2C014B8D-1F97-4DF6-8122-5E150E072DB4".(PARI)          "EM,CH4,kt,3.C.1,Farming,*,Rice, *,*,*,*,*,Emissions"

******************************
**Agricultural Soils
"57E1FDDC-2BC9-4D33-8FC6-E92722CB4F58".(SET.MPACT)          " EM,N2O,kt,3.D,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions                  "
"95E9B3AE-0FAE-4F85-A1DA-D6282420DC21".(SET.MPACT)          " EM,N2O,kt,3.D.1,Direct Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions      "
"09593187-3F6D-461C-BF0A-F6DA94340987".(SET.MPACT)          " EM,N2O,kt,3.D.1.1,Inorganic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E32D13FB-140A-4AB2-8210-95AA4F85FF66".(SET.MPACT)          " EM,N2O,kt,3.D.1.2,Organic Fertilizer,*,Agricultural Soils, *,*,*,*,*,Emissions"
"2BBA4ED8-BAF6-4B64-93BA-016E5B20C82A".(SET.MPACT)          " EM,N2O,kt,3.D.1.2.a,Applied Manure,*,Agricultural Soils, *,*,*,*,*,Emissions"

"55CE4641-7669-45FE-B6F0-16CE93B62C7E".(SET.MPACT)          " EM,N2O,kt,3.D.1.3,Grazing,*,Agricultural Soils, *,*,*,*,*,Emissions       "
"DC2A3455-2E57-4172-9A71-7C1710FFCD03".(SET.MPACT)          " EM,N2O,kt,3.D.1.4,Crop Residues,*,Agricultural Soils, *,*,*,*,*,Emissions"

"3745CA8B-C2BC-49A4-9AF6-2249B6589BD9".(SET.MPACT)         " EM,N2O,kt,3.D.1.6,Histosols,*,Agricultural Soils, *,*,*,*,*,Emissions"

"9CD26AF3-D663-4F65-AA05-31685EF77698".(SET.MPACT)         " EM,N2O,kt,3.D.2,Indirect Emissions,*,Agricultural Soils, *,*,*,*,*,Emissions"
"E93B25A2-2A1D-4F56-9DEE-06C4B6DA5DC4".(SET.MPACT)         " EM,N2O,kt,3.D.2.1,Deposition,*,Agricultural Soils, *,*,*,*,*,Emissions"
"3E515E28-BEC2-44ED-B7BF-0F35D060590D".(SET.MPACT)         " EM,N2O,kt,3.D.2.2,Leaching,*,Agricultural Soils, *,*,*,*,*,Emissions"

*----------------------------------------
* N excretion by animals
*----------------------------------------
*****Total N excreted
**Manure Management
*"EUGIRP20160202-20160204-1615.21-U2QoL9".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
*"EUGIRP20160322-20160322-1727.44-Cc0Z64".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlEM000000000000no0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"

"43430FA4-F810-440C-B162-653A5E397DB1".(DCOL,DCOH)    "EM,no gas,kt N/year,3.B.2.1,Dairy Cattle,Manure Management"
"D111BD96-9E34-4EE7-B191-10FB3E1B5858".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)    "EM,no gas,kt N/year,3.B.2.1,Non-Dairy Cattle,Manure Management"


"068CD34B-9068-4502-8D91-1711C6DA94D7".(SHGM,SHGF)         "EM,no gas,kt N/year,3.B.2.2,Sheep,*,Manure Management"
*"C0CBD1EE-FE26-4671-8D3E-EDD08C6E08DF".(PIGF,SOWS)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
*"0C84BC70-D3DC-4DEF-A945-D45311B1EF40".(PIGF,SOWS)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
"3B1A4414-A756-4FC6-9553-0E15F1D76654".(PIGF,SOWS)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"

"3B779BAE-5380-4707-AB54-183A8F9DCAB1".(HENS,POUF,OANI)          "EM,no gas,kt N/year,3.B.2.4,Other,*,Manure Management"

******N excreted per management system
*Cattle
*"EUGIRP20160322-20160322-1727.45-1vE9EZ".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"
"eugirp3B210CattlNEX00000Liq000no0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"

*"EUGIRP20160322-20160322-1727.45-CQkLOt".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"
"eugirp3B210CattlNEX00000Sol000no0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"

*"EUGIRP20160322-20160322-1727.45-vrk1jx".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"
"eugirp3B210CattlNEX00000Pas000no0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"

*Dairy cattle
"EE5F1943-C0C3-438B-81C1-E87D32E57736".(DCOL,DCOH)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Liquid,Manure Management"

"D6897BEB-9D08-4520-A966-A59899C07834".(DCOL,DCOH)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Solid,Manure Management"

"3CFC3C5B-4E75-43D0-923A-144022CFE313".(DCOL,DCOH)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Pasture,Manure Management"

*Non-dairy cattle

"55CB462A-56EC-4DEE-AC04-0FDD30DE796F".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Liquid,Manure Management"

"31E7BC5E-8FE1-476E-977E-DF1424493295".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Solid,Manure Management"

"B7BD3158-E56C-4CFB-9B9A-257EC73988FF".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Pasture,Manure Management"
*Sheep

"6CB83B55-0ADF-446B-914F-5A5C2DB16B23".(SHGM,SHGF)   "EM,no gas,kt N/year,3.B.2.2,Sheep,Liquid,Manure Management"
"3564BF98-D065-4347-8ADB-B692E3B528E2".(SHGM,SHGF)   "EM,no gas,kt N/year,3.B.2.2,Sheep,Solid,Manure Management"
"27F7C980-43A5-45D1-B8B8-2BEBE2090CB6".(SHGM,SHGF)   "EM,no gas,kt N/year,3.B.2.2,Sheep,Pasture,Manure Management"


*Swine
"FB46F3E0-3436-4338-BEFA-3E5FD8E07B10".(PIGF,SOWS) "EM,no gas,kt N/year,3.B.2.3,Swine,Liquid,Manure Management"
*"3FB4B8CB-B0A8-4BA1-8D81-CD412F301D1B".(PIGF,SOWS)  "EM,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"
"AC010177-61D1-4033-98AD-D60E29983130".(PIGF,SOWS)  "EM,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"

*"3FB36E10-9143-4C0C-968B-A2479C3EE2DB".(PIGF,SOWS) "EM,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"
"4D716761-7CC7-4C90-884A-55659E08CA04".(PIGF,SOWS) "EM,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"

*****  N excretion rate (meastype NRATE)

*"EUGIRP20160202-20160204-1616.45-Uc26gd".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
*"EUGIRP20160322-20160322-1730.09-RSZj1W".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlNRA00000000000N20000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)        "NRATE,no gas,kg N/head/year,3.B.2.1,Cattle,*,Manure Management"

"98555F37-0F50-48DF-8BCA-DD57EB7E160C".(SHGM,SHGF)         "NRATE,no gas,kg N/head/year,3.B.2.2,Sheep,*,Manure Management"
"9C754B49-4CB9-4A48-905C-0816529DC9B2".(PIGF,SOWS)         "NRATE,no gas,kg N/head/year,3.B.2.3,Swine,*,Manure Management"

*---------------------------------
*          ---   Population (meastype POP)
*---------------------------------
**Enteric Fermentation
*"EUGIRP20160202-20160204-1615.18-2CGXDu".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
*"EUGIRP20160322-20160322-1727.39-qi8AnI".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
"eugirp3A100CattlPOP00000000000no0000".(DCOL,DCOH,BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"

"A5D9804F-99F0-49A8-9E3C-5422EF839F39".(DCOL,DCOH)     "POP,no gas,1000s,3.A.1,Dairy Cattle,Enteric Fermentation"
"F578FB5F-544E-4FDD-A670-FC7E435435C2".(BULL,BULH,HEIL,HEIH,SCOW,HEIR,CAMF,CAFF,CAMR,CAFR)    "POP,no gas,1000s,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"3F9C4313-F734-425C-AB3C-FE4BDE146086".(SHGM,SHGF)         "POP,no gas,1000s,3.A.2,Sheep,*,Enteric Fermentation"
"91817067-8DB6-41D6-A348-57E2C17B655D".(PIGF,SOWS)         "POP,no gas,1000s,3.A.3,Swine,*,Enteric Fermentation"
"69C10658-1D80-49A9-82D6-64802AD7729F".(HENS,POUF,OANI)          "POP,no gas,1000s,3.A.4,Other,*,Enteric Fermentation"
**Manure Management
"10F410FB-6F10-4B09-8572-9772A2DCC6A9".(SHGM,SHGF)         "POP,no gas,1000s,3.B.1.2,Sheep,*,Manure Management"
*"BC5A63BA-2DF1-45B8-9B58-3E3AD8C6EE61".(PIGF,SOWS)         "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"
"3CCE5B8B-8744-4710-898C-E0EC5BEDE9D1".(PIGF,SOWS)         "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"

"62C716E7-E2EB-4F1D-BA1E-D7788D9A4547".(HENS,POUF,OANI)         "POP,no gas,1000s,3.B.1.4,Other,*,Manure Management"

"C329A125-EA9A-4B2C-A2B8-784B18D1BF55".(SHGM,SHGF)         "POP,no gas,1000s,3.B.2.2,Sheep,*,Manure Management"
*"1E78E006-F4A6-4410-AB92-3095B414C09D".(PIGF,SOWS)         "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"
"DD226591-C2F4-4200-90BF-BB0668DAE323".(PIGF,SOWS)         "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"

"03CBE8C9-84C7-4FC5-92E9-BA6832032CB2".(HENS,POUF,OANI)         "POP,no gas,1000s,3.B.2.4,Other,*,Manure Management"

*----------------------------------------
* N input to soils (kt N/year)
*----------------------------------------
"81698429-9A0A-4581-A5FD-E2E51136F494".(SWHE,DWHE,RYEM,BARL,OATS,MAIZ,OCER,RAPE,SUNF,SOYA,OOIL,OIND,NURS,FLOW,OCRO,NECR,MAIF,ROOF,OFAR,GRAE,GRAI,PARI,OLIV,PULS,POTA,SUGB,TEXT,TOBA,TOMA,OVEG,APPL,OFRU,CITR,TAGR,TABO,TWIN,FALL,ISET,GSET,TSET,VSET)    "AD,no gas,kt N/year,3.D.1.1,Inorganic Fertilizer,*,Agricultural Soils"

"55762DBD-C95D-4CDC-BF06-BFC614E5948D".(SET.MCACT)    "AD,no gas,kt N/year,3.D.1.2,Organic Fertilizer,*,Agricultural Soils"
"11A3B4C7-8D11-499F-831B-F86155A901FD".(SET.MCACT)    "AD,no gas,kt N/year,3.D.1.2,Organic Fertilizer,Manure,Agricultural Soils"

"91D64DBE-F344-426A-9097-9DEFFD731DF0".(SET.MCACT)    "AD,no gas,kt N/year,3.D.1.4,Crop Residues,*,Agricultural Soils"

*"200C50F9-B172-40BC-A8EB-7110EBA69E10"    "AREA,no gas,ha/year,3.D.1.6,Histosols,*,Agricultural Soils"

"FD253921-C432-4B94-9D0A-2B1BEBAAAFC2".(SET.MCACT)    "AD,no gas,kt N/year,3.D.2.1,Atmosph. Deposition,*,Agricultural Soils"

"47A679D1-E78C-45F4-89D3-9775B22E92E3".(SET.MCACT)    "AD,no gas,kt N/year,3.D.2.2,Leaching and Run-off,*,Agricultural Soils"
/;

SET UID_TO_COLS(variableUID,DB_COLS)/
*---------------------------------
*          --- Emissions   (meastype EM)
*---------------------------------
**In kt CO2eq
"1D3FFBBD-28D5-4AD6-A543-9C6CC01B3F3B".(ImpactGWP)   "EM,Agg GHG,kt CO2eq,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
"27B33A5D-17DF-462F-9B69-26DBA0FB200D".(ImpactGWP)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Enteric Fermentation, *,*,*,*,*,Emissions"
"FC3813C1-1A50-4129-80B7-8345B0D04B59".(ImpactGWP)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Manure Management, *,*,*,*,*,Emissions   "
"A2043DCA-0841-48AC-AE35-CFC81552469B".(ImpactGWP)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Rice Cultivation, *,*,*,*,*,Emissions    "
"60689367-A22C-458E-974C-1CB7DE307DEA".(ImpactGWP)         "EM,Agg GHG,kt CO2eq,3,Farming,*,Agricultural Soils, *,*,*,*,*,Emissions  "
**Aggregate of liming and urea
"C25717DE-689C-497A-824B-09CD99ECF463".(UAAR)         "EM,CO2,kt,3,Farming,*,Agriculture, *,*,*,*,*,Emissions"
**Liming IPCC 3.G
"1A58E7E3-7119-4E78-8225-427C70B50AE9".(UAAR)         "EM,CO2,kt,3.G,Farming,*,Liming, *,*,*,*,*,Emissions"

**Urea Application 3.H
"9BAA5620-F155-4FEB-ACC8-45D3C994137D".(UAAR)         "EM,CO2,kt,3.H,Farming,*,Urea Application, *,*,*,*,*,Emissions"
  /;

SET UID_TO_ROWS(variableUID,DB_ROWS)/
*---------------------------------
*          --- Emissions   (meastype EM and NEXC)
*---------------------------------
*****Total N excreted
**Manure Management
*"EUGIRP20160202-20160204-1615.21-U2QoL9".(MANN)       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
*"EUGIRP20160322-20160322-1727.44-Cc0Z64".(MANN)       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"
"eugirp3B210CattlEM000000000000no0000".(MANN)       "EM,no gas,kt N/year,3.B.2.1,Cattle,*,Manure Management"

"43430FA4-F810-440C-B162-653A5E397DB1".(MANN)   "EM,no gas,kt N/year,3.B.2.1,Dairy Cattle,Manure Management"
"D111BD96-9E34-4EE7-B191-10FB3E1B5858".(MANN)   "EM,no gas,kt N/year,3.B.2.1,Non-Dairy Cattle,Manure Management"

"068CD34B-9068-4502-8D91-1711C6DA94D7".(MANN)         "EM,no gas,kt N/year,3.B.2.2,Sheep,*,Manure Management"
*"C0CBD1EE-FE26-4671-8D3E-EDD08C6E08DF".(MANN)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
*"0C84BC70-D3DC-4DEF-A945-D45311B1EF40".(MANN)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"
"3B1A4414-A756-4FC6-9553-0E15F1D76654".(MANN)         "EM,no gas,kt N/year,3.B.2.3,Swine,*,Manure Management"

"3B779BAE-5380-4707-AB54-183A8F9DCAB1".(MANN)         "EM,no gas,kt N/year,3.B.2.4,Other,*,Manure Management"


*---------------------------------
*          ---   Population (meastype POP)
*---------------------------------
**Enteric Fermentation
*"EUGIRP20160202-20160204-1615.18-2CGXDu".(HERD)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
*"EUGIRP20160322-20160322-1727.39-qi8AnI".(HERD)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"
"eugirp3A100CattlPOP00000000000no0000".(HERD)       "POP,no gas,1000s,3.A.1,Cattle,*,Enteric Fermentation"

"A5D9804F-99F0-49A8-9E3C-5422EF839F39".(HERD)    "POP,no gas,1000s,3.A.1,Dairy Cattle,Enteric Fermentation"
"F578FB5F-544E-4FDD-A670-FC7E435435C2".(HERD)   "POP,no gas,1000s,3.A.1,Non-Dairy Cattle,Enteric Fermentation"

"3F9C4313-F734-425C-AB3C-FE4BDE146086".(HERD)          "POP,no gas,1000s,3.A.2,Sheep,*,Enteric Fermentation"
"91817067-8DB6-41D6-A348-57E2C17B655D".(HERD)          "POP,no gas,1000s,3.A.3,Swine,*,Enteric Fermentation"
"69C10658-1D80-49A9-82D6-64802AD7729F".(HERD)           "POP,no gas,1000s,3.A.4,Other,*,Enteric Fermentation"
**Manure Management
"10F410FB-6F10-4B09-8572-9772A2DCC6A9".(HERD)          "POP,no gas,1000s,3.B.1.2,Sheep,*,Manure Management"
*"BC5A63BA-2DF1-45B8-9B58-3E3AD8C6EE61".(HERD)          "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"
"3CCE5B8B-8744-4710-898C-E0EC5BEDE9D1".(HERD)          "POP,no gas,1000s,3.B.1.3,Swine,*,Manure Management"

"62C716E7-E2EB-4F1D-BA1E-D7788D9A4547".(HERD)          "POP,no gas,1000s,3.B.1.4,Other,*,Manure Management"

"C329A125-EA9A-4B2C-A2B8-784B18D1BF55".(HERD)          "POP,no gas,1000s,3.B.2.2,Sheep,*,Manure Management"
*"1E78E006-F4A6-4410-AB92-3095B414C09D".(HERD)          "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"
"DD226591-C2F4-4200-90BF-BB0668DAE323".(HERD)          "POP,no gas,1000s,3.B.2.3,Swine,*,Manure Management"

"03CBE8C9-84C7-4FC5-92E9-BA6832032CB2".(HERD)          "POP,no gas,1000s,3.B.2.4,Other,*,Manure Management"


/;

SET UID_TO_ALLTYPE(variableUID,ALLTYPE)/
******N excreted per management system
*Cattle
*"EUGIRP20160322-20160322-1727.45-1vE9EZ".(Liquid)  "EM,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"
"eugirp3B210CattlNEX00000Liq000no0000".(Liquid)  "EM,no gas,kt N/year,3.B.2.1,Cattle,Liquid,Manure Management"

*"EUGIRP20160322-20160322-1727.45-CQkLOt".(Solid)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"
"eugirp3B210CattlNEX00000Sol000no0000".(Solid)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Solid,Manure Management"

*"EUGIRP20160322-20160322-1727.45-vrk1jx".(GRAZ)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"
"eugirp3B210CattlNEX00000Pas000no0000".(GRAZ)   "EM,no gas,kt N/year,3.B.2.1,Cattle,Pasture,Manure Management"

*Dairy Cattle
"EE5F1943-C0C3-438B-81C1-E87D32E57736".(Liquid)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Liquid,Manure Management"

"D6897BEB-9D08-4520-A966-A59899C07834".(Solid)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Solid,Manure Management"

"3CFC3C5B-4E75-43D0-923A-144022CFE313".(GRAZ)   "NEXC,no gas,kt N/year,3.B.2.1,Dairy Cattle,Pasture,Manure Management"

*Non-dairy cattle

"55CB462A-56EC-4DEE-AC04-0FDD30DE796F".(Liquid)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Liquid,Manure Management"

"31E7BC5E-8FE1-476E-977E-DF1424493295".(Solid)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Solid,Manure Management"

"B7BD3158-E56C-4CFB-9B9A-257EC73988FF".(GRAZ)       "NEXC,no gas,kt N/year,3.B.2.1,Non-dairy Cattle,Pasture,Manure Management"

*Sheep

"6CB83B55-0ADF-446B-914F-5A5C2DB16B23".(Liquid)   "EM,no gas,kt N/year,3.B.2.2,Sheep,Liquid,Manure Management"
"3564BF98-D065-4347-8ADB-B692E3B528E2".(Solid)   "EM,no gas,kt N/year,3.B.2.2,Sheep,Solid,Manure Management"
"27F7C980-43A5-45D1-B8B8-2BEBE2090CB6".(GRAZ)  "EM,no gas,kt N/year,3.B.2.2,Sheep,Pasture,Manure Management"


*Swine
"FB46F3E0-3436-4338-BEFA-3E5FD8E07B10".(Liquid) "EM,no gas,kt N/year,3.B.2.3,Swine,Liquid,Manure Management"
*"3FB4B8CB-B0A8-4BA1-8D81-CD412F301D1B".(Solid) "EM,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"
"AC010177-61D1-4033-98AD-D60E29983130".(Solid) "EM,no gas,kt N/year,3.B.2.3,Swine,Solid,Manure Management"

*"3FB36E10-9143-4C0C-968B-A2479C3EE2DB".(GRAZ) "EM,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"
"4D716761-7CC7-4C90-884A-55659E08CA04".(GRAZ) "EM,no gas,kt N/year,3.B.2.3,Swine,Pasture,Manure Management"

 /;
