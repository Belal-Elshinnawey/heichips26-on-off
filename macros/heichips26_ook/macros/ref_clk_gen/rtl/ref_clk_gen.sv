`default_nettype none

module ref_clk_gen (
    input  wire clk_i,
    input  wire rst_ni,
    output reg  clk_out
);

    localparam int unsigned N = 125;
    reg [6:0] count;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            count   <= 0;
            clk_out <= 0;
        end else if (count == N - 1) begin
            count   <= 0;
            clk_out <= 1'b1;
        end else begin
            count   <= count + 1;
            clk_out <= 1'b0;
        end
    end

endmodule

`default_nettype wire
