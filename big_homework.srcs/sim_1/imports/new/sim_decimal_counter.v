`timescale  1ps/1ps

module sim_decimal_counter(

);
    reg [3:0] input_ten_digit;
    reg [3:0] input_one_digit;
    reg decrease_one;
    reg stop_and_hold;
    wire [3:0] output_ten_digit;
    wire [3:0] output_one_digit;
    wire alret;

    initial begin
        decrease_one = 0;
        input_ten_digit = 9;
        input_one_digit = 9;

    end

    always #1 decrease_one = ~decrease_one;
    decimal_counter(
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