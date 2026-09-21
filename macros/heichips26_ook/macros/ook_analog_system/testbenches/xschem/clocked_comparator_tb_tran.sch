v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 990 -750 990 -720 {lab=clk}
N 920 -790 950 -790 {lab=vref}
N 1030 -830 1060 -830 {lab=VDDL}
N 990 -880 990 -850 {lab=VDD}
N 920 -810 950 -810 {lab=vin}
N 1070 -800 1100 -800 {lab=vout}
N 1030 -770 1060 -770 {lab=VSS}
N 610 -700 610 -680 {lab=clk}
N 610 -620 610 -600 {lab=VSS}
N 700 -1050 700 -1030 {lab=VDD}
N 700 -970 700 -950 {lab=VSS}
N 500 -1050 500 -1030 {lab=VDDL}
N 500 -970 500 -950 {lab=VSS}
N 500 -850 500 -830 {lab=vref}
N 500 -770 500 -750 {lab=VSS}
N 300 -850 300 -830 {lab=vin}
N 300 -770 300 -750 {lab=VSS}
C {clocked_comparator_pex.sym} 1000 -800 0 0 {name=x1}
C {vdd.sym} 990 -880 0 0 {name=lvdd lab=VDD}
C {vdd.sym} 1060 -830 0 0 {name=lvddl lab=VDDL}
C {devices/gnd.sym} 1060 -770 0 0 {name=lvss lab=VSS}
C {devices/lab_pin.sym} 990 -720 0 0 {name=pclk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 920 -790 0 0 {name=pvref sig_type=std_logic lab=vref}
C {devices/lab_pin.sym} 920 -810 0 0 {name=pvin sig_type=std_logic lab=vin}
C {devices/iopin.sym} 1100 -800 0 0 {name=pvout lab=vout}
C {devices/vsource.sym} 610 -650 0 0 {name=VCLK value="PULSE(0 \{VDD\} 0 0.5n 0.5n 49n 100n)"}
C {devices/gnd.sym} 610 -600 0 0 {name=lclkgnd lab=VSS}
C {devices/vsource.sym} 700 -1000 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 700 -1050 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 700 -950 0 0 {name=lvddgnd lab=VSS}
C {devices/vsource.sym} 500 -1000 0 0 {name=VDDLSRC value=\{VDD/2\}}
C {vdd.sym} 500 -1050 0 0 {name=lvddlb lab=VDDL}
C {devices/gnd.sym} 500 -950 0 0 {name=lvddlgnd lab=VSS}
C {devices/vsource.sym} 500 -800 0 0 {name=VREF value=\{VREF\}}
C {devices/gnd.sym} 500 -750 0 0 {name=lvrefgnd lab=VSS}
C {devices/vsource.sym} 300 -800 0 0 {name=VIN value="PWL(0 0 10u \{VDD\})"}
C {devices/gnd.sym} 300 -750 0 0 {name=lvingnd lab=VSS}
C {devices/code_shown.sym} 100 -400 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=3.3
.param VREF=1.3
.options savecurrents klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12
.control
save clk vref vin vout VDD VDDL
tran 10n 10u
write @schname\\\\\\\\.raw
meas tran vout_hi MAX v(vout)
meas tran vout_lo MIN v(vout)
meas tran cross_delay TRIG v(vin) VAL=\{VREF\} RISE=1 TARG v(vout) VAL=\{VDD/2\} CROSS=1
print vout_hi
print vout_lo
print cross_delay
plot vin vref vout
plot clk
.endc"}
C {devices/code_shown.sym} 100 -600 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/clocked_comparator_magic_pex_3.spice
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
C {devices/lab_pin.sym} 300 -850 0 0 {name=pvin1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 500 -850 0 0 {name=pvref1 sig_type=std_logic lab=vref}
C {devices/lab_pin.sym} 610 -700 0 0 {name=pclk1 sig_type=std_logic lab=clk}
