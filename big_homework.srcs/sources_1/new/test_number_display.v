`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/12 11:10:27
// Design Name: 
// Module Name: test_number_display
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

module test_number_display(
    input clk,
    output reg [7:0] led = 8'b1,
    output wire const_1
    );
reg [25:0] clk_cnt = 0;
reg ctrl = 0;
assign const_1 = 1;
always @(posedge clk) begin
    //if (clk_cnt < 5000000)
    if (clk_cnt <   50000000)
    //if (clk_cnt < 5)
        clk_cnt = clk_cnt + 1;
    else begin
        clk_cnt = 0;
        if (ctrl == 1) begin
            led = 8'b00000000;
            ctrl = 2;
        end
        if (ctrl == 2) begin
            led =  8'b00000001;
            ctrl = 0;
        end
        else
            led = led << 1;
        if (led == 8'b10000000)
            ctrl = 1;
        //if (led == 8'b00000001)
        else
            ctrl = 0;
        
    end
end 
endmodule