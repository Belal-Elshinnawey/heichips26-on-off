v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1130 -800 1220 -800 {lab=#net1}
N 1010 -890 1010 -860 {lab=VDD}
N 1010 -740 1010 -710 {lab=GND}
N 860 -780 890 -780 {lab=VCL}
N 700 -1050 700 -1030 {lab=VDD}
N 700 -970 700 -950 {lab=GND}
N 700 -830 700 -810 {lab=VCL}
N 700 -750 700 -730 {lab=GND}
N 1330 -770 1420 -770 {lab=vout}
N 1270 -860 1270 -820 {lab=VDD}
N 1160 -740 1160 -720 {lab=GND}
N 1160 -740 1220 -740 {lab=GND}
N 1160 -770 1220 -770 {lab=VDD}
N 1300 -740 1300 -710 {lab=GND}
C {vco_pex.sym} 1000 -800 0 0 {name=x1}
C {devices/iopin.sym} 1420 -770 0 0 {name=pvout lab=vout}
C {vdd.sym} 1010 -890 0 0 {name=lvdd lab=VDD}
C {devices/lab_pin.sym} 860 -780 0 0 {name=pvcl sig_type=std_logic lab=VCL}
C {devices/vsource.sym} 700 -1000 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 700 -1050 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 700 -950 0 0 {name=lvddgnd lab=GND}
C {devices/vsource.sym} 700 -780 0 0 {name=VCLSRC value="PWL(0 0.4
+ 99n 0.4 100n 0.5
+ 199n 0.5 200n 0.6
+ 299n 0.6 300n 0.7
+ 399n 0.7 400n 0.8
+ 499n 0.8 500n 0.9
+ 599n 0.9 600n 1.0
+ 699n 1.0 700n 1.1
+ 799n 1.1 800n 1.2
+ 899n 1.2 900n 1.3
+ 999n 1.3 1000n 1.4
+ 1099n 1.4 1100n 1.5
+ 1200n 1.5)"}
C {devices/code_shown.sym} 100 -400 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12
.save vout VCL
.tran 10p 1.2u 0 uic
"}
C {devices/code_shown.sym} 100 -600 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice

"}
C {devices/launcher.sym} 1300 -1000 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 1300 -940 0 0 {name=h1
descr="Load waves"
tclcommand="xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/lab_pin.sym} 700 -830 0 0 {name=pvcl1 sig_type=std_logic lab=VCL}
C {devices/gnd.sym} 700 -730 0 0 {name=lvddgnd1 lab=GND}
C {devices/gnd.sym} 1010 -710 0 0 {name=lvddgnd2 lab=GND}
C {output_buffer_pex.sym} 1270 -650 0 0 {name=x2}
C {vdd.sym} 1270 -860 0 0 {name=lvdd1 lab=VDD}
C {devices/gnd.sym} 1160 -720 0 0 {name=lvddgnd3 lab=GND}
C {vdd.sym} 1160 -770 3 0 {name=lvdd2 lab=VDD}
C {devices/gnd.sym} 1300 -710 0 0 {name=lvddgnd4 lab=GND}
