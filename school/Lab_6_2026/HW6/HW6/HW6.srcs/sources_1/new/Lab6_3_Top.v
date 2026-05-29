`timescale 1ns / 1ps

module Lab6_3_Top(
    input clk,
    input rst,
    input [1:0] div_sel,    // 切換除頻倍率
    input [1:0] duty_sel,   // 切換 duty cycle
    output [2:0] led
);

wire slow_clk;
wire [2:0] lfsr_out;

Clock_Divider_Duty U0(
    .clk(clk),
    .rst(rst),
    .div_sel(div_sel),
    .duty_sel(duty_sel),
    .slow_clk(slow_clk)
);

LFSR_3bit U1(
    .clk(slow_clk),
    .rst(rst),
    .q(lfsr_out)
);

assign led = lfsr_out;

endmodule