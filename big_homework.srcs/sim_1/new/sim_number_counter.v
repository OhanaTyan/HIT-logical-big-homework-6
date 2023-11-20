`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 21:55:23
// Design Name: 
// Module Name: sim_number_counter
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
module sim_number_counter(

);
    reg [3:0] input_ten_digit;
    reg [3:0] input_one_digit;
    reg decrease_one;
    reg read_in;
    reg stop_and_hold;
    wire [3:0] output_ten_digit;
    wire [3:0] output_one_digit;
    wire alert;

    initial begin
        decrease_one    = 0;
        input_ten_digit = 9;
        input_one_digit = 9;
        read_in         = 1;
        stop_and_hold   = 0;
        #4 read_in      = 0;
        #30 stop_and_hold = 1;
        #35 stop_and_hold = 0;
        #36 read_in     = 1;
        #37 read_in     = 0;
        
    end

    always #1 decrease_one = ~decrease_one;
    decimal_counter u1(
        input_ten_digit, 
        input_one_digit, 
        decrease_one,
        read_in,
        stop_and_hold,
        alert,
        output_ten_digit,
        output_one_digit
    );
endmodule

*/

module sim_number_counter(

);
    reg [3:0]   input_ten_digit;
    reg [3:0]   input_one_digit;
    reg         clk;
    reg         state;
    wire        alert;
    wire[3:0]   output_ten_digit;
    wire[3:0]   output_one_digit;
    //wire[25:0]  output_count_second;

    initial begin
        clk             = 0;
        input_ten_digit = 9;
        input_one_digit = 9;
        state           = 0;
    #2  state           = 1;
    #40 state           = 0;
    #42 state           = 1;
    end

    always #1 clk = ~clk;
    decimal_counter u1(
        input_ten_digit,
        input_one_digit,
        clk,
        state,
        alert,
        output_ten_digit,
        output_one_digit
    //   ,output_count_second
    );

endmodule

