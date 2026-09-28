// sch_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/schematic/xschem/ook_analog_system.sch
module ook_analog_system
(
  inout wire tx_out,
  inout wire VPWR,
  inout wire VGND,
  inout wire vcl,
  inout wire dac_out,
  inout wire clk_fb,
  inout wire clk_ref,
  inout wire rst_ni,
  inout wire vctrl_in,
  inout wire vctrl_b_in,
  inout wire vctrl_out,
  inout wire vctrl_b_out,
  inout wire q0,
  inout wire q1,
  inout wire q2,
  inout wire q3,
  inout wire ACC_CAP,
  inout wire rx_in,
  inout wire VAPWR,
  inout wire Cap_M2,
  inout wire Cap_M1,
  inout wire Cap_M21,
  inout wire Cap_M11,
  inout wire vref0,
  inout wire vref1,
  inout wire vref3,
  inout wire vref2,
  inout wire opm,
  inout wire lnaf
);
wire net10 ;
wire net11 ;
wire net12 ;
wire net13 ;
wire net14 ;
wire net15 ;
wire net16 ;
wire net17 ;
wire net18 ;
wire net19 ;
wire net20 ;
wire net21 ;
wire net22 ;
wire net23 ;
wire net24 ;
wire net25 ;
wire net26 ;
wire net27 ;
wire net28 ;
wire net29 ;
wire net30 ;
wire net31 ;
wire net32 ;
wire net33 ;
wire net34 ;
wire net35 ;
wire net36 ;
wire net37 ;
wire net38 ;
wire net39 ;
wire net40 ;
wire net41 ;
wire net42 ;
wire net43 ;
wire net44 ;
wire net45 ;
wire net46 ;
wire net47 ;
wire net48 ;
wire net49 ;
wire net50 ;
wire net51 ;
wire net52 ;
wire net53 ;
wire net54 ;
wire net55 ;
wire net56 ;
wire net57 ;
wire net58 ;
wire net59 ;
wire net60 ;
wire net61 ;
wire vctrl_a ;
wire a_rst_n ;
wire clk_ref_a ;
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;
wire net5 ;
wire net6 ;
wire net7 ;
wire net8 ;
wire net9 ;
wire vctrl_b_a ;

ook_analog_system
x3 ( 
 .VAPWR( VAPWR ),
 .vcl( net1 ),
 .VPWR( VPWR ),
 .q3( q3 ),
 .q2( q2 ),
 .tx_out( net2 ),
 .rx_in( net3 ),
 .q1( q1 ),
 .q0( q0 ),
 .vctrl_in( vctrl_a ),
 .vctrl_b_out( net4 ),
 .vctrl_b_in( vctrl_b_a ),
 .vctrl_out( net5 ),
 .ACC_CAP( net6 ),
 .Cap_M2( net7 ),
 .Cap_M1( net8 ),
 .Cap_M21( net9 ),
 .Cap_M11( net10 ),
 .vref0( net11 ),
 .clk_ref( clk_ref_a ),
 .vref1( net12 ),
 .clk_fb( net13 ),
 .rst_ni( a_rst_n ),
 .dac_out( net14 ),
 .VGND( VGND ),
 .vref2( net15 ),
 .vref3( net16 ),
 .opm( net17 ),
 .lnaf( net18 )
);


ook_digital_system
x4 ( 
 .VPWR( VPWR ),
 .VGND( VGND ),
 .rst_n( net19 ),
 .clk( net20 ),
 .ena( net21 ),
 .uio_in( net22 ),
 .uio_in( net23 ),
 .uio_in( net24 ),
 .uio_in( net25 ),
 .uio_in( net26 ),
 .uio_in( net27 ),
 .uio_in( net28 ),
 .uio_in( net29 ),
 .ui_in( net30 ),
 .ui_in( net31 ),
 .ui_in( net32 ),
 .ui_in( net33 ),
 .ui_in( net34 ),
 .ui_in( net35 ),
 .ui_in( net36 ),
 .ui_in( net37 ),
 .uio_oe( net38 ),
 .uio_oe( net39 ),
 .uio_oe( net40 ),
 .uio_oe( net41 ),
 .uio_oe( net42 ),
 .uio_oe( net43 ),
 .uio_oe( net44 ),
 .uio_oe( net45 ),
 .uio_out( net46 ),
 .uio_out( net47 ),
 .uio_out( net48 ),
 .uio_out( net49 ),
 .uio_out( net50 ),
 .uio_out( net51 ),
 .uio_out( net52 ),
 .uio_out( net53 ),
 .uo_out( net54 ),
 .uo_out( net55 ),
 .uo_out( net56 ),
 .uo_out( net57 ),
 .uo_out( net58 ),
 .uo_out( net59 ),
 .uo_out( net60 ),
 .uo_out( net61 ),
 .a_q3( q3 ),
 .a_q2( q2 ),
 .a_q1( q1 ),
 .a_q0( q0 ),
 .rst_n_a( a_rst_n ),
 .sys_clk_a( clk_ref_a ),
 .vctrl_a( vctrl_a ),
 .vctrl_b_a( vctrl_b_a )
);

endmodule

// expanding   symbol:  /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/ook_analog_system.sym # of pins=29
// sym_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/ook_analog_system.sym
// sch_path: /home/belal/HeiChips/heichips26-on-off/macros/heichips26_ook_top/macros/ook_analog_system/schematic/xschem/ook_analog_system.sch
module ook_analog_system
(
  inout wire VAPWR,
  inout wire vcl,
  inout wire VPWR,
  inout wire q3,
  inout wire q2,
  inout wire tx_out,
  inout wire rx_in,
  inout wire q1,
  inout wire q0,
  inout wire vctrl_in,
  inout wire vctrl_b_out,
  inout wire vctrl_b_in,
  inout wire vctrl_out,
  inout wire ACC_CAP,
  inout wire Cap_M2,
  inout wire Cap_M1,
  inout wire Cap_M21,
  inout wire Cap_M11,
  inout wire vref0,
  inout wire clk_ref,
  inout wire vref1,
  inout wire clk_fb,
  inout wire rst_ni,
  inout wire dac_out,
  inout wire VGND,
  inout wire vref2,
  inout wire vref3,
  inout wire opm,
  inout wire lnaf
);

ook_receiver
x1 ( 
);


ook_transmitter
x2 ( 
);

endmodule
