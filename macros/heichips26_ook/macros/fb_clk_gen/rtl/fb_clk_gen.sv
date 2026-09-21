`default_nettype none

module fb_clk_gen (
    input  wire clk_i,
    output reg  clk_out
);

    reg div2;

    always @(posedge clk_i) begin
        div2 <= ~div2;
    end

    localparam int unsigned N = 339;
    reg [8:0] count;

    always @(posedge div2) begin
        if (count == N - 1) begin
            count   <= 0;
            clk_out <= 1'b1;
        end else begin
            count   <= count + 1;
            clk_out <= 1'b0;
        end
    end

endmodule

`default_nettype wire
