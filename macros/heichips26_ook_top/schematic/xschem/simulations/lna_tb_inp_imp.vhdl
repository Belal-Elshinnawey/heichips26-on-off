-- sch_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/testbenches/xschem/lna_tb_inp_imp.sch
entity lna_tb_inp_imp is
end lna_tb_inp_imp ;

architecture arch_lna_tb_inp_imp of lna_tb_inp_imp is

component lna_pex 
port (
  VDD : inout std_logic ;
  vout : inout std_logic ;
  vin : in std_logic ;
  VSS : inout std_logic
);
end component ;

component sg13cmos5l_IOPadAnalog 
port (
  vss : inout std_logic ;
  vdd : inout std_logic ;
  iovss : inout std_logic ;
  iovdd : inout std_logic ;
  pad : inout std_logic ;
  padres : inout std_logic
);
end component ;


signal vout : std_logic ;
signal VDD : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
signal GND : std_logic ;
signal i_in : std_logic ;
begin
VDD1 : vsource
generic map (
   value => {VDD}
)
port map (
   p => VDD ,
   m => GND
);

I0 : isource
generic map (
   value => dc 0 ac 1
)
port map (
   p => GND ,
   m => i_in
);

x1 : lna_pex
port map (
   VDD => VDD ,
   vout => vout ,
   vin => net2 ,
   VSS => GND
);

x2 : sg13cmos5l_IOPadAnalog
port map (
   vss => GND ,
   vdd => VDD ,
   iovss => GND ,
   iovdd => VDD ,
   pad => net1 ,
   padres => net2
);

L12 : ind
generic map (
   m => 1 ,
   value => 1.345e-10 ,
   footprint => 1206 ,
   device => inductor
)
port map (
   p => net3 ,
   m => GND
);

L6 : ind
generic map (
   m => 1 ,
   value => 1.3895e-07 ,
   footprint => 1206 ,
   device => inductor
)
port map (
   p => net3 ,
   m => GND
);

RBIAS : res
generic map (
   value => 10000000 ,
   footprint => 1206 ,
   device => resistor ,
   m => 1
)
port map (
   P => i_in ,
   M => GND
);

L14 : ind
generic map (
   m => 1 ,
   value => 1.756e-08 ,
   footprint => 1206 ,
   device => inductor
)
port map (
   p => net4 ,
   m => GND
);


.param VDD=3.3
.param temp=27
.options savecurrents klu reltol=1e-4 abstol=1e-15 gmin=1e-15 rshunt=1e9

.control
let Rs = 50
let f_ism = 433.92e6

save all
op
print all
write @schname\\.raw
set appendwrite

ac lin 401 200e6 600e6

let Zin      = v(i_in)
let Zin_mag  = mag(Zin)
let Zin_re   = real(Zin)
let Zin_im   = imag(Zin)
let Zin_ph   = 180/PI*cphase(Zin)

let Zpin     = v(net1)
let Zpin_mag = mag(Zpin)
let Zpin_re  = real(Zpin)
let Zpin_im  = imag(Zpin)

let Gam    = (Zin - Rs)/(Zin + Rs)
let Gmag   = mag(Gam)
let S11_dB = db(Gmag)
let ML_dB  = -10*log10(1 - Gmag*Gmag)

remzerovec
write @schname\\.raw
unset appendwrite

meas ac Zmag_ism find Zin_mag  when frequency=$&f_ism
meas ac Zre_ism  find Zin_re   when frequency=$&f_ism
meas ac Zim_ism  find Zin_im   when frequency=$&f_ism
meas ac Zph_ism  find Zin_ph   when frequency=$&f_ism

meas ac Zpre_ism find Zpin_re  when frequency=$&f_ism
meas ac Zpim_ism find Zpin_im  when frequency=$&f_ism

meas ac S11_ism  find S11_dB   when frequency=$&f_ism
meas ac ML_ism   find ML_dB    when frequency=$&f_ism

echo
echo   Zin  magnitude = $&Zmag_ism ohm
echo   Zin  real      = $&Zre_ism ohm
echo   Zin  imag      = $&Zim_ism ohm
echo   Zin  phase     = $&Zph_ism deg
echo
echo   Zpin real      = $&Zpre_ism ohm
echo   Zpin imag      = $&Zpim_ism ohm
echo
echo   S11            = $&S11_ism dB
echo   mismatch loss  = $&ML_ism dB
echo

plot Zin_re Zin_im xlimit 200e6 600e6 ylabel 'Zin real / imag [ohm]' xlabel 'Frequency [Hz]'

.endc

.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.include /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/netlist/pex/lna_magic_pex_3.spice
.include /home/belal/HeiChips/heichips26-on-off/IHP-Open-PDK/ihp-sg13cmos5l/libs.ref/sg13cmos5l_io/spice/sg13cmos5l_io.spi

end arch_lna_tb_inp_imp ;

