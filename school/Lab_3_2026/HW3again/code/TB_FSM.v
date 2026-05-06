`timescale 1ns/1ps

module TB_FSM;
reg clk, rst, In, rev;
wire [3:0] Out1;
wire [4:0] Out2;
FSM_MealyModel U_FSM_MealyModel(.clk(clk), .rst(rst), .In(In), .Out(Out1), .rev(rev));
FSM_MoorModel U_FSM_MoorModel(.clk(clk), .rst(rst), .In(In), .Out(Out2));

always begin
    #10;
    clk=~clk;
end

initial
begin
    rst=1'b1;
    clk=1'b0;
    In=1'b0;
    rev=1'b0;

    #100 rst=1'b0;
    #100 In=1'b1;
    #100 rev=1'b1;
    #100 In=1'b0;
    #100 In=1'b1;
    #100 rev=1'b0;
    #300 $finish;
end
endmodule