`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 05:39:18 PM
// Design Name: 
// Module Name: LED_Display
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


module LED_Display(input CLK, RST, output wire [6:0] LED, 
                   output wire [3:0] AN0);

        assign AN0 = 4'b1110;//display; //chooses which display to turn on         
        
        reg [3:0]  number;
        reg [26:0] counter; //to count to 100million
        reg        update; // to update value 
            
        always @(posedge CLK) begin
            if (!RST) begin
                if (counter == 27'd100000000) begin
                    update <= 1;
                    counter <= 27'd0; //reset counter
                end else 
                    counter <= counter + 27'd1;
                if (update == 1) begin
                    if (number == 4'd0) begin
                        number <= 4'd15;
                        update <= 0;
                    end else begin 
                        number <= number - 1;
                        update <= 0;
                    end
                end   
            end else begin
                counter <= 0;
                number  <= 4'd15;
                update  <= 0;
            end
        end 
        
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
             (number == 4'b1010) ? 7'b0001000:  // 10.A
             (number == 4'b1011) ? 7'b1100000:  // 11.b
             (number == 4'b1100) ? 7'b0110001:  // 12.C
             (number == 4'b1101) ? 7'b1000010:  // 13.d
             (number == 4'b1110) ? 7'b0110000:  // 14.E
             (number == 4'b1111) ? 7'b0111000:  // 15.F
                                   7'b1111111; //default 

endmodule
