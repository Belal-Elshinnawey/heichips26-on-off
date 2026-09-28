* NGSPICE file created from simple_comparator.ext - technology: ihp-sg13cmos5l

.subckt simple_comparator VDD comp_out VDDL VSS vref vin
X0 nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=31.50855p ps=0.11409m w=4u l=0.5u
X1 VSS nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X2 GROUP1$1_0.G GROUP1$1_0.G GROUP1$1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=64.9628p ps=0.22442m w=2u l=4u
X3 pmosHV_priv16$1_0.S vref GROUP1$2_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X4 VDDL VDDL VDDL VDDL sg13_hv_pmos ad=0.68p pd=4.68u as=19.2438p ps=41.22u w=2u l=4u
X5 VDDL GROUP1$1_0.G comp_out VDDL sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X6 VDD VDD VDD VDD sg13_hv_pmos ad=1.36p pd=8.68u as=53.87335p ps=0.21672m w=4u l=0.5u
X7 pmosHV_priv16$1_0.S vin nmosHV_priv18$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X8 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.23593n ps=0.56879m w=2u l=4u
X9 VSS nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X10 GROUP1$2_0.nmosHV_priv3$2_0.S VSS VSS rhigh l=0.12344m w=2u
X11 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X12 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X13 VSS nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X14 VDD GROUP1$2_0.G GROUP1$1_0.G VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X15 VDD GROUP3$1_0.G GROUP3$1_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X16 GROUP1$2_0.nmosHV_priv3$2_0.S GROUP1$2_0.nmosHV_priv3$2_0.S GROUP1$2_0.nmosHV_priv3$2_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=15.7454p ps=34.18u w=2u l=4u
X17 pmosHV_priv16$1_0.S vref GROUP1$2_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X18 pmosHV_priv16$1_0.S vref GROUP1$2_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X19 pmosHV_priv16$1_0.S vref GROUP1$2_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X20 VSS nmosHV_priv18$1_0.S GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X21 VDD VDD VDD VDD sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X22 GROUP1$2_0.G GROUP1$2_0.G GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=54.5816p ps=0.24978m w=2u l=0.5u
X23 comp_out comp_out comp_out VDDL sg13_hv_pmos ad=0.68p pd=4.68u as=29.0796p ps=57.16u w=2u l=4u
X24 pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=30.225p ps=0.1221m w=4u l=0.5u
X25 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X26 GROUP3$1_0.G GROUP3$1_0.G GROUP3$1_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=38.75025p ps=92.41u w=4u l=0.5u
X27 GROUP1$2_0.G GROUP1$2_0.G GROUP1$2_0.G VDD sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X28 GROUP3$1_0.G VSS VSS rhigh l=0.1483m w=2u
X29 VDD GROUP3$1_0.G pmosHV_priv16$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X30 pmosHV_priv16$1_0.S vin nmosHV_priv18$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X31 GROUP1$1_0.G GROUP1$1_0.G GROUP1$1_0.G VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X32 pmosHV_priv16$1_0.S vin nmosHV_priv18$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X33 comp_out GROUP1$1_0.G VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X34 pmosHV_priv16$1_0.S vin nmosHV_priv18$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X35 comp_out comp_out comp_out VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X36 nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X37 VSS nmosHV_priv18$1_0.S nmosHV_priv18$1_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X38 pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X39 VSS nmosHV_priv18$1_0.S GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X40 VSS nmosHV_priv18$1_0.S GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X41 VSS nmosHV_priv18$1_0.S GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X42 GROUP1$1_0.G GROUP1$2_0.G GROUP1$2_0.nmosHV_priv3$2_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X43 pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S pmosHV_priv16$1_0.S VDD sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
.ends

