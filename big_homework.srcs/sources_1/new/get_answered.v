`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 20:50:17
// Design Name: 
// Module Name: get_answered
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


module answer_handler(
    input   in1,    // R2
    input   in2,    // M4
    input   in3,    // N4
    input   in4     // R4
    input   reset,  // state[0]
    output wire [3:0]   number_of_competitor,
    output wire         is_get_answered
);
    reg [3:0]   reg_number_of_competitor;
    reg         reg_is_get_answered;


    initial begin
        reg_number_of_competitor    = 0;
        reg_is_get_answered         = 0;
    end    

    always @(*) begin
        if (reset) begin
            reg_number_of_competitor= 0;
            reg_is_get_answered     = 0;    
        end else begin
            if (in1) begin
                reg_number_of_competitor= 4'b0001;
                reg_is_get_answered     = 1;
            end else if (in2) begin
                reg_number_of_competitor= 4'b0010;
                reg_is_get_answered     = 1;
            end else if (in3) begin
                reg_number_of_competitor= 4'b0011;
                reg_is_get_answered     = 1;
            end else if (in4) begin
                reg_number_of_competitor= 4'b0100;
                reg_is_get_answered     = 1;
            end
        end
    end

    assign number_of_competitor = reg_number_of_competitor; 
    assign is_get_answered      = reg_is_get_answered;   
    
endmodule
