`timescale 1ns/1ps

module TB_FSM_Delay;
reg clk, rst;
wire [3:0] Out;

FSM_Delay U_FSM_Delay(.clk(clk), .rst(rst), .Out(Out));
always begin
#10
clk=~clk;
end

initial
begin
    rst=1'b1;
    clk=1'b0;
    
    #100 rst=1'b0;
    #1000 $finish;
end

endmodule