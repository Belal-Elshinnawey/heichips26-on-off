v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 90 -200 90 -180 {lab=VDD}
N 90 -120 90 -90 {lab=GND}
N 90 -390 90 -370 {lab=VDDA}
N 90 -310 90 -280 {lab=GND}
N 980 -1190 1020 -1190 {lab=vout}
N 500 -780 500 -740 {lab=vsrc}
N 740 -780 740 -740 {lab=vsrc}
N 740 -680 740 -640 {lab=vin}
N 500 -780 740 -780 {lab=vsrc}
N 1020 -1100 1020 -1060 {lab=GND}
N 1020 -1190 1020 -1160 {lab=vout}
N 1130 -1320 1130 -1270 {lab=v2n}
N 1130 -1320 1370 -1320 {lab=v2n}
N 1370 -1320 1370 -1270 {lab=v2n}
N 1360 -1160 1370 -1160 {lab=vout}
N 1370 -1210 1370 -1160 {lab=vout}
N 1550 -840 1610 -840 {lab=vin}
N 1670 -840 1700 -840 {lab=#net1}
N 1880 -840 1880 -780 {lab=#net2}
N 1810 -840 1880 -840 {lab=#net2}
N 1810 -840 1810 -780 {lab=#net2}
N 1760 -840 1810 -840 {lab=#net2}
N 1810 -720 1810 -680 {lab=GND}
N 1880 -720 1880 -680 {lab=GND}
N 2070 -840 2130 -840 {lab=vout}
N 1880 -840 1920 -840 {lab=#net2}
N 1980 -840 2010 -840 {lab=#net3}
C {devices/code_shown.sym} 20 -1720 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param tr=1e-9
.param tr_data=50e-9
.param v1ac=1
.param v2ac=0
.param rload_val=50
.param rsrc2_val=50
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12 itl1=200 itl4=100 rshunt=1e9 trtol=20
.save all
.control
alterparam v1ac=1
alterparam v2ac=0
alterparam rload_val=50
alterparam rsrc2_val=1e9
reset
ac lin 1001 100meg 1000meg
let Zin = v(vin)*50/(v(vsrc)-v(vin))
let S21_dB = db(2*v(vout)/v(vsrc))
let Zin_re = real(Zin)
let Zin_im = imag(Zin)
plot Zin_re Zin_im xlabel 'Frequency [Hz]' ylabel 'Zin [ohm]'
meas ac Zin_re_c find Zin_re when frequency=433.92e6
meas ac Zin_im_c find Zin_im when frequency=433.92e6
plot S21_dB xlabel 'Frequency [Hz]' ylabel 'S21 [dB]'
meas ac S21_center find S21_dB when frequency=433.92e6
echo
echo S21 at 433.92MHz = $&S21_center dB
echo Zin  at 433.92MHz = $&Zin_re_c + j$&Zin_im_c ohm

alterparam v1ac=0
alterparam v2ac=1
alterparam rload_val=1e9
alterparam rsrc2_val=50
reset
ac lin 1001 100meg 1000meg
let Zout = v(vout)*50/(v(v2n)-v(vout))
let Zout_re = real(Zout)
let Zout_im = imag(Zout)
plot Zout_re Zout_im xlabel 'Frequency [Hz]' ylabel 'Zout [ohm]'
meas ac Zout_re_c find Zout_re when frequency=433.92e6
meas ac Zout_im_c find Zout_im when frequency=433.92e6
echo
echo Zout at 433.92MHz = $&Zout_re_c + j$&Zout_im_c ohm
.endc
"}
C {devices/launcher.sym} 2300 -1410 0 0 {name=h2
descr="Simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {title-3.sym} 0 0 0 0 {name=l2 author="Belal Elshinnawey" rev=1.0 lock=true}
C {devices/launcher.sym} 2300 -1350 0 0 {name=h3
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
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/dac/netlist/xspice/dac.xspice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/ook_transmitter_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/ook_analog_system_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.tech/ngspice/models/cap_mfringe.lib
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/vco_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/output_buffer_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/netlist/pex/heichips26_ook_top_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.ref/sg13cmos5l_io/spice/sg13cmos5l_io.spi
"}
C {devices/vsource.sym} 90 -150 0 0 {name=VDDSRC value=\{1.5\}}
C {vdd.sym} 90 -200 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 90 -90 0 0 {name=lgnd5 lab=GND}
C {devices/vsource.sym} 90 -340 0 0 {name=VDDSRC1 value=\{3.3\}}
C {vdd.sym} 90 -390 0 0 {name=lvddb4 lab=VDDA
value=\{3.3\}}
C {devices/gnd.sym} 90 -280 0 0 {name=lgnd4 lab=GND
value=\{VDD/2\}}
C {devices/lab_pin.sym} 1020 -1190 0 1 {name=l5 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 1550 -840 2 1 {name=l6 sig_type=std_logic lab=vin}
C {devices/vsource.sym} 500 -710 0 0 {name=V1 value="DC 0 AC \{v1ac\} SIN(0 1 433.9e6)"}
C {devices/lab_pin.sym} 500 -780 0 0 {name=lvsrc sig_type=std_logic lab=vsrc}
C {devices/gnd.sym} 500 -680 0 0 {name=lgndv1 lab=GND}
C {res.sym} 740 -710 0 0 {name=R_SRC
value=50
int=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 740 -640 0 0 {name=lrsrc2 sig_type=std_logic lab=vin}
C {res.sym} 1020 -1130 0 0 {name=R_LOAD
value=\{rload_val\}
int=1206
device=resistor
m=1}
C {devices/gnd.sym} 1020 -1060 0 0 {name=lgndrload lab=GND}
C {devices/vsource.sym} 1130 -1240 0 0 {name=V2 value="DC 0 AC \{v2ac\} SIN(0 1 433.9e6)"}
C {devices/lab_pin.sym} 1130 -1320 0 0 {name=lv2n sig_type=std_logic lab=v2n}
C {devices/gnd.sym} 1130 -1210 0 0 {name=lgndv2 lab=GND}
C {res.sym} 1370 -1240 0 0 {name=R_SRC2
value=\{rsrc2_val\}
int=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 1360 -1160 0 0 {name=lrsrc2b sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 2130 -840 0 1 {name=l3 sig_type=std_logic lab=vout}
C {capa.sym} 1730 -840 3 1 {name=C3
m=1
value=0.75p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1640 -840 3 1 {name=L8
m=1
value=178n
footprint=1206
device=inductor}
C {capa.sym} 1810 -750 0 1 {name=C6
m=1
value=106p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1880 -750 0 1 {name=L10
m=1
value=1.26n
footprint=1206
device=inductor}
C {devices/gnd.sym} 1810 -680 0 0 {name=lgndrload5 lab=GND}
C {devices/gnd.sym} 1880 -680 0 0 {name=lgndrload6 lab=GND}
C {capa.sym} 2040 -840 3 1 {name=C1
m=1
value=0.75p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1950 -840 3 1 {name=L1
m=1
value=178n
footprint=1206
device=inductor}
