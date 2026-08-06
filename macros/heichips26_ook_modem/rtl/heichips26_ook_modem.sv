// SPDX-FileCopyrightText: © 2026 XXX Authors
// SPDX-License-Identifier: Apache-2.0

// Adapted from the Tiny Tapeout template

// トップモジュール

`timescale 1ns / 1ps
`default_nettype none

module heichips26_ook_modem #(
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

    // 入力ピン割当
    wire [5:0] tx_data  = ui_in[5:0];
    wire       tx_valid = ui_in[6];
    wire       rx_ready = ui_in[7];
    wire       tx_sop   = uio_in[0];
    wire       tx_eop   = uio_in[1];
    wire       mode_sel = uio_in[4];
    wire       bist_en  = uio_in[6]; //RXで仕様

    // TX周り
    wire tx_ready, tx_busy, ro_en;
    wire carrier_clk, ook_out, tx_drive_en;

    tx_framer #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) u_tx_framer (
        .clk(clk),
        .rst_n(rst_n),
        .tx_data(tx_data),
        .tx_valid(tx_valid),
        .tx_sop(tx_sop),
        .tx_eop(tx_eop),
        .tx_ready(tx_ready),
        .ro_en(ro_en),
        .tx_busy(tx_busy)
    );

    `ifdef SIM
    ro_model u_ro_model (
        .ro_en(ro_en),
        .ro_out(carrier_clk)
    );
    `else
    assign carrier_clk = 1'b0;
    `endif

    ook_gate u_ook_gate (
        .mode_carrier(mode_sel),
        .ro_en(ro_en),
        .carrier_clk(carrier_clk),
        .tx_busy(tx_busy),
        .ook_out(ook_out),
        .tx_drive_en(tx_drive_en)
    );


//  RX周り後で書くよ
 

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, ui_in[7:1], uio_in[7:1]};
    
    logic [7:0] count;
    
    counter counter_0 (
    `ifdef USE_POWER_PINS
        .VPWR  (VPWR),
        .VGND  (VGND),
    `endif
        .clk_i    (clk),
        .rst_ni   (rst_n),
        .enable_i (ui_in[0]),

        .count_o  (count)
    );
    
    assign uo_out  = count;
    assign uio_out = count;
    assign uio_oe  = '1;

endmodule
