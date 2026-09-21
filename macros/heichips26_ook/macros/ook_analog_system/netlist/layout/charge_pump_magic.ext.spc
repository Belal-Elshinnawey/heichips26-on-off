* NGSPICE file created from charge_pump.ext - technology: ihp-sg13cmos5l

.subckt charge_pump cp_cap_m vout VDD VSS UP DN cp_cap_p
X0 VDD VDD VDD VDD sg13_lv_pmos ad=0.68p pd=4.68u as=21.1572p ps=82.46u w=2u l=0.5u
X1 VDD VDD VDD VDD sg13_lv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X2 GROUP2_0.nmos_priv2_0.D DN cp_cap_p VSS sg13_lv_nmos ad=0.11875p pd=1.005u as=0.2125p ps=1.93u w=0.625u l=0.5u
X3 VDD GROUP5_0.G GROUP5_0.G VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X4 VDD GROUP5_0.G GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X5 VSS GROUP1_0.G GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X6 GROUP2_0.nmos_priv2_0.D GROUP1_0.G VSS VSS sg13_lv_nmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X7 cp_cap_p DN GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.11875p pd=1.005u as=0.11875p ps=1.005u w=0.625u l=0.5u
X8 GROUP2_0.nmos_priv2_0.D GROUP1_0.G VSS VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X9 GROUP5_0.G GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X10 GROUP4_0.pmos$1_priv1_0.S GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X11 GROUP4_0.pmos$1_priv1_0.S GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X12 cp_cap_p cp_cap_p cp_cap_p VDD sg13_lv_pmos ad=0.2142p pd=1.94u as=1.03461n ps=0.01256 w=0.63u l=0.5u
X13 GROUP5_0.G GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X14 GROUP1_0.G GROUP1_0.G VSS VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X15 VSS VSS VSS VSS sg13_lv_nmos ad=0.68p pd=4.68u as=0.14356n ps=1.42434m w=2u l=0.5u
X16 GROUP4_0.pmos$1_priv1_0.S UP cp_cap_p VDD sg13_lv_pmos ad=0.11875p pd=1.005u as=0.11875p ps=1.005u w=0.625u l=0.5u
X17 GROUP4_0.pmos$1_priv1_0.S GROUP4_0.pmos$1_priv1_0.S GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.2142p pd=1.94u as=7.052p ps=42.84u w=0.63u l=0.5u
X18 GROUP1_0.G GROUP1_0.G GROUP1_0.G VSS sg13_lv_nmos ad=0.68p pd=4.68u as=0.1098n ps=0.25428m w=2u l=0.5u
X19 VSS GROUP1_0.G GROUP1_0.G VSS sg13_lv_nmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X20 cp_cap_p UP GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.2125p pd=1.93u as=0.11875p ps=1.005u w=0.625u l=0.5u
X21 GROUP4_0.pmos$1_priv1_0.S GROUP4_0.pmos$1_priv1_0.S GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X22 GROUP5_0.G GROUP5_0.G GROUP5_0.G VDD sg13_lv_pmos ad=0.68p pd=4.68u as=37.5438p ps=0.11538m w=2u l=0.5u
X23 GROUP5_0.G VSS VSS rhigh l=0.27592m w=2u
X24 GROUP2_0.nmos_priv2_0.D DN cp_cap_p VSS sg13_lv_nmos ad=0.11875p pd=1.005u as=0.11875p ps=1.005u w=0.625u l=0.5u
X25 VSS VSS VSS VSS sg13_lv_nmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X26 VDD GROUP1_0.G VSS rhigh l=0.27592m w=2u
X27 VDD GROUP5_0.G GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X28 GROUP1_0.G GROUP1_0.G VSS VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X29 cp_cap_p vout VSS rhigh l=28.76u w=2u
X30 VDD GROUP5_0.G GROUP5_0.G VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X31 GROUP4_0.pmos$1_priv1_0.S UP cp_cap_p VDD sg13_lv_pmos ad=0.11875p pd=1.005u as=0.2125p ps=1.93u w=0.625u l=0.5u
X32 cp_cap_p DN GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.2125p pd=1.93u as=0.11875p ps=1.005u w=0.625u l=0.5u
X33 GROUP2_0.nmos_priv2_0.D GROUP1_0.G VSS VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X34 GROUP2_0.nmos_priv2_0.D GROUP2_0.nmos_priv2_0.D GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.68p pd=4.68u as=6.6679p ps=37.8u w=2u l=0.5u
X35 VDD GROUP5_0.G GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X36 GROUP4_0.pmos$1_priv1_0.S GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X37 GROUP2_0.nmos_priv2_0.D GROUP2_0.nmos_priv2_0.D GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.2142p pd=1.94u as=0 ps=0 w=0.63u l=0.5u
X38 VSS GROUP1_0.G GROUP1_0.G VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X39 VDD GROUP5_0.G GROUP5_0.G VDD sg13_lv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X40 GROUP5_0.G GROUP5_0.G VDD VDD sg13_lv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X41 VSS GROUP1_0.G GROUP1_0.G VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X42 cp_cap_m VSS VSS rhigh l=1.40168m w=1u
X43 cp_cap_p UP GROUP4_0.pmos$1_priv1_0.S VDD sg13_lv_pmos ad=0.11875p pd=1.005u as=0.11875p ps=1.005u w=0.625u l=0.5u
X44 cp_cap_p cp_cap_p cp_cap_p VSS sg13_lv_nmos ad=0.2142p pd=1.94u as=0 ps=0 w=0.63u l=0.5u
X45 VSS GROUP1_0.G GROUP2_0.nmos_priv2_0.D VSS sg13_lv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
.ends

