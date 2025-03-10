`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2025 04:49:51 PM
// Design Name: 
// Module Name: UART_Receiver
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



module UART_Receiver #(baud = 9600, data_bits = 8)
            (input CLK, RST, input_bit, output reg [7:0] final_data, output reg received);
            
            reg [7:0] data_input;
            integer clkcomparer = 10417, check = 5209; //based on 100mhz clock, 9600 baud
            localparam Idle = 3'b000, Start = 3'b001, Data = 3'b010, End = 3'b011;
            localparam Parity = 3'b100;
            reg [23:0] clkcounter;
            reg [2:0] state, next_state; 
            reg parity;
            reg [3:0] i;
            
            always @(posedge CLK) begin
                if (RST) begin
                    clkcounter <= 0;
                    next_state <= 0;
                    i <= 0;
                    data_input <= 0;
                    final_data <= 0;
                    received <= 0;
                end else begin
                    case (state)
                        Idle: begin
                            if (clkcounter == clkcomparer) begin
                                received <= 0;
                                clkcounter <= 0;
                                if (input_bit == 0) begin //start bit
                                    next_state <= Data;
                                end
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                        Start: begin
                        //if the start bit doesn't stay down for at least half the clock cycle
                        //it will go back to Idle, otherwise, it will go to data
                            if (clkcounter == check) begin
                                clkcounter <= 0;
                                if (input_bit == 0) begin //still start bit
                                    next_state <= Data;
                                end else begin
                                    next_state <= Idle; 
                                end
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                        Data: begin
                            if (clkcounter == clkcomparer) begin
                                clkcounter <= 0;
                                data_input[i] <= input_bit; 
                                i <= i + 1;
                                if (i == 8) begin //includes parity in the next one
                                    next_state <= Parity;
                                    i <= 0;
                                end else
                                    next_state <= Data;
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                        Parity: begin
                            if (clkcounter == clkcomparer) begin
                                clkcounter <= 0;
                                parity <= input_bit;
                                next_state <= End;
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                        End: begin
                            if (clkcounter == clkcomparer) begin
                                clkcounter <= 0;
                                if(input_bit == 1) begin //stop bit
                                    received <= 1;
                                    next_state <= Idle;
                                    final_data <= data_input;
                                    data_input <= 0;
                                end
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                        default: begin
                            if (clkcounter == clkcomparer) begin
                                next_state <= state;
                                clkcounter <= 0;
                            end else
                                clkcounter <= clkcounter + 1;
                        end
                    endcase
                end
                state <= next_state;
           end
          
                       
endmodule











