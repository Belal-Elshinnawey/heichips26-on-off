`default_nettype none

module pfd (
    input  wire clk_ref,
    input  wire clk_fb,
    input  wire rst_ni,
    output wire up,
    output wire dn
);

    localparam int unsigned REF_N = 125;
    reg [6:0] ref_count;
    reg       clk_ref_div;

    always @(posedge clk_ref or negedge rst_ni) begin
        if (!rst_ni) begin
            ref_count   <= 0;
            clk_ref_div <= 0;
        end else if (ref_count == REF_N - 1) begin
            ref_count   <= 0;
            clk_ref_div <= 1'b1;
        end else begin
            ref_count   <= ref_count + 1;
            clk_ref_div <= 1'b0;
        end
    end

    localparam int unsigned FB_N = 678;
    reg [9:0] fb_count;
    reg       clk_fb_div;

    always @(posedge clk_fb or negedge rst_ni) begin
        if (!rst_ni) begin
            fb_count   <= 0;
            clk_fb_div <= 0;
        end else if (fb_count == FB_N - 1) begin
            fb_count   <= 0;
            clk_fb_div <= 1'b1;
        end else begin
            fb_count   <= fb_count + 1;
            clk_fb_div <= 1'b0;
        end
    end

    reg up_q, dn_q;
    wire reset_b;

    assign reset_b = ~(up_q & dn_q);

    always @(posedge clk_ref_div or negedge reset_b or negedge rst_ni) begin
        if (!rst_ni) up_q <= 1'b0;
        else if (!reset_b) up_q <= 1'b0;
        else up_q <= 1'b1;
    end

    always @(posedge clk_fb_div or negedge reset_b or negedge rst_ni) begin
        if (!rst_ni) dn_q <= 1'b0;
        else if (!reset_b) dn_q <= 1'b0;
        else dn_q <= 1'b1;
    end

    assign up = up_q;
    assign dn = dn_q;

endmodule

`default_nettype wire
