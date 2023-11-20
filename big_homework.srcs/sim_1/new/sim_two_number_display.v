`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 18:23:06
// Design Name: 
// Module Name: sim_two_number_display
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

/*
module sim_two_number_display(

    );
reg [3:0] input_ten_digit;
reg [3:0] input_one_digit;
reg clk;
//output
wire [7:0] leds;
wire choose_ten_digit;
wire choose_one_digit;

initial 
    begin
        clk = 0;
        input_ten_digit = 4'b0000;
        input_one_digit = 4'b0000;
//       read_in         = 1;
        stop_and_hold   = 0;
        #20 read_in = 0;
        #1000 stop_and_hold = 1;
    end
always #20 clk = ~clk;
always #40 {input_ten_digit, input_one_digit} = {input_ten_digit, input_one_digit} + 1;
show_two_number u1(clk, input_ten_digit, input_one_digit, leds, choose_ten_digit,  choose_one_digit);
endmodule
*/