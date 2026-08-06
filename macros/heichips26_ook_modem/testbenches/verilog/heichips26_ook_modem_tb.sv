// SPDX-FileCopyrightText: © 2026 HeiChips26 OOK Modem Authors
// SPDX-License-Identifier: Apache-2.0
// 
// トップレベル

`timescale 1ns / 1ps
`default_nettype none


module heichips26_ook_modem_tb;

localparam int N = 8;
localparam int CLK_PERIOD = 10;
logic clk = 0, rst_n = 0;
logic [7:0] ui_in = '0, uio_in = '0;
wire [7:0] uio_out, uo_out, ui_oe;

heichips26_ook_modem #(.CLKS_PER_BIT(N)) u_dut (
    .clk (clk),
    .rst_n (rst_n),
    .ui_in (ui_in),
    .uio_in (uio_in),
    .uio_out (uio_out),
    .uo_out (uo_out),
    .ui_oe (ui_oe),
    .uo_oe (uo_oe),
    .ena(1'b1)
);

always #(CLK_PERIOD/ 2) clk = ~clk;

wire tx_ready = uo_out[7];
wire tx_busy = uio_out[5];
wire tx_out = uio_out[7];

initial begin
    $dumpfile("heichips26_ook_modem_tb.fst");
    $dumpvars(0, heichips26_ook_modem_tb);
  end

  int errors = 0;
  int edge_cnt = 0, e0 = 0;

  always @(posedge tx_out) edge_cnt++;

  task automatic chk(input bit cond, input string msg);
    if (!cond) begin
      $display("FAIL: %s at (t=%t)", msg, $time);
      errors++;
    end
  endtask

  task pin_send(input logic [5:0] d, input logic sop, input logic eop);
    @(posedge)clk; #1;
    chk(tx_ready, "送信前に tx_ready = 1");
    ui_in = {1'b0,1'b1,d};
    uio_in = {uio_in[7:2], eop, sop};
    @(posedge clk); #1;
    ui_in[6] = 1'b0; uio_in[1:0] = 2'b00;
  endtask

  task automatic pin_recv(output logic [5:0] data, output int num_bits, output real delay_after);

  


