* NGSPICE file created from simple_comparator_stage.ext - technology: ihp-sg13cmos5l

.subckt simple_comparator_stage VDDL vin vref0 VSS VDD vref1 vref2 vref3 q0 q1 q2
+ q3
X0 VDD pmosHV_priv7_2.D pmosHV_priv8_2.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X1 VDD nmosHV_priv5_0.D nmosHV_priv6_0.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X2 VDDL nmosHV_priv6_0.D q3 VDDL sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X3 VDD pmosHV_priv4_3.D pmosHV_priv4_3.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X4 VDD pmosHV_priv4_1.D pmosHV_priv4_1.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X5 pmosHV_priv6_3.S vref0 nmosHV_priv5_3.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X6 pmosHV_priv5_2.D vin nmosHV_priv4_2.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X7 pmosHV_priv7_2.D nmosHV_priv4_2.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X8 q0 pmosHV_priv8_3.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X9 VDD pmosHV_priv4_2.D pmosHV_priv5_2.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X10 vref0 vref1 VSS rppd l=3.6u w=2u
X11 VDD pmosHV_priv4_3.D pmosHV_priv6_3.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X12 VDDL pmosHV_priv8_3.D q0 VDDL sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X13 pmosHV_priv5_0.D vin nmosHV_priv4_0.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X14 q2 pmosHV_priv8_1.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X15 vref2 vref3 VSS rppd l=2u w=2u
X16 VDD pmosHV_priv4_0.D pmosHV_priv4_0.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X17 pmosHV_priv4_3.D VSS VSS rhigh l=0.1483m w=2u
X18 pmosHV_priv4_2.D VSS VSS rhigh l=0.1483m w=2u
X19 q1 pmosHV_priv8_2.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X20 nmosHV_priv6_0.D nmosHV_priv5_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X21 vref3 VDD VSS rhigh l=42u w=2u
X22 VDD pmosHV_priv4_2.D pmosHV_priv4_2.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X23 pmosHV_priv4_1.D VSS VSS rhigh l=0.1483m w=2u
X24 pmosHV_priv8_3.D nmosHV_priv5_3.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X25 pmosHV_priv8_1.D nmosHV_priv5_1.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X26 pmosHV_priv6_1.S vref2 nmosHV_priv5_1.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X27 VDD nmosHV_priv5_3.D pmosHV_priv8_3.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X28 VDD pmosHV_priv4_1.D pmosHV_priv6_1.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X29 nmosHV_priv5_3.D nmosHV_priv4_3.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X30 pmosHV_priv5_2.D vref1 pmosHV_priv7_2.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X31 nmosHV_priv4_3.D nmosHV_priv4_3.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X32 VSS vref0 VSS rhigh l=3.49u w=2u
X33 nmosHV_priv4_1.D nmosHV_priv4_1.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X34 q3 nmosHV_priv6_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X35 VDDL pmosHV_priv8_2.D q1 VDDL sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X36 VDD pmosHV_priv4_0.D pmosHV_priv5_0.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X37 pmosHV_priv4_0.D VSS VSS rhigh l=0.1483m w=2u
X38 vref1 vref2 VSS rppd l=1.28u w=2u
X39 nmosHV_priv4_0.D nmosHV_priv4_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X40 VDD nmosHV_priv5_1.D pmosHV_priv8_1.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X41 VDDL pmosHV_priv8_1.D q2 VDDL sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X42 nmosHV_priv5_0.D nmosHV_priv4_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X43 pmosHV_priv5_0.D vref3 nmosHV_priv5_0.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X44 nmosHV_priv5_1.D nmosHV_priv4_1.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X45 pmosHV_priv6_3.S vin nmosHV_priv4_3.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X46 pmosHV_priv8_2.D pmosHV_priv7_2.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X47 nmosHV_priv4_2.D nmosHV_priv4_2.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X48 pmosHV_priv6_1.S vin nmosHV_priv4_1.D VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
.ends

