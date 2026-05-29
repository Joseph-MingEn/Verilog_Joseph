`timescale 1ns / 1ps

module TB_Lab6_1_Top;

reg clk;
reg rst;
wire [2:0] led;

Lab6_1_Top UUT(
    .clk(clk),
    .rst(rst),
    .led(led)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #100;
    rst = 0;

    #2000;
    $stop;
end

endmodule