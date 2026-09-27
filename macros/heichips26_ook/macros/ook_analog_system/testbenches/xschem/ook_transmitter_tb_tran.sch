v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -630 160 -610 {lab=CLK_REF}
N 160 -550 160 -520 {lab=GND}
N 160 -800 160 -780 {lab=VDD}
N 160 -720 160 -690 {lab=GND}
N 1170 -1030 1170 -1010 {lab=VDD}
N 1170 -860 1170 -830 {lab=GND}
N 1010 -900 1010 -870 {lab=GND}
N 1010 -900 1040 -900 {lab=GND}
N 1000 -920 1040 -920 {lab=VDD}
N 1270 -860 1270 -810 {lab=CLK_REF}
N 1290 -830 1320 -830 {lab=VDD}
N 1290 -860 1290 -830 {lab=VDD}
N 1330 -950 1350 -950 {lab=vout}
N 1080 -1050 1080 -1020 {lab=vcl}
N 1060 -1050 1080 -1050 {lab=vcl}
N 1050 -810 1080 -810 {lab=clk_fb}
N 1080 -860 1080 -810 {lab=clk_fb}
N 1040 -780 1100 -780 {lab=dac_out}
N 1100 -860 1100 -780 {lab=dac_out}
C {devices/code_shown.sym} 30 -1670 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param FREQ_REF=80e6
.param FREQ_FB=600e6
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-9 rshunt=1e12
.save vout clk_fb vcl
.tran 100p 150u 0 100p
"}
C {devices/launcher.sym} 2340 -1410 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 2340 -1350 0 0 {name=h3
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code_shown.sym} 900 -1740 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/ook_transmitter_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
"}
C {devices/vsource.sym} 160 -580 0 0 {name=VCLKREF value="PULSE(0 \{VDD\} 0 0.5n 0.5n \{0.5/FREQ_REF\} \{1/FREQ_REF\})"}
C {devices/lab_pin.sym} 160 -630 0 0 {name=lpclkref1 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 160 -520 0 0 {name=lgnd3 lab=GND}
C {devices/vsource.sym} 160 -750 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 160 -800 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 160 -690 0 0 {name=lgnd5 lab=GND}
C {vdd.sym} 1170 -1030 0 0 {name=lvddb2 lab=VDD}
C {devices/gnd.sym} 1170 -830 0 0 {name=lgnd1 lab=GND}
C {devices/gnd.sym} 1010 -870 0 0 {name=lgnd2 lab=GND}
C {vdd.sym} 1000 -920 3 0 {name=lvddb1 lab=VDD}
C {devices/lab_pin.sym} 1270 -810 3 0 {name=lpclkref2 sig_type=std_logic lab=CLK_REF}
C {vdd.sym} 1320 -830 1 0 {name=lvddb3 lab=VDD}
C {devices/lab_pin.sym} 1350 -950 2 0 {name=lpclkref3 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 1060 -1050 0 0 {name=lpclkref4 sig_type=std_logic lab=vcl}
C {devices/lab_pin.sym} 1050 -810 0 0 {name=lpclkref5 sig_type=std_logic lab=clk_fb}
C {devices/lab_pin.sym} 1040 -780 0 0 {name=lpclkref6 sig_type=std_logic lab=dac_out}
C {ook_transmitter.sym} 1420 -1430 0 0 {name=x2
spice_ignore=true}
C {ook_transmitter_pex.sym} 1180 -950 0 0 {name=x1
spice_ignore=false
}
