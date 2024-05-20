`timescale 1ns / 1ps

module ledController (
    input clk,
    input reset,
    input [7:0] in,

    output [2:0] out
);

    localparam OFF = 0, LED_1 = 1, LED_2 = 2, LED_3 = 3;

    reg [1:0] state, state_next;
    reg [2:0] out_reg, out_next;


    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state   <= OFF;
            out_reg <= 0;
        end else begin
            state   <= state_next;
            out_reg <= out_next;
        end
    end


    always @(*) begin
        state_next = state;

        case (state)
            OFF: begin
                if (in == 49) state_next = LED_1;  // '1'
                else if (in == 50) state_next = LED_2;  // '2'
                else if (in == 51) state_next = LED_3;  // '3'
            end

            LED_1: begin
                if (in == 48) state_next = OFF;
                else if (in == 50) state_next = LED_2;
                else if (in == 51) state_next = LED_3;
            end

            LED_2: begin
                if (in == 48) state_next = OFF;
                else if (in == 49) state_next = LED_1;
                else if (in == 51) state_next = LED_3;
            end

            LED_3: begin
                if (in == 48) state_next = OFF;
                else if (in == 49) state_next = LED_1;
                else if (in == 50) state_next = LED_2;
            end
        endcase
    end


    always @(*) begin
        out_next = out_reg;

        case (state)
            OFF: begin
                out_next = 3'b000;
            end

            LED_1: begin
                out_next = 3'b001;
            end

            LED_2: begin
                out_next = 3'b011;
            end

            LED_3: begin
                out_next = 3'b111;
            end
        endcase
    end

    assign out = out_reg;

endmodule
