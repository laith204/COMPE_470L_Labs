`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 10:25:40 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top #(baud = 9600, data_bits = 8) (input CLK, RST, input_bit, output output_bit);
    reg [7:0] data;
    wire [7:0] finalData;
    wire received;
    
    UART_Receiver #(.baud(baud), .data_bits(data_bits)) 
    U01 (.CLK(CLK), .RST(RST), .input_bit(input_bit), .final_data(finalData), .received(received));
    
    UART_Transmitter #(.baud(baud), .data_bits(data_bits)) 
    U00 (.CLK(CLK), .RST(RST), .start_valid(received), .data_input(finalData), .output_bit(output_bit));
   

endmodule
