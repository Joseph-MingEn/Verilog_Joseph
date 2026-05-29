`timescale 1ns / 1ps

module TB_Lab6_2;

reg clk;
reg rst;
reg [1:0] sw;

wire [2:0] led;

Lab6_2_Top DUT(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .led(led)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    sw  = 2'b00;

    #20;
    rst = 0;

    // 最快
    #300;
    sw = 2'b01;

    // 中速
    #600;
    sw = 2'b10;

    // 慢速
    #800;
    sw = 2'b11;

    // 最慢
    #1000;

    $stop;

end

endmodule