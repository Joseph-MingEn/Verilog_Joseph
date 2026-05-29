module Lab6_4_Top(
    input clk,
    input rst,
    input [1:0] div_sel,
    input [1:0] duty_sel,
    input lfsr_sel,
    output [3:0] led
);

wire slow_clk;
wire [3:0] lfsr_out;

Clock_Divider_Duty U0(
    .clk(clk),
    .rst(rst),
    .div_sel(div_sel),
    .duty_sel(duty_sel),
    .slow_clk(slow_clk)
);

Multi_LFSR_4LED U1(
    .clk(slow_clk),
    .rst(rst),
    .lfsr_sel(lfsr_sel),
    .q(lfsr_out)
);

assign led = lfsr_out;

endmodule