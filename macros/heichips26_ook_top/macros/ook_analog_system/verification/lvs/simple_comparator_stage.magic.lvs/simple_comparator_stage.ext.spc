* NGSPICE file created from simple_comparator_stage.ext - technology: ihp-sg13cmos5l

.subckt simple_comparator_stage VDD3_3 vin q0 q1 q2 q3 VSS vref0 vref1 vref2 vref3
+ VDD1_5
X0 pmosHV_priv24_1.S vin nmosHV_priv13_3.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X1 VDD1_5 VDD1_5 VDD1_5 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=76.7627p ps=0.16453m w=2u l=4u
X2 VDD1_5 VDD1_5 VDD1_5 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X3 GROUP1_0.nmosHV_priv3_0.D GROUP1_0.nmosHV_priv3_0.D GROUP1_0.nmosHV_priv3_0.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=64.9628p ps=0.22442m w=2u l=4u
X4 pmosHV_priv20_3.S vin nmosHV_priv18_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X5 nmosHV_priv13_2.D nmosHV_priv13_2.D nmosHV_priv13_2.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=31.50855p ps=0.11409m w=4u l=0.5u
X6 pmosHV_priv24_1.S vin nmosHV_priv13_3.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X7 VSS nmosHV_priv13_2.D nmosHV_priv13_2.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X8 GROUP1$1$3_0.G GROUP1$1$3_0.G GROUP1$1$3_0.G VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=64.9628p ps=0.22442m w=2u l=4u
X9 VDD1_5 VDD1_5 VDD1_5 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X10 GROUP9$3_0.pmosHV_priv5$3_0.D GROUP9$3_0.G GROUP1$3_0.nmosHV_priv3$3_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X11 VSS nmosHV_priv13_1.D nmosHV_priv13_1.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X12 VDD1_5 VDD1_5 VDD1_5 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X13 pmosHV_priv16_0.S vref0 GROUP1_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X14 pmosHV_priv26_2.S vref2 GROUP9$3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X15 VSS nmosHV_priv18_3.S GROUP1$4_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X16 VDD1_5 GROUP9$3_0.pmosHV_priv5$3_0.D q2 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X17 VDD1_5 GROUP1$2_0.nmosHV_priv3$2_0.D q1 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X18 pmosHV_priv26_2.S vin nmosHV_priv13_1.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X19 VSS nmosHV_priv13_3.D GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X20 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0.43869n ps=1.23286m w=4u l=0.5u
X21 nmosHV_priv13_3.D nmosHV_priv13_3.D nmosHV_priv13_3.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=31.50855p ps=0.11409m w=2u l=0.5u
X22 pmosHV_priv20_3.S pmosHV_priv20_3.S pmosHV_priv20_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=30.225p ps=0.1221m w=4u l=0.5u
X23 q3 q3 q3 VSS sg13_hv_nmos ad=0.68p pd=4.68u as=29.0796p ps=57.16u w=2u l=4u
X24 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.67473n ps=1.83286m w=2u l=4u
X25 VSS nmosHV_priv13_3.D nmosHV_priv13_3.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X26 VDD1_5 GROUP1_0.nmosHV_priv3_0.D q0 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X27 GROUP3_2.G VSS VSS rhigh l=0.1483m w=2u
X28 pmosHV_priv26_2.S vref2 GROUP9$3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X29 pmosHV_priv16_0.S vin nmosHV_priv13_2.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X30 VSS nmosHV_priv13_1.D GROUP9$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X31 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X32 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X33 GROUP1$4_0.G GROUP1$4_0.G GROUP1$4_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=54.5816p ps=0.24978m w=4u l=0.5u
X34 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X35 VSS nmosHV_priv13_1.D nmosHV_priv13_1.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X36 GROUP9$3_0.G GROUP9$3_0.G GROUP9$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=54.5816p ps=0.24978m w=2u l=0.5u
X37 pmosHV_priv20_3.S pmosHV_priv20_3.S pmosHV_priv20_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X38 VSS nmosHV_priv13_2.D nmosHV_priv13_2.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X39 pmosHV_priv24_1.S pmosHV_priv24_1.S pmosHV_priv24_1.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=30.225p ps=0.1221m w=4u l=0.5u
X40 q3 GROUP1$1$3_0.G VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X41 GROUP1$4_0.nmosHV_priv3$4_0.S VSS VSS rhigh l=0.12344m w=2u
X42 VSS nmosHV_priv18_3.S GROUP1$4_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X43 VSS nmosHV_priv13_3.D GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X44 pmosHV_priv20_3.S vref3 GROUP1$4_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X45 GROUP1_0.nmosHV_priv3_0.S VSS VSS rhigh l=0.12344m w=2u
X46 VSS nmosHV_priv18_3.S GROUP1$4_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X47 VSS nmosHV_priv13_3.D GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X48 pmosHV_priv26_2.S pmosHV_priv26_2.S pmosHV_priv26_2.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=30.225p ps=0.1221m w=4u l=0.5u
X49 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X50 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X51 pmosHV_priv24_1.S pmosHV_priv24_1.S pmosHV_priv24_1.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X52 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X53 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X54 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X55 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X56 vref0 vref1 VSS rhigh l=2.8u w=2u
X57 VSS nmosHV_priv18_3.S nmosHV_priv18_3.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X58 GROUP4_3.G GROUP4_3.G GROUP4_3.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=38.75025p ps=92.41u w=4u l=0.5u
X59 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X60 GROUP1$2_0.G GROUP1$2_0.G GROUP1$2_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=54.5816p ps=0.24978m w=4u l=0.5u
X61 VSS nmosHV_priv13_3.D nmosHV_priv13_3.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X62 VSS nmosHV_priv13_2.D nmosHV_priv13_2.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X63 VDD3_3 GROUP9$3_0.G GROUP9$3_0.pmosHV_priv5$3_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X64 VSS nmosHV_priv18_3.S nmosHV_priv18_3.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X65 VDD3_3 GROUP1$2_0.G GROUP1$2_0.nmosHV_priv3$2_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X66 VSS vref0 VSS rhigh l=12.9u w=2u
X67 pmosHV_priv24_1.S vref1 GROUP1$2_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X68 GROUP1$1$3_0.G GROUP1$1$3_0.G GROUP1$1$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X69 GROUP9$3_0.G GROUP9$3_0.G GROUP9$3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X70 GROUP1$3_0.nmosHV_priv3$3_0.S GROUP1$3_0.nmosHV_priv3$3_0.S GROUP1$3_0.nmosHV_priv3$3_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=15.7454p ps=34.18u w=2u l=4u
X71 VDD3_3 GROUP1_0.G GROUP1_0.nmosHV_priv3_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X72 VSS nmosHV_priv13_1.D GROUP9$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X73 pmosHV_priv26_2.S vin nmosHV_priv13_1.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X74 GROUP1_0.nmosHV_priv3_0.S GROUP1_0.nmosHV_priv3_0.S GROUP1_0.nmosHV_priv3_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=15.7454p ps=34.18u w=2u l=4u
X75 VDD3_3 GROUP3_1.G GROUP3_1.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X76 VDD3_3 GROUP4_3.G pmosHV_priv26_2.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X77 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X78 pmosHV_priv20_3.S vin nmosHV_priv18_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X79 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X80 GROUP1$1$3_0.G GROUP1$4_0.G GROUP1$4_0.nmosHV_priv3$4_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X81 pmosHV_priv24_1.S vin nmosHV_priv13_3.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X82 pmosHV_priv26_2.S vin nmosHV_priv13_1.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X83 GROUP4_3.G VSS VSS rhigh l=0.1483m w=2u
X84 pmosHV_priv16_0.S vref0 GROUP1_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X85 pmosHV_priv16_0.S vref0 GROUP1_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X86 VSS nmosHV_priv13_1.D nmosHV_priv13_1.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X87 q2 q2 q2 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=29.0796p ps=57.16u w=2u l=4u
X88 GROUP1$2_0.nmosHV_priv3$2_0.S GROUP1$2_0.nmosHV_priv3$2_0.S GROUP1$2_0.nmosHV_priv3$2_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=15.7454p ps=34.18u w=2u l=4u
X89 pmosHV_priv16_0.S vref0 GROUP1_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X90 nmosHV_priv13_1.D nmosHV_priv13_1.D nmosHV_priv13_1.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=31.50855p ps=0.11409m w=2u l=0.5u
X91 nmosHV_priv18_3.S nmosHV_priv18_3.S nmosHV_priv18_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=31.50855p ps=0.11409m w=4u l=0.5u
X92 VSS nmosHV_priv13_2.D GROUP1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X93 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X94 q1 q1 q1 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=29.0796p ps=57.16u w=2u l=4u
X95 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X96 pmosHV_priv24_1.S pmosHV_priv24_1.S pmosHV_priv24_1.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X97 GROUP1_0.G GROUP1_0.G GROUP1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=54.5816p ps=0.24978m w=2u l=0.5u
X98 q0 q0 q0 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=29.0796p ps=57.16u w=2u l=4u
X99 VSS nmosHV_priv18_3.S nmosHV_priv18_3.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X100 VDD1_5 GROUP1$1$3_0.G q3 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X101 pmosHV_priv20_3.S vref3 GROUP1$4_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X102 VSS nmosHV_priv13_3.D GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X103 pmosHV_priv26_2.S pmosHV_priv26_2.S pmosHV_priv26_2.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X104 GROUP3_0.G VSS VSS rhigh l=0.1483m w=2u
X105 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X106 VSS nmosHV_priv13_1.D GROUP9$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X107 pmosHV_priv16_0.S pmosHV_priv16_0.S pmosHV_priv16_0.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=30.225p ps=0.1221m w=4u l=0.5u
X108 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X109 VDD3_3 GROUP3_2.G GROUP3_2.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X110 nmosHV_priv13_3.D nmosHV_priv13_3.D nmosHV_priv13_3.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X111 VSS nmosHV_priv18_3.S GROUP1$4_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X112 pmosHV_priv26_2.S pmosHV_priv26_2.S pmosHV_priv26_2.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X113 GROUP3_1.G GROUP3_1.G GROUP3_1.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=38.75025p ps=92.41u w=4u l=0.5u
X114 GROUP1$4_0.G GROUP1$4_0.G GROUP1$4_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X115 vref1 vref2 VSS rhigh l=1.4u w=2u
X116 q1 q1 q1 VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X117 vref3 VDD3_3 VSS rhigh l=28.8u w=2u
X118 pmosHV_priv24_1.S vref1 GROUP1$2_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X119 nmosHV_priv13_1.D nmosHV_priv13_1.D nmosHV_priv13_1.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X120 pmosHV_priv20_3.S vref3 GROUP1$4_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X121 GROUP1_0.G GROUP1_0.G GROUP1_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X122 GROUP9$3_0.pmosHV_priv5$3_0.D GROUP9$3_0.pmosHV_priv5$3_0.D GROUP9$3_0.pmosHV_priv5$3_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=64.9628p ps=0.22442m w=2u l=4u
X123 GROUP3_1.G VSS VSS rhigh l=0.1483m w=2u
X124 pmosHV_priv24_1.S vref1 GROUP1$2_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X125 pmosHV_priv26_2.S vref2 GROUP9$3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X126 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X127 VSS nmosHV_priv13_1.D GROUP9$3_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X128 GROUP1$3_0.nmosHV_priv3$3_0.S VSS VSS rhigh l=0.12344m w=2u
X129 q1 GROUP1$2_0.nmosHV_priv3$2_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X130 GROUP1$2_0.nmosHV_priv3$2_0.D GROUP1$2_0.nmosHV_priv3$2_0.D GROUP1$2_0.nmosHV_priv3$2_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=64.9628p ps=0.22442m w=2u l=4u
X131 pmosHV_priv20_3.S vref3 GROUP1$4_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X132 pmosHV_priv16_0.S vin nmosHV_priv13_2.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X133 pmosHV_priv24_1.S vref1 GROUP1$2_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X134 GROUP1_0.nmosHV_priv3_0.D GROUP1_0.nmosHV_priv3_0.D GROUP1_0.nmosHV_priv3_0.D VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X135 VDD3_3 GROUP3_1.G pmosHV_priv16_0.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X136 VDD3_3 GROUP3_0.G GROUP3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X137 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X138 VDD3_3 GROUP1$4_0.G GROUP1$1$3_0.G VDD3_3 sg13_hv_pmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X139 GROUP3_2.G GROUP3_2.G GROUP3_2.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=38.75025p ps=92.41u w=4u l=0.5u
X140 pmosHV_priv26_2.S vref2 GROUP9$3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X141 VSS nmosHV_priv13_3.D nmosHV_priv13_3.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X142 pmosHV_priv16_0.S vin nmosHV_priv13_2.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X143 q0 GROUP1_0.nmosHV_priv3_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X144 q2 q2 q2 VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X145 GROUP1$2_0.G GROUP1$2_0.G GROUP1$2_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X146 pmosHV_priv26_2.S vin nmosHV_priv13_1.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X147 GROUP1$4_0.nmosHV_priv3$4_0.S GROUP1$4_0.nmosHV_priv3$4_0.S GROUP1$4_0.nmosHV_priv3$4_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=15.7454p ps=34.18u w=2u l=4u
X148 VDD3_3 GROUP4_3.G GROUP4_3.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X149 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X150 pmosHV_priv16_0.S vin nmosHV_priv13_2.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X151 q0 q0 q0 VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X152 VSS nmosHV_priv13_1.D nmosHV_priv13_1.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X153 q3 q3 q3 VDD1_5 sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X154 pmosHV_priv20_3.S pmosHV_priv20_3.S pmosHV_priv20_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X155 q2 GROUP9$3_0.pmosHV_priv5$3_0.D VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X156 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X157 nmosHV_priv13_2.D nmosHV_priv13_2.D nmosHV_priv13_2.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X158 pmosHV_priv20_3.S vin nmosHV_priv18_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X159 VSS nmosHV_priv13_2.D nmosHV_priv13_2.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X160 GROUP1$2_0.nmosHV_priv3$2_0.S VSS VSS rhigh l=0.12344m w=2u
X161 GROUP3_0.G GROUP3_0.G GROUP3_0.G VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=38.75025p ps=92.41u w=4u l=0.5u
X162 GROUP1$2_0.nmosHV_priv3$2_0.D GROUP1$2_0.nmosHV_priv3$2_0.D GROUP1$2_0.nmosHV_priv3$2_0.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X163 VSS nmosHV_priv13_3.D nmosHV_priv13_3.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X164 pmosHV_priv20_3.S vin nmosHV_priv18_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X165 VSS VSS VSS VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X166 pmosHV_priv16_0.S pmosHV_priv16_0.S pmosHV_priv16_0.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X167 GROUP1$2_0.nmosHV_priv3$2_0.D GROUP1$2_0.G GROUP1$2_0.nmosHV_priv3$2_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X168 VSS nmosHV_priv13_2.D GROUP1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X169 VSS nmosHV_priv13_2.D GROUP1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X170 VSS nmosHV_priv13_2.D GROUP1_0.G VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X171 VDD3_3 GROUP3_2.G pmosHV_priv20_3.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X172 VDD3_3 VDD3_3 VDD3_3 VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X173 GROUP1_0.nmosHV_priv3_0.D GROUP1_0.G GROUP1_0.nmosHV_priv3_0.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=4u
X174 nmosHV_priv18_3.S nmosHV_priv18_3.S nmosHV_priv18_3.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X175 pmosHV_priv24_1.S vin nmosHV_priv13_3.D VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
X176 GROUP9$3_0.pmosHV_priv5$3_0.D GROUP9$3_0.pmosHV_priv5$3_0.D GROUP9$3_0.pmosHV_priv5$3_0.D VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=4u
X177 VSS nmosHV_priv18_3.S nmosHV_priv18_3.S VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.68p ps=4.68u w=2u l=0.5u
X178 vref2 vref3 VSS rhigh l=1.4u w=2u
X179 pmosHV_priv16_0.S pmosHV_priv16_0.S pmosHV_priv16_0.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=0 ps=0 w=4u l=0.5u
X180 VDD3_3 GROUP3_0.G pmosHV_priv24_1.S VDD3_3 sg13_hv_pmos ad=1.36p pd=8.68u as=1.36p ps=8.68u w=4u l=0.5u
.ends

