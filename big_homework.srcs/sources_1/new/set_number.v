`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 19:45:15
// Design Name: 
// Module Name: set_number
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


module set_number(
    input   add_10, // U4
    input   sub_10, // R17
    input   add_01, // R11
    input   sub_01, // V1
    //input   set   , // R15
    output wire [3:0]   output_ten_digit,
    output wire [3:0]   output_one_digit
);

    reg [3:0]   reg_ten_digit;
    reg [3:0]   reg_one_digit;

    initial begin
        reg_ten_digit = 5;
        reg_one_digit = 0;
    end

    always @(*) begin

    end

    assign output_ten_digit = reg_ten_digit;
    assign output_one_digit = reg_one_digit;

endmodule
