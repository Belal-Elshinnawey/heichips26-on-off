// SPDX-FileCopyrightText: © 2026 The HeiChips Contributors
// SPDX-License-Identifier: Apache-2.0
//
// Basys3用

`timescale 1ns / 1ps
`default_nettype none

module basys3_top #(
    parameter int unsigned CLKS_PER_BIT = 100_000,
    parameter int unsigned UART_DIVIDER = 868   // 100MHz/115200baud(TBで上書き可)
) (
    input  wire         clk,     // 100 MHz (W5)
    input  wire  [15:0] sw,
    output logic [15:0] led,
    input  wire         btnC,
    input  wire         btnU,
    input  wire         btnD,    // 未使用
    input  wire         btnR,    // リセット
    input  wire         btnL,    // 未使用
    input  wire         RsRx,    // USB-UART: PC→FPGA (B18)
    output wire         RsTx,    // USB-UART: FPGA→PC (A18)
    inout  wire  [7:0]  JA
);


    // リセット同期化の定石パターン(lintのSYNCASYNCNETは誤検知なので局所抑止)
    /* verilator lint_off SYNCASYNCNET */
    wire raw_rst_n = ~btnR;  // ボタンはアクティブHigh
    logic [1:0] rst_sync;
    always_ff @(posedge clk or negedge raw_rst_n) begin
        if (!raw_rst_n) rst_sync <= 2'b00;
        else            rst_sync <= {rst_sync[0], 1'b1};
    end
    wire rst_n = rst_sync[1];
    /* verilator lint_on SYNCASYNCNET */

    localparam int unsigned DEBOUNCE = CLKS_PER_BIT;
    localparam int unsigned DBW = (DEBOUNCE <= 1) ? 1 : $clog2(DEBOUNCE);

    // 0=BTNC, 1=BTNU の2本をまとめて整形
    wire  [1:0] btn_raw = {btnU, btnC};
    logic [1:0] btn_ff1, btn_ff2, btn_db, btn_db_d;
    logic [DBW-1:0] db_cnt [2];
    wire  [1:0] btn_edge;

    generate for (genvar i = 0; i < 2; i++) begin : g_btn
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                {btn_ff2[i], btn_ff1[i]} <= 2'b00;
                btn_db[i]   <= 1'b0;
                btn_db_d[i] <= 1'b0;
                db_cnt[i]   <= '0;
            end else begin
                {btn_ff2[i], btn_ff1[i]} <= {btn_ff1[i], btn_raw[i]};  // 2FF同期化
                if (btn_ff2[i] == btn_db[i]) begin
                    db_cnt[i] <= '0;    // 安定 or 確定済み: カウンタ休止
                end else begin
                    db_cnt[i] <= db_cnt[i] + 1'b1;
                    if (db_cnt[i] == DBW'(DEBOUNCE - 1)) btn_db[i] <= btn_ff2[i];
                end
                btn_db_d[i] <= btn_db[i];
            end
        end
        assign btn_edge[i] = btn_db[i] & ~btn_db_d[i];
    end endgenerate

    logic       pend;
    logic [5:0] pend_data;
    logic       pend_sop, pend_eop;
    wire        tx_ready_core;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            pend <= 1'b0;
        end else begin
            if (btn_edge[0]) begin              // BTNC: SW6/SW7のフラグで1語送信
                pend      <= 1'b1;
                pend_data <= sw[5:0];
                pend_sop  <= sw[6];
                pend_eop  <= sw[7];
            end else if (btn_edge[1]) begin     // BTNU: 単語パケット(sop=eop=1)
                pend      <= 1'b1;
                pend_data <= sw[5:0];
                pend_sop  <= 1'b1;
                pend_eop  <= 1'b1;
            end else if (pend && tx_ready_core) begin
                pend <= 1'b0;                   // ハンドシェイク成立、要求を下ろす
            end
        end
    end

    logic [7:0] ui_in, uio_in;
    wire  [7:0] uo_out, uio_out, uio_oe;

    // SW13=1: USB-UARTブリッジがモデムを駆動(PCターミナルでチャット)
    // SW13=0: ボタン/スイッチ操作(従来デモ)
    wire       use_uart = sw[13];
    wire [5:0] ub_data;
    wire       ub_valid, ub_sop, ub_eop;

    assign ui_in  = {1'b1, use_uart ? ub_valid : pend,
                     use_uart ? ub_data : pend_data};
    //               [7]   [6]bist  [5]   [4]mode  [3:2]  [1]eop  [0]sop
    assign uio_in = {1'b0, sw[15], 1'b0, sw[14], 2'b00,
                     use_uart ? ub_eop : pend_eop,
                     use_uart ? ub_sop : pend_sop};

    heichips26_ook_modem #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) u_modem (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (1'b1),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    assign tx_ready_core = uo_out[7];
    wire tx_busy_core = uio_out[5];
    wire tx_out       = uio_out[7];

    wire ext_rx_in = JA[1];
    wire ext_rx_i, ext_phase_rst, ext_symbol, ext_symbol_valid;
    wire [5:0] ext_rx_data;
    wire ext_rx_valid, ext_rx_sop, ext_rx_eop;

    rx_sync u_ext_sync (
        .clk   (clk),
        .rx_in (ext_rx_in),
        .rx_i  (ext_rx_i)
    );

    rx_sampler #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) u_ext_sampler (
        .clk          (clk),
        .rst_n        (rst_n),
        .rx_i         (ext_rx_i),
        .phase_rst    (ext_phase_rst),
        .symbol       (ext_symbol),
        .symbol_valid (ext_symbol_valid)
    );

    rx_deframer u_ext_deframer (
        .clk          (clk),
        .rst_n        (rst_n),
        .rx_i         (ext_rx_i),
        .suppress     (1'b0),
        .symbol       (ext_symbol),
        .symbol_valid (ext_symbol_valid),
        .phase_rst    (ext_phase_rst),
        .rx_data      (ext_rx_data),
        .rx_valid     (ext_rx_valid),
        .rx_sop       (ext_rx_sop),
        .rx_eop       (ext_rx_eop)
    );

    wire       use_bist    = sw[15];
    wire [5:0] sel_rx_data = use_bist ? uo_out[5:0] : ext_rx_data;
    wire       sel_valid   = use_bist ? uo_out[6]   : ext_rx_valid;
    wire       sel_sop     = use_bist ? uio_out[2]  : ext_rx_sop;
    wire       sel_eop     = use_bist ? uio_out[3]  : ext_rx_eop;

    // USB-UARTブリッジ(1文字 = SOP語+EOP語の2語パケット)
    uart_bridge #(.UART_DIVIDER(UART_DIVIDER)) u_uart_bridge (
        .clk       (clk),
        .rst_n     (rst_n),
        .uart_rx_i (RsRx),
        .uart_tx_o (RsTx),
        .tx_data   (ub_data),
        .tx_valid  (ub_valid),
        .tx_sop    (ub_sop),
        .tx_eop    (ub_eop),
        .tx_ready  (tx_ready_core),
        .rx_data   (sel_rx_data),   // 表示ソース(BIST/外部)と同じ経路をエコー
        .rx_valid  (sel_valid),
        .rx_sop    (sel_sop)
    );

    localparam int unsigned STRETCH = CLKS_PER_BIT * 100;
    localparam int unsigned STW = (STRETCH <= 1) ? 1 : $clog2(STRETCH);
    logic [STW-1:0] st_valid, st_sop, st_eop;
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            st_valid <= '0; st_sop <= '0; st_eop <= '0;
        end else begin
            st_valid <= sel_valid ? STW'(STRETCH - 1) : (st_valid != 0 ? st_valid - 1'b1 : '0);
            st_sop   <= sel_sop   ? STW'(STRETCH - 1) : (st_sop   != 0 ? st_sop   - 1'b1 : '0);
            st_eop   <= sel_eop   ? STW'(STRETCH - 1) : (st_eop   != 0 ? st_eop   - 1'b1 : '0);
        end
    end

    assign led[5:0] = sel_rx_data;
    assign led[6]   = (st_valid != 0);
    assign led[7]   = tx_ready_core;
    assign led[8]   = tx_busy_core;
    assign led[9]   = (st_sop != 0);
    assign led[10]  = (st_eop != 0);
    assign led[11]  = pend;              // 送信待ち
    assign led[12]  = ext_rx_i;          // 受信線の生モニタ(RFノイズも見える)
    assign led[13]  = use_uart;          // UARTチャットモード表示
    assign led[14]  = sw[14];
    assign led[15]  = sw[15];

    assign JA[0] = tx_out;
    assign JA[2] = ext_rx_i;
    assign JA[3] = 1'b0;

    wire _unused = &{btnD, btnL, sw[12:8], uio_oe,
                     uio_out[6], uio_out[4], uio_out[1:0], JA[7:4]};

endmodule
