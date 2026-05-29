`timescale 1ns / 1ps

module TB_PIPELINE_Y;

reg clk;
reg rst;
wire [2:0] count;
wire [5:0] Y;

PIPELINE_Y U0(
    .clk(clk),
    .rst(rst),
    .count(count),
    .Y(Y)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #20;

    rst = 0;
    #150;

    $stop;
end

endmodule