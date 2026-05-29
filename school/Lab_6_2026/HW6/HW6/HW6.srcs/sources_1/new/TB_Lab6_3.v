`timescale 1ns / 1ps

module TB_Lab6_3;

reg clk;
reg rst;
reg [1:0] div_sel;
reg [1:0] duty_sel;

wire [2:0] led;

Lab6_3_Top DUT(
    .clk(clk),
    .rst(rst),
    .div_sel(div_sel),
    .duty_sel(duty_sel),
    .led(led)
);

// 100MHz clock，週期 10ns
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    div_sel = 2'b00;
    duty_sel = 2'b00;

    #30;
    rst = 0;

    // 測 25% duty
    duty_sel = 2'b00;
    #300;

    // 測 50% duty
    duty_sel = 2'b01;
    #300;

    // 測 75% duty
    duty_sel = 2'b10;
    #300;

    // 測保留模式，當 50%
    duty_sel = 2'b11;
    #300;

    $stop;
end

endmodule