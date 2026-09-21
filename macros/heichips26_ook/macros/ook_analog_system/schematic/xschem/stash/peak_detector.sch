v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 850 -1100 880 -1100 {lab=#net1}
N 790 -1270 920 -1270 {lab=VDD}
N 790 -880 790 -820 {lab=VSS}
N 790 -960 850 -960 {lab=#net1}
N 850 -1100 850 -960 {lab=#net1}
N 830 -1100 850 -1100 {lab=#net1}
N 790 -1300 790 -1270 {lab=VDD}
N 920 -1190 970 -1190 {lab=VDD}
N 880 -1160 920 -1160 {lab=VDD}
N 880 -1220 880 -1160 {lab=VDD}
N 880 -1220 920 -1220 {lab=VDD}
N 740 -1190 790 -1190 {lab=VDD}
N 790 -1160 830 -1160 {lab=VDD}
N 830 -1220 830 -1160 {lab=VDD}
N 790 -1220 830 -1220 {lab=VDD}
N 790 -1160 790 -1130 {lab=VDD}
N 920 -1160 920 -1130 {lab=VDD}
N 920 -1020 970 -1020 {lab=VDD}
N 880 -990 920 -990 {lab=vamp}
N 880 -1050 880 -990 {lab=vamp}
N 880 -1050 920 -1050 {lab=vamp}
N 920 -1070 920 -1050 {lab=vamp}
N 740 -1020 790 -1020 {lab=VDD}
N 790 -990 830 -990 {lab=#net1}
N 830 -1050 830 -990 {lab=#net1}
N 790 -1050 830 -1050 {lab=#net1}
N 790 -990 790 -960 {lab=#net1}
N 790 -1070 790 -1050 {lab=#net1}
N 790 -1270 790 -1220 {lab=VDD}
N 920 -1270 920 -1220 {lab=VDD}
N 740 -1100 790 -1100 {lab=VDD}
N 920 -1100 970 -1100 {lab=VDD
spice_ignore=short}
N 790 -960 790 -940 {lab=#net1}
N 920 -860 920 -840 {lab=VSS}
N 920 -950 920 -920 {lab=vamp}
N 1090 -930 1090 -900 {lab=vamp}
N 920 -950 1090 -950 {lab=vamp}
N 920 -990 920 -950 {lab=vamp}
N 1070 -930 1090 -930 {lab=vamp}
N 1090 -950 1090 -930 {lab=vamp}
N 1090 -840 1090 -810 {lab=vin}
N 1360 -950 1370 -950 {lab=vamp}
N 1400 -910 1440 -910 {lab=vout}
N 1440 -950 1440 -910 {lab=vout}
N 1430 -950 1440 -950 {lab=vout}
N 1400 -970 1400 -950 {lab=vamp}
N 1360 -970 1400 -970 {lab=vamp}
N 1360 -970 1360 -950 {lab=vamp}
N 1090 -950 1360 -950 {lab=vamp}
N 1440 -950 1570 -950 {lab=vout}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {devices/ipin.sym} 1090 -810 3 0 {name=p2 lab=vin}
C {devices/iopin.sym} 1570 -950 0 0 {name=p7 lab=vout}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1100 0 1 {name=M24
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1100 0 0 {name=M25
l=0.5u
w=14u
ng=7
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {rhigh_ps.sym} 790 -910 0 1 {name=R5
w=2e-6
l=10e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1190 0 0 {name=M13
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1190 0 1 {name=M26
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 900 -1020 0 0 {name=M27
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 810 -1020 0 1 {name=M28
l=0.5u
w=2u
ng=1
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 920 -970 2 0 {name=p9 sig_type=std_logic lab=vamp}
C {rhigh_ps.sym} 920 -890 0 1 {name=R3
w=2e-6
l=6e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
ps=0.18e-6
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {devices/lab_pin.sym} 740 -1190 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 790 -1300 3 0 {name=p3 lab=VDD}
C {devices/lab_pin.sym} 750 -1100 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -1020 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 970 -1190 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 970 -1100 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 970 -1020 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 790 -820 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 920 -840 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {sg13cmos5l_pr/cap_mfringe.sym} 1090 -870 2 0 {name=C2
model=cap_mfringe
w=40.0u
l=8.0u
mmin=1
mmax=4
spiceprefix=X
spice_ignore=false}
C {devices/iopin.sym} 1070 -930 2 0 {name=p13 lab=vamp}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1400 -930 3 0 {name=M2
l=0.5u
w=20u
 ng=10
 m=1
  mm_ok=1
 model=sg13_hv_pmos
spiceprefix=X
}
C {devices/iopin.sym} 1050 -1310 3 0 {name=p1 lab=VSS}
