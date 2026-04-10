
`timescale 10ps / 1ps
module TB_FSM_0;

reg rst, clk, In;
wire [1:0] Out, OrgState, NewState;

integer sim_out;

FSM_0 U_fsm(.clk(clk), .rst(rst), .In(In), .Out(Out), .Org_State(OrgState), .New_State(NewState)); 

always begin
#10
clk=~clk;
end

initial begin
    rst= 1'b0;
	clk= 1'b0;
	In = 1'b0;
	
	#35  rst=1'b1;
	#20  rst=1'b0;
	#50 In = 1'b1;
	#100 In = 1'b0;
	#100 $stop;
end
endmodule

