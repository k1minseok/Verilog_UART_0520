// `timescale 1ns / 1ps


// module top_txrx_loop (
//     input clk,
//     input reset,
//     input rx,

//     output tx
// );

//     wire [7:0] w_rx_data;
//     wire w_rx_done;

//     uart U_UART (
//         .clk(clk),
//         .reset(reset),
//         .tx_start(w_rx_done),
//         .tx_data(w_rx_data),
//         .rx(rx),

//         .tx(tx),
//         .tx_done(),
//         .rx_data(w_rx_data),
//         .rx_done(w_rx_done)
//     );
// endmodule
