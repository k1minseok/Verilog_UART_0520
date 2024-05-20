`timescale 1ns / 1ps

module top (
    input clk,
    input reset,
    input rx,

    output [2:0] ledOut,
    output tx
);

    wire [7:0] w_rx_data;
    wire w_rx_done;

    uart U_UART (
        .clk  (clk),
        .reset(reset),

        //tx
        .tx_start(w_rx_done),
        .tx_data(w_rx_data),
        .tx(tx),
        .tx_done(),

        //rx
        .rx(rx),
        .rx_data(w_rx_data),
        .rx_done(w_rx_done)
    );

    ledController U_LEDController (
        .clk(clk),
        .reset(reset),
        .in(w_rx_data),

        .out(ledOut)
    );


endmodule
