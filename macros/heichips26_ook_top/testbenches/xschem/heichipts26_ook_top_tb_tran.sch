v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 6 1540 -470 1540 -270 1880 -270 1880 -490 1540 -490 1540 -470 {}
T {Off Chip Accumulator} 1630 -260 0 0 0.4 0.4 {}
N 160 -630 160 -610 {lab=CLK_REF}
N 160 -550 160 -520 {lab=GND}
N 160 -800 160 -780 {lab=VDD}
N 160 -720 160 -690 {lab=GND}
N 900 -730 930 -730 {lab=vout_tx}
N 740 -1200 740 -1140 {lab=VDD}
N 160 -990 160 -970 {lab=VDDA}
N 160 -910 160 -880 {lab=GND}
N 760 -1160 760 -1140 {lab=VDDA}
N 1720 -470 1720 -430 {lab=vout_accum}
N 1660 -470 1660 -430 {lab=vout_accum}
N 1660 -470 1720 -470 {lab=vout_accum}
N 1660 -370 1660 -350 {lab=GND}
N 1660 -350 1720 -350 {lab=GND}
N 1720 -370 1720 -350 {lab=GND}
N 1720 -350 1720 -330 {lab=GND}
N 510 -1080 600 -1080 {lab=CLK_REF}
N 570 -480 600 -480 {lab=q3}
N 570 -460 600 -460 {lab=q2}
N 570 -440 600 -440 {lab=q1}
N 570 -420 600 -420 {lab=q0}
N 900 -750 930 -750 {lab=vout_accum}
N 570 -1060 600 -1060 {lab=#net1}
N 570 -1040 600 -1040 {lab=#net2}
N 570 -1020 600 -1020 {lab=#net3}
N 570 -1000 600 -1000 {lab=#net4}
N 570 -980 600 -980 {lab=#net5}
N 570 -960 600 -960 {lab=#net6}
N 570 -940 600 -940 {lab=#net7}
N 570 -920 600 -920 {lab=#net8}
N 570 -880 600 -880 {lab=#net9}
N 570 -860 600 -860 {lab=#net10}
N 570 -840 600 -840 {lab=#net11}
N 570 -820 600 -820 {lab=#net12}
N 570 -800 600 -800 {lab=#net13}
N 570 -780 600 -780 {lab=#net14}
N 570 -760 600 -760 {lab=#net15}
N 570 -740 600 -740 {lab=#net16}
N 570 -720 600 -720 {lab=#net17}
N 570 -700 600 -700 {lab=#net18}
N 570 -680 600 -680 {lab=#net19}
N 570 -660 600 -660 {lab=#net20}
N 570 -640 600 -640 {lab=#net21}
N 570 -620 600 -620 {lab=#net22}
N 570 -600 600 -600 {lab=#net23}
N 570 -580 600 -580 {lab=#net24}
N 570 -560 600 -560 {lab=#net25}
N 570 -540 600 -540 {lab=#net26}
N 570 -520 600 -520 {lab=#net27}
N 570 -500 600 -500 {lab=#net28}
N 510 -900 600 -900 {lab=data_in_tx}
N 370 -1090 400 -1090 {lab=#net29}
N 370 -1070 400 -1070 {lab=#net30}
N 370 -1050 400 -1050 {lab=#net31}
N 370 -1030 400 -1030 {lab=#net32}
N 370 -1010 400 -1010 {lab=#net33}
N 370 -990 400 -990 {lab=#net34}
N 370 -970 400 -970 {lab=#net35}
N 370 -950 400 -950 {lab=#net36}
N 750 -360 750 -320 {lab=GND}
N 900 -770 1050 -770 {lab=#net37}
N 170 -400 170 -380 {lab=data_in_tx}
N 170 -320 170 -290 {lab=GND}
N 500 -1130 500 -1100 {lab=n_rst}
N 500 -1100 600 -1100 {lab=n_rst}
N 1110 -770 1150 -770 {lab=vin_rx}
N 630 -1320 630 -1290 {lab=VDD}
N 630 -1230 630 -1190 {lab=GND}
N 1580 -290 1580 -260 {lab=GND}
N 1580 -470 1580 -430 {lab=vout_accum}
N 1580 -370 1580 -350 {lab=#net38}
N 1720 -470 1750 -470 {lab=vout_accum}
N 1580 -470 1660 -470 {lab=vout_accum}
N 430 -160 430 -120 {lab=GND}
N 430 -250 430 -220 {lab=n_rst}
C {devices/code_shown.sym} -1120 -1740 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD=1.5
.param FREQ_REF=80e6
.param tr=1e-9
.param tr_data=50e-9
.options klu reltol=1e-3 abstol=1e-12 vntol=1e-6 gmin=1e-12 itl1=200 itl4=100 rshunt=1e9 trtol=20
.param b0=1 b1=0 b2=1 b3=0 b4=0 b5=1 b6=0 b7=1
.param bitsum=\{b0+b1+b2+b3+b4+b5+b6+b7\}
.param parity=\{bitsum-2*int(bitsum/2)\}

* Stepped voltage ladder (amplitude, in volts): ~0/1mV/5mV/10mV, 0.1us each,
* then held at 10mV through the rest of the (unchanged) .tran span
Venv nenv 0 PWL(
+ 0 1e-12                     \{0.1e-6-tr\} 1e-12
+ 0.1e-6 1m                   \{0.2e-6-tr\} 1m
+ 0.2e-6 5m                   \{0.3e-6-tr\} 5m
+ 0.3e-6 10m                  \{1.5e-6-tr\} 10m
+ 1.5e-6 0                    150e-6 0 )

* Carrier folded into one B-source (one less node); nenv now carries the
* step amplitude directly in volts, no separate 1e-3 scale factor needed
Bvin1 vin_rx 0 V=\{(V(nenv)*sin(6.283185307*433.92e6*time))\}

.save vout_accum vin_rx rx_filt i(VDDSRC) i(VDDSRC1)
.save x1.heichips26_ook_soc_0.q0 x1.heichips26_ook_soc_0.q1 x1.heichips26_ook_soc_0.q2 x1.heichips26_ook_soc_0.q3
.save q0 q1 q2 q3
.save x1.heichips26_ook_soc_0.q0_int x1.heichips26_ook_soc_0.q0_diff
.save x1.heichips26_ook_soc_0.amp_s3_cap1 x1.heichips26_ook_soc_0.amp_s3_cap2
.save x1.heichips26_ook_soc_0.vref1 x1.heichips26_ook_soc_0.vref2 x1.heichips26_ook_soc_0.vref3 x1.heichips26_ook_soc_0.vref4
.save x1.heichips26_ook_soc_0.clk_fb x1.heichips26_ook_soc_0.vctrl_in x1.heichips26_ook_soc_0.vctrl_b_in
.save data_in_tx
.save x1.heichips26_ook_soc_0.vcl
.save vout_accum
.tran 100p 150u 0 100p
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
C {devices/vsource.sym} 160 -580 0 0 {name=VCLKREF value="PULSE(0 \{VDD\} 0 0.5n 0.5n \{0.5/FREQ_REF\} \{1/FREQ_REF\})"}
C {devices/lab_pin.sym} 160 -630 0 0 {name=lpclkref1 sig_type=std_logic lab=CLK_REF}
C {devices/gnd.sym} 160 -520 0 0 {name=lgnd3 lab=GND}
C {devices/vsource.sym} 160 -750 0 0 {name=VDDSRC value=\{VDD\}}
C {vdd.sym} 160 -800 0 0 {name=lvddb lab=VDD}
C {devices/gnd.sym} 160 -690 0 0 {name=lgnd5 lab=GND}
C {vdd.sym} 740 -1200 0 0 {name=lvddb2 lab=VDD}
C {devices/lab_pin.sym} 930 -730 2 0 {name=lpclkref7 sig_type=std_logic lab=vout_tx}
C {devices/vsource.sym} 160 -940 0 0 {name=VDDSRC1 value=\{3.3\}}
C {vdd.sym} 160 -990 0 0 {name=lvddb4 lab=VDDA
value=\{3.3\}}
C {devices/gnd.sym} 160 -880 0 0 {name=lgnd4 lab=GND
value=\{VDD/2\}}
C {vdd.sym} 760 -1160 0 0 {name=lvddb5 lab=VDDA
value=\{VDD/2\}}
C {devices/lab_pin.sym} 570 -480 0 0 {name=lpclkref8 sig_type=std_logic lab=q3}
C {devices/lab_pin.sym} 570 -460 0 0 {name=lpclkref9 sig_type=std_logic lab=q2}
C {devices/lab_pin.sym} 570 -440 0 0 {name=lpclkref10 sig_type=std_logic lab=q1}
C {devices/lab_pin.sym} 570 -420 0 0 {name=lpclkref11 sig_type=std_logic lab=q0}
C {capa.sym} 1660 -400 0 1 {name=Cb5
m=1
value=2.5p
footprint=1206
device="ceramic capacitor"
}
C {res.sym} 1720 -400 2 1 {name=R2
value=250k
int=1206
device=resistor
m=1}
C {devices/gnd.sym} 1720 -330 0 1 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1750 -470 2 0 {name=p7 sig_type=std_logic lab=vout_accum}
C {devices/lab_pin.sym} 1150 -770 0 1 {name=lpclkref2 sig_type=std_logic lab=vin_rx}
C {devices/lab_pin.sym} 930 -750 2 0 {name=p1 sig_type=std_logic lab=vout_accum}
C {noconn.sym} 570 -500 0 0 {name=l1}
C {noconn.sym} 570 -520 0 0 {name=l3}
C {noconn.sym} 570 -540 0 0 {name=l5}
C {noconn.sym} 570 -560 0 0 {name=l6}
C {noconn.sym} 570 -580 0 0 {name=l7}
C {noconn.sym} 570 -600 0 0 {name=l8}
C {noconn.sym} 570 -620 0 0 {name=l9}
C {noconn.sym} 570 -640 0 0 {name=l10}
C {noconn.sym} 570 -660 0 0 {name=l11}
C {noconn.sym} 570 -680 0 0 {name=l12}
C {noconn.sym} 570 -700 0 0 {name=l13}
C {noconn.sym} 570 -720 0 0 {name=l14}
C {noconn.sym} 570 -740 0 0 {name=l15}
C {noconn.sym} 570 -760 0 0 {name=l16}
C {noconn.sym} 570 -780 0 0 {name=l17}
C {noconn.sym} 570 -800 0 0 {name=l18}
C {noconn.sym} 570 -820 0 0 {name=l19}
C {noconn.sym} 570 -840 0 0 {name=l20}
C {noconn.sym} 570 -860 0 0 {name=l21}
C {noconn.sym} 570 -880 0 0 {name=l22}
C {noconn.sym} 570 -920 0 0 {name=l24}
C {noconn.sym} 570 -940 0 0 {name=l25}
C {noconn.sym} 570 -960 0 0 {name=l26}
C {noconn.sym} 570 -980 0 0 {name=l27}
C {noconn.sym} 570 -1000 0 0 {name=l28}
C {noconn.sym} 570 -1020 0 0 {name=l29}
C {noconn.sym} 570 -1040 0 0 {name=l30}
C {noconn.sym} 570 -1060 0 0 {name=l31}
C {devices/lab_pin.sym} 510 -900 0 0 {name=lpdatatx sig_type=std_logic lab=data_in_tx}
C {devices/lab_pin.sym} 170 -400 0 0 {name=lpdatatx2 sig_type=std_logic lab=data_in_tx}
C {devices/vsource.sym} 430 -190 0 0 {name=Vrst value="PULSE(0 \{VDD\} 125e-9 \{tr\} \{tr\} 200e-6 10)"}
C {devices/vsource.sym} 170 -350 0 0 {name=Vdatatx value="PULSE(0 \{VDD\} 0.5e-6 \{tr\} \{tr\} 0.5e-6 10)"}
C {devices/gnd.sym} 170 -290 0 0 {name=lgnddatatx lab=GND}
C {noconn.sym} 370 -950 0 0 {name=l34}
C {noconn.sym} 370 -970 0 0 {name=l35}
C {noconn.sym} 370 -990 0 0 {name=l36}
C {noconn.sym} 370 -1010 0 0 {name=l37}
C {noconn.sym} 370 -1030 0 0 {name=l38}
C {noconn.sym} 370 -1050 0 0 {name=l39}
C {noconn.sym} 370 -1070 0 0 {name=l40}
C {noconn.sym} 370 -1090 0 0 {name=l41}
C {devices/gnd.sym} 750 -320 0 0 {name=lgnd1 lab=GND}
C {heichips26_ook_top_pex.sym} 760 -750 0 0 {name=x1}
C {capa.sym} 1080 -770 1 0 {name=C4
m=1
value=10.0p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 510 -1080 3 0 {name=lpclkref3 sig_type=std_logic lab=CLK_REF}
C {capa.sym} 630 -1260 0 0 {name=C5
m=1
value=10.0p
footprint=1206
device="ceramic capacitor"}
C {vdd.sym} 630 -1320 0 0 {name=lvddb7 lab=VDD}
C {devices/gnd.sym} 630 -1190 0 0 {name=lgnd2 lab=GND
value=\{VDD/2\}}
C {devices/gnd.sym} 1580 -260 0 0 {name=lgnd8 lab=GND}
C {capa.sym} 1580 -400 0 0 {name=C6
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 1580 -320 0 0 {name=L32
m=1
value=1u
footprint=1206
device=inductor}
C {devices/lab_pin.sym} 430 -250 0 0 {name=lpdatatx1 sig_type=std_logic lab=n_rst
}
C {devices/gnd.sym} 430 -120 0 0 {name=lgnddatatx1 lab=GND}
C {devices/lab_pin.sym} 500 -1130 0 0 {name=lpdatatx3 sig_type=std_logic lab=n_rst
}
