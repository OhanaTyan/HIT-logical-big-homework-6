`timescale 1ns / 1ps

// passed
module show_two_number(
    input               clk,
    input       [3:0]   input_ten_digit,
    input       [3:0]   input_one_digit,  
    output wire [7:0]   output_leds, // 十位
    output wire         choose_ten_digit, // G2
    output wire         choose_one_digit  // C2
);
    reg [7:0] reg_output_leds;
    reg [7:0] reg_ten_digit;
    reg [7:0] reg_one_digit;
    reg       reg_choose_ten_digit;
    reg       reg_choose_one_digit;
    wire[7:0] wire_ten_digit;
    wire[7:0] wire_one_digit;

    initial begin
        reg_output_leds = 8'b00000000;
        reg_ten_digit   = 8'b00000000;
        reg_one_digit   = 8'b00000000;
        reg_choose_one_digit = 0;
        reg_choose_ten_digit = 0;   
    end

    always@(*)
        case(clk)
        0: begin // 十位
            //reg_output_leds = reg_ten_digit;
            reg_output_leds = wire_ten_digit;
            reg_choose_ten_digit = 1;
            reg_choose_one_digit = 0;
        end
        default: begin // 个位
            //reg_output_leds = reg_one_digit;
            reg_output_leds = wire_one_digit;
            reg_choose_ten_digit = 0;
            reg_choose_one_digit = 1;
         end
    endcase
    
    
    show_one_number u1(input_ten_digit, wire_ten_digit);
    show_one_number u2(input_one_digit, wire_one_digit);
    //assign reg_ten_digit = wire_ten_digit;
    //assign reg_one_digit = wire_one_digit;
    //assign reg_choose_ten_digit = ~clk;
    //assign reg_choose_one_digit =  clk;
    //assign reg_output_leds = (wire_ten_digit&&clk) | (wire_one_digit&&~clk); 
    //assign output_leds = reg_output_leds;
    assign choose_ten_digit = clk;
    assign choose_one_digit = ~clk;
    //assign output_leds = (wire_ten_digit&&clk) | (wire_one_digit&&~clk);
    assign output_leds[0] = (wire_ten_digit[0]&&clk) | (wire_one_digit[0]&&~clk);
    assign output_leds[1] = (wire_ten_digit[1]&&clk) | (wire_one_digit[1]&&~clk);
    assign output_leds[2] = (wire_ten_digit[2]&&clk) | (wire_one_digit[2]&&~clk);
    assign output_leds[3] = (wire_ten_digit[3]&&clk) | (wire_one_digit[3]&&~clk);
    assign output_leds[4] = (wire_ten_digit[4]&&clk) | (wire_one_digit[4]&&~clk);
    assign output_leds[5] = (wire_ten_digit[5]&&clk) | (wire_one_digit[5]&&~clk);
    assign output_leds[6] = (wire_ten_digit[6]&&clk) | (wire_one_digit[6]&&~clk);
    assign output_leds[7] = (wire_ten_digit[7]&&clk) | (wire_one_digit[7]&&~clk);

    //assign choose_ten_digit = reg_choose_ten_digit;
    //assign choose_one_digit = reg_choose_one_digit;
endmodule
