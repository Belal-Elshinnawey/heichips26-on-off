`timescale 1ns / 1ps
`default_nettype none

module rx_deframer (
    input  logic clk,
    input  logic rst_n,

    input logic suppress,
    input logic rx_i,

    input  logic symbol,
    input  logic symbol_valid,
    output logic phase_rst,
    
    output logic [5:0] rx_data,
    output logic       rx_valid,
    output logic       rx_sop,
    output logic       rx_eop
);

typedef enum logic [2:0] {
    HUNT,
    PRE_CHK,
    WAIT_WORD,
    START_CHK,
    DATA,
    STOP_CHK
} state_t;
state_t state;


logic prev_rx;
logic pre_got1;
logic [2:0] bit_cnt;
logic [5:0] sh;
logic first_word;

logic skip1;
wire sv = symbol_valid && !skip1;


always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state <= HUNT;
        prev_rx <= 1'b0;
        pre_got1 <= 1'b0;
        bit_cnt <= 3'b000;
        sh <= 6'b000_000;
        first_word <= 1'b0;
        rx_data <= 6'b000_000;
        rx_valid <= 1'b0;
        rx_sop <= 1'b0;
        rx_eop <= 1'b0;
        phase_rst <= 1'b0;
        skip1 <= 1'b0;
    end else begin
        prev_rx <= rx_i;
        rx_valid <= 1'b0;
        rx_sop <= 1'b0;
        rx_eop <= 1'b0;
        phase_rst <= 1'b0;
        skip1 <= 1'b0;

        if(suppress) begin
            state <= HUNT;
        end else begin
            case(state)
            HUNT: if(!prev_rx && rx_i) begin
                phase_rst <= 1'b1;
                skip1 <= 1'b1;
                pre_got1 <= 1'b0;
                first_word <= 1'b1;
                state <= PRE_CHK;
            end

            PRE_CHK: if(sv) begin
                if(symbol) begin
                    if(pre_got1) state <= START_CHK;
                    else pre_got1 <= 1'b1;
                end else state <= HUNT;
            end

            WAIT_WORD: if(!rx_i) begin
                phase_rst <= 1'b1;
                skip1 <= 1'b1;
                state <= START_CHK;
            end

            START_CHK: if(sv) begin
                if(!symbol) begin
                    bit_cnt <= 3'd5;
                    state <= DATA;
                end else state <= WAIT_WORD;
            end

            DATA: if(sv) begin
                sh <= {sh[4:0],symbol};
                if (bit_cnt == '0) state <= STOP_CHK;
                else bit_cnt <= bit_cnt - 1'b1;
            end

            STOP_CHK: if(sv) begin
                if (symbol) begin
                    rx_data <= sh;
                    rx_valid <= 1'b1;
                    rx_sop <= first_word;
                    first_word <= 1'b0;
                    if (!rx_i) state <= START_CHK;
                    else       state <= WAIT_WORD;
                end else begin
                    rx_eop <= 1'b1;
                    state <= HUNT;
                end
            end
            default: state <= HUNT;
            endcase
        end
    end
end
endmodule


                    



            


