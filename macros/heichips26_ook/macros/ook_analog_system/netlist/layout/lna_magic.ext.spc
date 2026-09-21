* NGSPICE file created from lna.ext - technology: ihp-sg13cmos5l

.subckt lna VDD vin vout VSS
X0 M24_0/pmosHV$1_priv4_0.D VSS VSS rhigh l=15.02u w=2u
X1 M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X2 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=32.5486p ps=0.17387m w=2u l=0.5u
X3 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X4 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X5 VDD M22_0/pmosHV$1_priv2_0.D M23_0/pmosHV$1_priv3_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X6 vout vout vout VDD sg13_hv_pmos ad=0.68p pd=4.68u as=16.0372p ps=91.63999u w=2u l=0.5u
X7 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X8 M21_0/nmosHV$5_priv1_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X9 VSS VSS VSS VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0 ps=0 w=0.5u l=0.5u
X10 VDD M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X11 M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD sg13_hv_pmos ad=0.68p pd=4.68u as=34.3557p ps=0.14088m w=2u l=0.5u
X12 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X13 M14_0/nmosHV_priv1_0.S M14_0/nmosHV_priv1_0.S M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.34p pd=2.68u as=6.9973p ps=50.28u w=1u l=0.5u
X14 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0.19p ps=1.38u w=1u l=0.5u
X15 vout M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X16 M23_0/pmosHV$1_priv3_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X17 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X18 M23_0/pmosHV$1_priv3_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X19 M23_0/pmosHV$1_priv3_0.D M23_0/pmosHV$1_priv3_0.D M23_0/pmosHV$1_priv3_0.D VSS sg13_hv_nmos ad=0.17p pd=1.68u as=11.7335p ps=72.64u w=0.5u l=0.5u
X20 VSS M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X21 M16_0/nmosHV$2_priv1_0.D M16_0/nmosHV$2_priv1_0.D M16_0/nmosHV$2_priv1_0.D VSS sg13_hv_nmos ad=0.34p pd=2.68u as=34.1645p ps=81.03u w=1u l=0.5u
X22 vout vout vout VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X23 M23_0/pmosHV$1_priv3_0.D M23_0/pmosHV$1_priv3_0.D M23_0/pmosHV$1_priv3_0.D VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X24 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X25 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X26 M2_0/nmosHV$3_priv4_0.D M2_0/nmosHV$3_priv4_0.D VSS VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0.17p ps=1.68u w=0.5u l=0.5u
X27 VDD M24_0/pmosHV$1_priv4_0.D vout VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X28 VDD M24_0/pmosHV$1_priv4_0.D vout VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X29 M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X30 M21_0/nmosHV$5_priv1_0.D M23_0/pmosHV$1_priv3_0.D VDD VSS sg13_hv_nmos ad=0.51p pd=3.68u as=0.51p ps=3.68u w=1.5u l=0.5u
X31 M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X32 M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X33 VDD M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X34 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X35 M21_0/nmosHV$5_priv1_0.D M21_0/nmosHV$5_priv1_0.D M21_0/nmosHV$5_priv1_0.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=16.6844p ps=93.14999u w=2u l=0.5u
X36 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.34p ps=2.68u w=1u l=0.5u
X37 VDD M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X38 M16_0/nmosHV$2_priv1_0.D VDD VSS rhigh l=0.20002m w=2u
X39 VSS M21_0/nmosHV$5_priv1_0.D vout VDD sg13_hv_pmos ad=0.238p pd=2.08u as=0.238p ps=2.08u w=0.7u l=0.5u
X40 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X41 vin M16_0/nmosHV$2_priv1_0.D VSS rhigh l=40u w=2u
X42 M20_0/nmosHV$5_priv2_0.D VDD VSS rhigh l=0.20002m w=2u
X43 VSS VSS VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X44 VDD M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X45 VDD M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X46 M2_0/nmosHV$3_priv4_0.D M2_0/nmosHV$3_priv4_0.D M2_0/nmosHV$3_priv4_0.D VSS sg13_hv_nmos ad=0.17p pd=1.68u as=14.44555p ps=50.73u w=0.5u l=0.5u
X47 vout VDD M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0.19p ps=1.38u w=1u l=0.5u
X48 VDD M24_0/pmosHV$1_priv4_0.D vout VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X49 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X50 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.22106n ps=0.53081m w=2u l=0.5u
X51 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X52 VDD M24_0/pmosHV$1_priv4_0.D vout VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X53 M21_0/nmosHV$5_priv1_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X54 VSS VSS VSS VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0 ps=0 w=0.5u l=0.5u
X55 M21_0/nmosHV$5_priv1_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X56 M21_0/nmosHV$5_priv1_0.D M21_0/nmosHV$5_priv1_0.D M21_0/nmosHV$5_priv1_0.D VSS sg13_hv_nmos ad=0.51p pd=3.68u as=0 ps=0 w=1.5u l=0.5u
X57 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X58 VDD M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X59 M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=37.62435p ps=0.10861m w=2u l=0.5u
X60 VSS M2_0/nmosHV$3_priv4_0.D vout VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0.17p ps=1.68u w=0.5u l=0.5u
X61 VDD M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X62 M14_0/nmosHV_priv1_0.S VDD vout VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.34p ps=2.68u w=1u l=0.5u
X63 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X64 M22_0/pmosHV$1_priv2_0.D VSS VSS rhigh l=15.02u w=2u
X65 VSS VSS VSS VDD sg13_hv_pmos ad=0.238p pd=2.08u as=0 ps=0 w=0.7u l=0.5u
X66 VDD M2_0/nmosHV$3_priv4_0.D VSS rhigh l=0.24997m w=2u
X67 VDD VDD VDD VSS sg13_hv_nmos ad=0.51p pd=3.68u as=0 ps=0 w=1.5u l=0.5u
X68 vout M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X69 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X70 VSS M20_0/nmosHV$5_priv2_0.D M21_0/nmosHV$5_priv1_0.D VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X71 M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X72 vout vout vout VDD sg13_hv_pmos ad=0.238p pd=2.08u as=0 ps=0 w=0.7u l=0.5u
X73 M24_0/pmosHV$1_priv4_0.D M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X74 M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X75 M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X76 M23_0/pmosHV$1_priv3_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X77 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X78 M23_0/pmosHV$1_priv3_0.D M22_0/pmosHV$1_priv2_0.D VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X79 M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X80 M16_0/nmosHV$2_priv1_0.D M16_0/nmosHV$2_priv1_0.D VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0.19p ps=1.38u w=1u l=0.5u
X81 M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X82 VSS vin M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X83 M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D M22_0/pmosHV$1_priv2_0.D VDD sg13_hv_pmos ad=0.68p pd=4.68u as=35.2356p ps=0.14882m w=2u l=0.5u
X84 VSS VSS VSS VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0 ps=0 w=0.5u l=0.5u
X85 VSS vout M23_0/pmosHV$1_priv3_0.D VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0.17p ps=1.68u w=0.5u l=0.5u
X86 VDD M22_0/pmosHV$1_priv2_0.D M23_0/pmosHV$1_priv3_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X87 VSS M16_0/nmosHV$2_priv1_0.D M16_0/nmosHV$2_priv1_0.D VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.34p ps=2.68u w=1u l=0.5u
X88 VSS VSS VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X89 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X90 VDD M22_0/pmosHV$1_priv2_0.D M23_0/pmosHV$1_priv3_0.D VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X91 M14_0/nmosHV_priv1_0.S M14_0/nmosHV_priv1_0.S M14_0/nmosHV_priv1_0.S VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X92 vout vout vout VSS sg13_hv_nmos ad=0.17p pd=1.68u as=0 ps=0 w=0.5u l=0.5u
X93 VSS M20_0/nmosHV$5_priv2_0.D M20_0/nmosHV$5_priv2_0.D VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X94 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X95 vout M24_0/pmosHV$1_priv4_0.D VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X96 M14_0/nmosHV_priv1_0.S vin VSS VSS sg13_hv_nmos ad=0.19p pd=1.38u as=0.19p ps=1.38u w=1u l=0.5u
X97 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X98 VSS M20_0/nmosHV$5_priv2_0.D M21_0/nmosHV$5_priv1_0.D VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
.ends

