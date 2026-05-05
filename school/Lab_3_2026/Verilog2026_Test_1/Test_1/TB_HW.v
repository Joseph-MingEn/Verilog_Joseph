`timescale 1ns / 1ps
module TB_FSM_HW;

reg rst, clk, In, Rev;
wire [3:0] Out;

FSM_HW U_fsm(
    .clk(clk),
    .rst(rst),
    .In(In),
    .Out(Out),
    .Rev(Rev)
);

// 100 MHz clock, period = 10 ns
always begin
    #5 clk = ~clk;
end

initial begin
    clk = 1'b0;
    rst = 1'b1;
    In  = 1'b0;
    Rev = 1'b0;

    #50 rst = 1'b0;

    #50  In = 1'b1;   // 正數
    #200 Rev = 1'b1;  // 倒數
    #100 In = 1'b0;   // 暫停
    #100 In = 1'b1;   // 繼續
    #200 Rev = 1'b0;  // 回正數

    #300 $stop;
end

endmodule