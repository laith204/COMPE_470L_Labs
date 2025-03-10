`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2025 04:49:51 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top();

    parameter baud = 9600, data_bits = 8;
    reg CLK, RST, input_bit;
    wire output_bit; 
    reg [15:0] clkcounter1 = 10417;
    reg [3:0] i = 0; 
    reg [7:0] finalData;
    
    top #(.baud(baud), .data_bits(data_bits)) 
    U00 (.CLK(CLK), .RST(RST), .input_bit(input_bit), .output_bit(output_bit));

    initial begin
        CLK = 1;
        //data_input = 8'b01001111;//O
        RST = 1;
    end
    
    always #5 CLK = ~CLK;
    
    initial begin  
        #1 RST = 0;
        
        #5 input_bit = 1;
        
        #104170 input_bit = 0; //start
        
        #104170 input_bit = 0; 
        #104170 input_bit = 1;
        #104170 input_bit = 0;
        #104170 input_bit = 0;
        #104170 input_bit = 1;
        #104170 input_bit = 1;
        #104170 input_bit = 1;
        #104170 input_bit = 1;
        #104170 input_bit = 0; //parity
        #104170 input_bit = 1; //idle
         
        #10000000;
        $finish;
    end


endmodule
