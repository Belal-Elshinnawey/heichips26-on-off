module ook_analog_system (
`ifdef USE_POWER_PINS
    inout VAPWR,
    inout VGND,
    inout VPWR,
`endif
    inout ACC_CAP,
    inout Cap_M1,
    inout Cap_M11,
    inout Cap_M2,
    inout Cap_M21,
    inout clk_fb,
    inout clk_ref,
    inout dac_out,
    inout lnaf,
    inout opm,
    inout q0,
    inout q1,
    inout q2,
    inout q3,
    inout rst_ni,
    inout rx_in,
    inout tx_out,
    inout vcl,
    inout vctrl_b_in,
    inout vctrl_b_out,
    inout vctrl_in,
    inout vctrl_out,
    inout vref0,
    inout vref1,
    inout vref2,
    inout vref3
);
endmodule
