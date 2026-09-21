v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 230 -950 280 -950 {lab=vin}
N 460 -930 510 -930 {lab=#net1}
N 510 -930 510 -860 {lab=#net1}
N 190 -930 190 -860 {lab=#net1}
N 190 -930 280 -930 {lab=#net1}
N 190 -860 510 -860 {lab=#net1}
N 260 -910 280 -910 {lab=VDD}
N 460 -950 670 -950 {lab=#net2}
N 850 -930 900 -930 {lab=#net3}
N 900 -930 900 -860 {lab=#net3}
N 580 -930 580 -860 {lab=#net3}
N 580 -930 670 -930 {lab=#net3}
N 580 -860 900 -860 {lab=#net3}
N 650 -910 670 -910 {lab=VDD}
N 850 -950 1020 -950 {lab=#net4}
N 1200 -930 1250 -930 {lab=#net5}
N 1250 -930 1250 -860 {lab=#net5}
N 930 -930 930 -860 {lab=#net5}
N 930 -930 1020 -930 {lab=#net5}
N 930 -860 1250 -860 {lab=#net5}
N 1000 -910 1020 -910 {lab=VDD}
N 1560 -950 1780 -950 {lab=vout}
N 1560 -930 1610 -930 {lab=#net6}
N 1610 -930 1610 -860 {lab=#net6}
N 1290 -930 1290 -860 {lab=#net6}
N 1290 -930 1380 -930 {lab=#net6}
N 1290 -860 1610 -860 {lab=#net6}
N 1360 -910 1380 -910 {lab=VDD}
N 1200 -950 1380 -950 {lab=#net7}
C {title-3.sym} 0 0 0 0 {name=l1 author="Belal ELshinnawey" rev=1.0 lock=true}
C {ipin.sym} 230 -950 0 0 {name=p3 lab=vin}
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 370 -930 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {devices/lab_pin.sym} 260 -910 0 0 {name=lp9 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 140 -980 3 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 140 -810 1 0 {name=p5 lab=VSS}
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 760 -930 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {devices/lab_pin.sym} 650 -910 0 0 {name=lp1 sig_type=std_logic lab=VDD}
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 1110 -930 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {devices/lab_pin.sym} 1000 -910 0 0 {name=lp2 sig_type=std_logic lab=VDD}
C {devices/opin.sym} 1770 -950 0 0 {name=p4 lab=vout}
C {sg13cmos5l_stdcells/sg13cmos5l_dfrbp_1.sym} 1470 -930 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13cmos5l_ }
C {devices/lab_pin.sym} 1360 -910 0 0 {name=lp3 sig_type=std_logic lab=VDD}
