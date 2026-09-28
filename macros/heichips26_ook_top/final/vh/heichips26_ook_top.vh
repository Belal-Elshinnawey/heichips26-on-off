module heichips26_ook_top (
`ifdef USE_POWER_PINS
    inout VAPWR,
    inout VGND,
    inout VPWR,
`endif
    inout analog_0,
    inout analog_1,
    inout analog_2,
    inout clk_ref,
    inout clk_ref_d,
    inout q0,
    inout q0_d,
    inout q1,
    inout q1_d,
    inout q2,
    inout q2_d,
    inout q3,
    inout q3_d,
    inout rst_d,
    inout rst_n,
    inout vctrl_b_in,
    inout vctrl_d,
    inout vctrl_in,
    inout vctrl_n_d
);
endmodule
