v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1130 -800 1160 -800 {lab=vout}
N 1010 -860 1010 -890 {lab=VDD}
N 1010 -740 1010 -710 {lab=VSS}
N 890 -780 860 -780 {lab=VCL}
N 700 -1030 700 -1050 {lab=VDD}
N 700 -970 700 -950 {lab=VSS}
N 700 -810 700 -830 {lab=VCL}
N 700 -750 700 -730 {lab=VSS}
C {vco_pex.sym} 1000 -800 0 0 {name=x1}
C {devices/iopin.sym} 1160 -800 0 0 {name=pvout lab=vout}
C {vdd.sym} 1010 -890 0 0 {name=lvdd lab=VDD}
C {devices/gnd.sym} 1010 -710 0 0 {name=lvss lab=VSS}
C {devices/lab_pin.sym} 860 -780 0 0 {name=pvcl sig_type=std_logic lab=VCL}
C {devices/vsource.sym} 700 -1000 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 700 -1050 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 700 -950 0 0 {name=lvddgnd lab=VSS}
C {devices/vsource.sym} 700 -780 0 0 {name=VCLSRC value=0.6}
C {devices/gnd.sym} 700 -730 0 0 {name=lvclgnd lab=VSS}
C {devices/code_shown.sym} 100 -400 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=3.3
.options savecurrents klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12
.control
save vout VCL
tran 10p 200n 0
write @schname\\\\\\\\.raw
meas tran t_r1 WHEN v(vout)=\{VDD/2\} RISE=2
meas tran t_r2 WHEN v(vout)=\{VDD/2\} RISE=3
let period = t_r2 - t_r1
let freq = 1/period
let freq_mhz = freq/1e6
print period
print freq
print freq_mhz
plot vout
.endc"}
C {devices/code_shown.sym} 100 -600 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
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
