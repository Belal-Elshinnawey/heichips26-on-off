`timescale 1ns/1ps

module fb_clk_gen_tb;

    reg clk_i = 0;
    wire clk_out;

    fb_clk_gen dut (
        .clk_i  (clk_i),
        .clk_out(clk_out)
    );

    // no reset in this design -- force a known initial state the same way the
    // XSPICE gate-level model does (ic=0 on every d_dff), otherwise the toggle
    // stage starts at X and never resolves in a Verilog sim.
    initial begin
        dut.div2  = 1'b0;
        dut.count = 9'b0;
        dut.clk_out = 1'b0;
    end

    always #0.5 clk_i = ~clk_i;   // 1GHz clk_i, period is arbitrary -- only the edge ratio matters

    integer edge_count = 0;
    integer last_edge_count = 0;
    integer pulse_num = 0;

    always @(posedge clk_i) begin
        edge_count = edge_count + 1;
    end

    always @(posedge clk_out) begin
        pulse_num = pulse_num + 1;
        $display("pulse %0d: clk_i edges since last pulse = %0d", pulse_num, edge_count - last_edge_count);
        last_edge_count = edge_count;
    end

    initial begin
        $dumpfile("fb_clk_gen_tb.fst");
        $dumpvars(0, fb_clk_gen_tb);
        #20000;
        if (pulse_num < 3) begin
            $display("FAIL: only %0d clk_out pulse(s) in the simulated window", pulse_num);
        end else begin
            $display("total pulses: %0d", pulse_num);
        end
        $finish;
    end

endmodule
