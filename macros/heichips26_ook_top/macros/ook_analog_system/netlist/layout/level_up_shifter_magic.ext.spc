* NGSPICE file created from level_up_shifter.ext - technology: ihp-sg13cmos5l

.subckt level_up_shifter B A VDD1 VDD2 VSS
X0 VSS VSS VSS VSS sg13_lv_nmos ad=0.34p pd=2.68u as=10.9358p ps=83.11u w=1u l=0.13u
X1 VDD1 GROUP1_0/pmos_priv2_0.D GROUP4_0/pmos_priv5_0.D VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.13u
X2 VDD2 nmosHV_priv1_0.D pmosHV_priv2_0.D VDD2 sg13_hv_pmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.5u
X3 VDD1 A GROUP1_0/pmos_priv2_0.D VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.13u
X4 VSS VSS VSS VSS sg13_lv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.13u
X5 VDD2 pmosHV_priv2_0.D nmosHV_priv1_0.D VDD2 sg13_hv_pmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.5u
X6 GROUP4_0/pmos_priv5_0.D GROUP4_0/pmos_priv5_0.D GROUP4_0/pmos_priv5_0.D VSS sg13_lv_nmos ad=0.34p pd=2.68u as=4.34p ps=25.58u w=1u l=0.13u
X7 GROUP4_0/pmos_priv5_0.D GROUP4_0/pmos_priv5_0.D GROUP4_0/pmos_priv5_0.D VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.13u
X8 GROUP1_0/pmos_priv2_0.D GROUP1_0/pmos_priv2_0.D GROUP1_0/pmos_priv2_0.D VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=14.5676p ps=72.93999u w=1u l=0.13u
X9 GROUP1_0/pmos_priv2_0.D GROUP1_0/pmos_priv2_0.D GROUP1_0/pmos_priv2_0.D VSS sg13_lv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.13u
X10 B pmosHV_priv2_0.D VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.5u
X11 VSS VSS VSS VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X12 VDD2 VDD2 VDD2 VDD2 sg13_hv_pmos ad=1.02p pd=6.68u as=5.8956p ps=28.68u w=3u l=0.5u
X13 GROUP4_0/pmos_priv5_0.D GROUP1_0/pmos_priv2_0.D VSS VSS sg13_lv_nmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.13u
X14 nmosHV_priv1_0.D GROUP1_0/pmos_priv2_0.D VSS VSS sg13_hv_nmos ad=3.4p pd=20.68u as=3.4p ps=20.68u w=10u l=0.5u
X15 GROUP1_0/pmos_priv2_0.D A VSS VSS sg13_lv_nmos ad=0.34p pd=2.68u as=0.34p ps=2.68u w=1u l=0.13u
X16 B B B VDD2 sg13_hv_pmos ad=1.02p pd=6.68u as=7.2396p ps=29.16u w=3u l=0.5u
X17 B B B VSS sg13_hv_nmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.5u
X18 VDD2 pmosHV_priv2_0.D B VDD2 sg13_hv_pmos ad=1.02p pd=6.68u as=1.02p ps=6.68u w=3u l=0.5u
X19 VDD1 VDD1 VDD1 VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=3.8804p ps=22.12u w=1u l=0.13u
X20 pmosHV_priv2_0.D GROUP4_0/pmos_priv5_0.D VSS VSS sg13_hv_nmos ad=3.4p pd=20.68u as=3.4p ps=20.68u w=10u l=0.5u
X21 VDD1 VDD1 VDD1 VDD1 sg13_lv_pmos ad=0.34p pd=2.68u as=0 ps=0 w=1u l=0.13u
.ends

