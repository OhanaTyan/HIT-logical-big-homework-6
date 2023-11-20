`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/12 10:58:52
// Design Name: 
// Module Name: main
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

// ����������
/*module main(

    );

endmodule
*/
/*
module main(
    
);

endmodule
/*module decimal_number_decrease(
    
):

endmodule

/*
module main(
    input start, // P5
    input reset, // P4
    input [3:0] senshuu, // R2, M4, N4, R1
    input clk,  // P17
    output reg [7:0] leds,// 
    output reg choose_number_1, // G2
    output reg choose_number_2 // C2
};
    
endmodule

*/

module main(
    input add_10,   // U4
    input sub_10,   // R17
    input add_01,   // R11
    input sub_01,   // Y1, 
    input set,      // R15
    input clk,      // P17

    input in1,      // R2
    input in2,      // M4
    input in3,      // N4
    input in4,      // R1


    output wire [7:0]   output_leds_left,   // 7:D5 -> 0:B4
    output wire [7:0]   output_leds_right,  // 7:H2 -> 0:D4
    output wire         choose_ten_digit_left,  // G2
    output wire         choose_one_digit_left,  // C2
    output wire         choose_ten_digit_right, // G1
    output wire         choose_one_digit_right, // F1
    output wire         alert,                  // K2
    
);

    // -------------------------------------

    wire [3:0]  number_set_ten_digit;
    wire [3:0]  number_set_one_digit;
    wire [3:0]  time_show_ten_digit;
    wire [3:0]  time_show_one_digit;
    wire [7:0]  leds_number_set_right;
    wire [3:0]  number_show_on_right_ten_digit;

    wire [2:0]  number_of_competitor;
    wire        is_get_answered;
    wire [7:0]  
    
    reg         reg_choose_ten_digit_right;
    reg         reg_choose_one_digit_right;
    reg  [2:0]  state;
    reg         reg_alert;

    initial begin
        state = 1;
    end

    always @(*) begin
        if (state == 1) begin
            if (set) begin
                state = 2;
            end
        end
        if (state == 2) begin
            if (reg_alert==1 || is_get_answered==1) begin
                state = 4;
            end
        end
        if (state == 4) begin
            if (set) begin
                state = 1
            end
       end     
    end


    set_number u10(
        add10, 
        sub10, 
        add01, 
        sub01, 
        number_set_one_digit, 
        number_set_one_digit
    );

    decimal_counter u20(
        number_set_ten_digit,
        number_set_one_digit,
        clk,
        state[1],
        reg_alert,
        time_show_ten_digit,
        time_show_one_digit
    );

    show_two_number u30(
        time_show_ten_digit,
        time_show_one_digit,
        output_leds_left,
        choose_ten_digit_left,
        choose_one_digit_left
    );

    show_two_number u31(
        clk,
        number_show_on_right_ten_digit,
        number_show_on_right_ten_digit,
        output_leds_right,
        reg_choose_ten_digit_right
        reg_choose_one_digit_right
        //reg_choose_ten_digit_right,
        //reg_choose_one_digit_right
    );

    answer_handler u40(
        in1,
        in2,
        in3, 
        in4,
        state[0],
        number_of_competitor,
        is_get_answered
    );

//    assign output_leds_right[0] = (leds_number_set_right[0]&&state[0])||

    assign number_show_on_right_ten_digit[0] = (number_set_ten_digit[0]&&state[0])||(number_of_competitor[0]&&~state[2])
    assign number_show_on_right_ten_digit[1] = (number_set_ten_digit[1]&&state[0])||(number_of_competitor[1]&&~state[2])
    assign number_show_on_right_ten_digit[2] = (number_set_ten_digit[2]&&state[0])||(number_of_competitor[2]&&~state[2])

    assign alert = reg_alert;
    assign choose_ten_digit_right = (reg_choose_ten_digit_right&&state[0])||(1&&state[2]);
    assign choose_one_digit_right = (reg_choose_one_digit_right&&state[0]);

endmodule