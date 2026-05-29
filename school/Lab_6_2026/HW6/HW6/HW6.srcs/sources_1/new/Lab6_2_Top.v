`timescale 1ns / 1ps

module Lab6_2_Top(
    input clk,
    input rst,
    input [1:0] sw,      // 外部開關，切換除頻倍率
    output [2:0] led
);

wire slow_clk;
wire [2:0] lfsr_out;

Clock_Divider_Sel U0(
    .clk(clk),
    .rst(rst),
    .sel(sw),
    .slow_clk(slow_clk)
);

LFSR_3bit U1(
    .clk(slow_clk),
    .rst(rst),
    .q(lfsr_out)
);

assign led = lfsr_out;

endmodule