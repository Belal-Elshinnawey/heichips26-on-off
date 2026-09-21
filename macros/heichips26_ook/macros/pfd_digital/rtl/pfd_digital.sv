`default_nettype none

module pfd_digital (
    input  wire clk_ref,
    input  wire clk_fb,
    output wire up,
    output wire dn
);

    reg up_q, dn_q;
    wire reset_b;

    assign reset_b = ~(up_q & dn_q);

    always @(posedge clk_ref or negedge reset_b) begin
        if (!reset_b) up_q <= 1'b0;
        else up_q <= 1'b1;
    end

    always @(posedge clk_fb or negedge reset_b) begin
        if (!reset_b) dn_q <= 1'b0;
        else dn_q <= 1'b1;
    end

    assign up = up_q;
    assign dn = dn_q;

endmodule

`default_nettype wire
