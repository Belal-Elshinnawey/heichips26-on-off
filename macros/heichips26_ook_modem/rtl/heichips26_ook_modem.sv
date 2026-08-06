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


    // RX周り
    wire rx_in_raw = bist_en ? ro_en : 1'b0;  // TODO: analog_0確定後に外部入力へ差替え

    wire rx_suppress = tx_busy & ~bist_en;

    wire       rx_i, phase_rst, symbol, symbol_valid;
    wire [5:0] rx_data;
    wire       rx_valid, rx_sop, rx_eop;

    // 同期回路
    rx_sync u_rx_sync (
        .clk   (clk),
        .rx_in (rx_in_raw),
        .rx_i  (rx_i)
    );

    // 多数決回路
    rx_sampler #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) u_rx_sampler (
        .clk          (clk),
        .rst_n        (rst_n),
        .rx_i         (rx_i),
        .phase_rst    (phase_rst),
        .symbol       (symbol),
        .symbol_valid (symbol_valid)
    );

    // デフレーム回路
    rx_deframer u_rx_deframer (
        .clk          (clk),
        .rst_n        (rst_n),
        .rx_i         (rx_i),
        .suppress     (rx_suppress),
        .symbol       (symbol),
        .symbol_valid (symbol_valid),
        .phase_rst    (phase_rst),
        .rx_data      (rx_data),
        .rx_valid     (rx_valid),
        .rx_sop       (rx_sop),
        .rx_eop       (rx_eop)
    );

    // 出力ピン
    assign uo_out = {tx_ready, rx_valid, rx_data};
    assign uio_out = {ook_out,       1'b0, tx_busy, 1'b0, rx_eop,  rx_sop, 2'b00};
    assign uio_oe  = 8'b1010_1100;

    wire _unused = &{ena, rx_ready, tx_drive_en, uio_in[7], uio_in[5], uio_in[3:2]};

endmodule
