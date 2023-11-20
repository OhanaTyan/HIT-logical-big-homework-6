`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 19:26:36
// Design Name: 
// Module Name: show_one_number
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



// checked
module show_one_number(
    input [3:0] the_number,
    output wire [7:0] output_leds
);
    reg [7:0] leds;
    always@(*)
        case (the_number)
        0: leds = 8'b00111111;
        1: leds = 8'b00000110;
        2: leds = 8'b01011011;
        3: leds = 8'b01001111;
        4: leds = 8'b01100110;
        5: leds = 8'b01101101;
        6: leds = 8'b01111101;
        7: leds = 8'b00000111;
        8: leds = 8'b01111111;
        9: leds = 8'b01101111;
        default: leds = 8'b00000000;
    endcase
    assign output_leds = leds;
endmodule
