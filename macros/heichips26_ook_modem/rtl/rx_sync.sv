// 2段クロック同期用フリップフロップ
// 
// 役割: チップ外部から非同期信号が入力された場合、
//       2段のフリップフロップを通して
//       内部クロックと同期した信号を出力

`timescale 1ns / 1ps
`default_nettype none

module rx_sync (
    input  logic clk,
    input  logic rx_in,  // 外部からの生信号(非同期)
    output logic rx_i    // 同期化済み信号
);

    logic ff1;

    always_ff @(posedge clk) begin
        ff1  <= rx_in;
        rx_i <= ff1;
    end

endmodule
