`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2025 04:49:51 PM
// Design Name: 
// Module Name: UART_Transmitter
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


module UART_Transmitter #(baud = 9600, data_bits = 8)
            (input CLK, RST, start_valid, input [7:0] data_input, output reg output_bit);
            
            integer clkcomparer = 10417; //based on 100mhz clock, 9600 baud
            localparam Idle = 2'b00, Start = 2'b01, Data = 2'b10, End = 2'b11;
            reg [1:0] state, next_state;
            reg [15:0] clkcounter;
            reg [3:0] i; 
            reg sent; 
            reg [8:0] data;
            
            always @(posedge CLK) begin
                if (RST) begin
                    i <= 0;                
                    sent <= 1;
                    clkcounter <= 0;
                    next_state <= 0;
                    data <= 0;
                end else begin
                    //loads data
                    if (start_valid == 1 && sent == 1) begin 
                            data <= {data_input[0]^data_input[1]^data_input[2]^data_input[3] //even parity
                                     ^data_input[4]^data_input[5]^data_input[6]^data_input[7], data_input};
                    end
                    if (clkcounter == clkcomparer) begin   
                        case (state)
                        Idle: begin
                    //once it gets a full input, it gets a signal from receiver and starts the transmission of data
                             if (start_valid == 1) begin 
                                next_state <= Start;
                                sent <= 0; //locks the data
                                output_bit <= 1; // still high until it goes to start state
                            end else begin
                                output_bit <= 1; // Constant high
                            end
                        end
                        Start: begin
                            output_bit <= 0; //to let the reciever know the data is about to start.
                            next_state <= Data;
                        end
                        Data: begin
                            output_bit <= data[i];
                            if (i == 8) begin //includes parity.. i == 8 has parity
                                next_state <= End;
                                i <= 0;
                            end else begin
                                next_state <= Data;
                                i <= i + 1;
                            end
                        end
                        End: begin
                            output_bit <= 1; //stop bit
                            next_state <= Idle;
                            sent <= 1;
                            data <= 0;
                        end
                        default: begin
                            output_bit <= 1;
                            next_state <= state;
                        end
                    endcase
                        clkcounter <= 0;
                    end else begin
                        clkcounter <= clkcounter + 1;
                    end
                end
                state <= next_state; 
           end
           
  endmodule