`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 08:16:24 AM
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


module top(input [3:0] number, output wire [6:0] LED, output wire [3:0] AN0);

            assign AN0 = 4'b1110;
        
            assign LED = (number == 4'b0000) ? 7'b0000001 :  // 0
                 (number == 4'b0001) ? 7'b1001111:  // 1
                 (number == 4'b0010) ? 7'b0010010:  // 2
                 (number == 4'b0011) ? 7'b0000110:  // 3
                 (number == 4'b0100) ? 7'b1001100:  // 4
                 (number == 4'b0101) ? 7'b0100100:  // 5
                 (number == 4'b0110) ? 7'b0100000:  // 6
                 (number == 4'b0111) ? 7'b0001111:  // 7
                 (number == 4'b1000) ? 7'b0000000:  // 8
                 (number == 4'b1001) ? 7'b0000100:  // 9
                                       7'b1111111; //default 

endmodule
