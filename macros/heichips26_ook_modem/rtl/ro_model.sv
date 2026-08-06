// ro_model.sv リングオシレータのdemo
// 役割: ro_en = 1 の間、周期 (2 * HALF_PERIOD_NS) [ns] のキャリアクロックを出力する。

`timescale 1ns / 1ps
`default_nettype none

`ifdef SIM
module ro_model #(
    parameter int unsigned HALF_PERIOD_NS = 10  // 半周期[ns]。10 → 周期20ns = 50MHz
) (
    input  logic ro_en,
    output logic ro_out
);
    initial ro_out = 1'b0;

    always begin
        if (ro_en) begin
            #(HALF_PERIOD_NS);      // timescale 1ns なので単位はns
            ro_out = ~ro_out;
        end else begin
            ro_out = 1'b0;
            @(posedge ro_en);
        end
    end
endmodule
`endif
