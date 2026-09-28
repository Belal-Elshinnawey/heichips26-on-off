* NGSPICE file created from peak_detector.ext - technology: ihp-sg13cmos5l

.subckt peak_detector VSS vin VDD vout vamp
X0 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=10.323p ps=64.26u w=2u l=0.5u
X1 vamp vamp vout VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X2 vamp GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X3 vamp GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X4 GROUP3_0.G GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X5 vout vamp vamp VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X6 vamp vamp vamp VDD sg13_hv_pmos ad=0.68p pd=4.68u as=42.3931p ps=0.28617m w=2u l=0.5u
X7 vamp VSS VSS rhigh l=3u w=2u
X8 VDD GROUP3_0.G vamp VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X9 vout vamp vamp VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X10 vamp vamp vout VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X11 VDD GROUP3_0.G vamp VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X12 vamp GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X13 VDD GROUP3_0.G GROUP3_0.G VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X14 GROUP3_0.G GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X15 vamp vamp vout VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X16 VDD GROUP3_0.G vamp VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X17 VDD GROUP3_0.G vamp VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X18 VDD GROUP3_0.G GROUP3_0.G VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X19 VDD GROUP3_0.G GROUP3_0.G VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X20 GROUP3_0.G VSS VSS rhigh l=10u w=2u
X21 vout vamp vamp VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X22 GROUP3_0.G GROUP3_0.G GROUP3_0.G VDD sg13_hv_pmos ad=0.68p pd=4.68u as=33.483p ps=0.1089m w=2u l=0.5u
X23 vamp vamp vout VSS sg13_hv_nmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X24 VDD VDD VDD VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0 ps=0 w=2u l=0.5u
X25 VDD GROUP3_0.G GROUP3_0.G VDD sg13_hv_pmos ad=0.68p pd=4.68u as=0.38p ps=2.38u w=2u l=0.5u
X26 vout vamp vamp VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.68p ps=4.68u w=2u l=0.5u
X27 vamp vamp vout VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X28 vout vamp vamp VSS sg13_hv_nmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
X29 GROUP3_0.G GROUP3_0.G VDD VDD sg13_hv_pmos ad=0.38p pd=2.38u as=0.38p ps=2.38u w=2u l=0.5u
.ends

