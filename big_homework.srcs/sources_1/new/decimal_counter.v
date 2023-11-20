`timescale 1ns/1ps

/*module decimal_counter (
    input [3:0] input_ten_digit,
    input [3:0] input_one_digit,
    input       decrease_one,
    input       read_in,        // 如果为true，则读入数字
    input       stop_and_hold,
    output wire          alert,
    output wire[3:0]     output_ten_digit,
    output wire[3:0]     output_one_digit
);

reg [3:0]   reg_ten_digit   = 0;
reg [3:0]   reg_one_digit   = 0;
reg         reg_alert       = 0;
reg         reg_decrease_one= 0;
reg         reg_stop_and_hold=0;
reg         reg_have_read   = 0;
// reg_decrease_one 用于实现触发效果
/*
always @(*) begin
    case ({read_in, stop_and_hold})
    2'b10: begin 
        reg_read_in   = 0;
        reg_ten_digit = input_ten_digit;
        reg_one_digit = input_one_digit;
        reg_alert     = 0;
        reg_stop_and_hold = 0;
    end
    2'b00: begin
        //always @(posedge decrease_one) begin
        //@(posedge decrease_one) begin
        // �ʾ���ֻ����Ӧһ��������
        // ���Ҳ�����always
        //@(posedge decrease_one) begin
        /*if (decrease_one && ~reg_stop_and_hold) begin
            //if (reg_decrease_one) begin
            if (reg_one_digit == 4'b0000) begin
                if (reg_ten_digit == 4'b0000) reg_alert = 1;
                else begin
                    reg_alert = 0;
                    {reg_one_digit} = 9;
                    {reg_ten_digit} = {reg_ten_digit} - 1;
                    if (reg_one_digit == 4'b0000) begin
                        if (reg_ten_digit == 4'b0000) begin
                            reg_alert = 1;
                        end
                    end
                end
            end
            else begin
                {reg_one_digit} = {reg_one_digit} - 1;
            end
            //    #1 reg_decrease_one = 0;
            //end
            
        end

    end
    2'b01: begin
        reg_stop_and_hold = 1;
    end
    //2'b01: // �????么都不做就可�????
    default: begin // 不应该出现这种情�????
    end
    endcase

    assign output_ten_digit = reg_ten_digit;
    assign output_one_digit = reg_one_digit;
    assign alert            = reg_alert;

end
*/

// 重构目的：希望只�? read_in == 1 之后就可以计�?
// 在重构之前，只有等到 read_in 下降�? 0 之后才开始计�?

/*
    always @(*) begin
        if (read_in && reg_have_read==0) begin
            reg_have_read       = 1;
            reg_ten_digit       = input_ten_digit;
            reg_one_digit       = input_one_digit;
            reg_alert           = 0;
            reg_stop_and_hold   = 0;
        end

        else if (~read_in && stop_and_hold) begin
            reg_stop_and_hold   = 1;
            reg_have_read       = 0;
        end

        else if (
            (// 如果 read_in �? 1 且数字已经读入，即可以自减�?�或者数字为 0 �?
                ( read_in == 1 && reg_have_read   == 1 ) || ( read_in == 0 )
            ) && ( // 自减的另外的条件
                decrease_one && ~reg_stop_and_hold
            )
        ) 
        begin
            if (decrease_one && ~reg_stop_and_hold) begin
                if (reg_one_digit == 4'b0000) begin
                    if (reg_ten_digit == 4'b0000) reg_alert = 1;
                    else begin
                        reg_alert       = 0;
                        {reg_one_digit} = 9;
                        //{reg_ten_digit} = 9;
                        {reg_ten_digit} = {reg_ten_digit} - 1;
                        if (reg_one_digit == 4'b0000) begin
                            reg_alert   = 1;
                        end 
                    end
                end
                else begin
                    {reg_one_digit} = {reg_one_digit} - 1;
                end
            end
        end
    end

    assign output_ten_digit = reg_ten_digit;
    assign output_one_digit = reg_one_digit;
    assign alert            = reg_alert;

endmodule
*/


module decimal_counter(
    input [3:0] input_ten_digit,
    input [3:0] input_one_digit,
    input       clk,
    input       state,
    // 上升沿读入、计时开始，下降沿计时结束并保持
    output wire         alert,
    output wire [3:0]   output_ten_digit,
    output wire [3:0]   output_one_digit
    // 下面的变量用于调试
   //,output wire [25:0]  output_count_second
);

    reg [3:0]   reg_ten_digit   = 0;
    reg [3:0]   reg_one_digit   = 0;
    reg         reg_alert       = 0;
    reg [25:0]  count_second    = 0;
    reg         reg_have_read   = 0;

    initial begin
        reg_alert       = 0;
        reg_ten_digit   = 4'b0000;
        reg_one_digit   = 4'b0000;
        count_second    = 0;
    end

    always @(*) begin
        if (state && ~ reg_have_read) begin
            count_second    = 0;
            reg_ten_digit   = input_ten_digit;
            reg_one_digit   = input_one_digit;
            reg_have_read   = 1;
        end
        else if (state && reg_have_read) begin
            if (clk) count_second = count_second + 1;
            if (count_second == 4) begin 
            // TODO: 将这里的 四 改为 一后面八个零
                count_second = 0;
                if (reg_one_digit == 4'b0000) begin
                    if (reg_ten_digit == 4'b0000) reg_alert = 1;
                    else begin
                        reg_alert       = 0;
                        {reg_one_digit} = 9;
                        {reg_ten_digit} = {reg_ten_digit} - 1;
                        //if (reg_one_digit == 4'b0000) begin
                        //    reg_alert   = 1;    
                        //end
                    end
                end
                else begin
                    {reg_one_digit} = {reg_one_digit} - 1;
                    if (reg_one_digit==4'b0000 && reg_ten_digit==4'b0000) begin
                        reg_alert = 1;
                    end
                end
            end
        end
        else begin
            reg_have_read   = 0;
            reg_alert       = 0;
        end    
    end

    assign output_ten_digit = reg_ten_digit;
    assign output_one_digit = reg_one_digit;
    assign alert            = reg_alert;
    //assign output_count_second=count_second;  

endmodule



