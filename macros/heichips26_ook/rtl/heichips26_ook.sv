// SPDX-FileCopyrightText: © 2026 XXX Authors
// SPDX-License-Identifier: Apache-2.0

// Adapted from the Tiny Tapeout template


`timescale 1ns / 1ps
`default_nettype none

module heichips26_ook #(
    parameter int unsigned CLKS_PER_BIT = 1000
)(
`ifdef USE_POWER_PINS
    inout  wire VPWR,
    inout  wire VGND,
`endif
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // nets shared between the digital interface and the analog macro
    wire aif_q0, aif_q1, aif_q2, aif_q3;
    wire aif_vctrl, aif_vctrl_b;
    wire aif_sys_clk, aif_sys_reset_n;

    analog_interface analog_interface_inst (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
`endif
        .chip_ui_in(ui_in),
        .chip_uo_out(uo_out),
        .clk(clk),
        .rst_n(rst_n),

        .sys_clk(aif_sys_clk),
        .sys_reset_n(aif_sys_reset_n),

        .q0(aif_q0),
        .q1(aif_q1),
        .q2(aif_q2),
        .q3(aif_q3),
        .vctrl(aif_vctrl),
        .vctrl_b(aif_vctrl_b),

        .data_in_tx(),
        .q0_rx_data(),
        .q1_rx_data(),
        .q2_rx_data(),
        .q3_rx_data(),

        .CS_D(),
        .MOSI_D(),
        .MISO_D(),
        .DTRDY_D()
    );

    ook_analog_system ook_analog_system_inst (
`ifdef USE_POWER_PINS
        .VAPWR(),
        .VGND(VGND),
        .VPWR(VPWR),
`endif
        .ACC_CAP(),
        .Cap_M1(),
        .Cap_M11(),
        .Cap_M2(),
        .Cap_M21(),
        .clk_fb(),
        .clk_ref(aif_sys_clk),
        .dac_out(),
        .lnaf(),
        .opm(),
        .q0(aif_q0),
        .q1(aif_q1),
        .q2(aif_q2),
        .q3(aif_q3),
        .rst_ni(aif_sys_reset_n),
        .rx_in(),
        .tx_out(),
        .vcl(),
        .vctrl_b_in(aif_vctrl_b),
        .vctrl_b_out(),
        .vctrl_in(aif_vctrl),
        .vctrl_out(),
        .vref0(),
        .vref1(),
        .vref2(),
        .vref3()
    );

endmodule
