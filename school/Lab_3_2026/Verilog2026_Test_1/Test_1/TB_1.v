
`timescale 10ps / 1ps
module TB_FSM_1;

reg rst, clk, In;
wire [1:0] Out;

integer sim_out;

FSM_1 U_fsm(.clk(clk), .rst(rst), .In(In), .Out(Out)); 

always begin
#10
clk=~clk;
end

initial begin
    sim_out=$fopen("C:/Users/Administrator/Desktop/Classes/NTOU_20250201/Verilog_202502/Week7/Test_1/SimOut.txt", "w");
    rst= 1'b0;
	clk= 1'b0;
	In = 1'b0;
	
	#35  rst=1'b1;
	#20  rst=1'b0;
	#50 In = 1'b1;
	#100 In = 1'b0;
	#100 $fclose(sim_out);
	     $stop;
end
/*
always @(posedge clk) begin
    $fwrite(sim_out, "rst=%b, In=%b, CurrentState= 2'b%b%b, NextState= 2'b%b%b, Out= 2'b%b%b\n", 
        rst, In, 
        TB_FSM_1.U_fsm.Org_State[1], TB_FSM_1.U_fsm.Org_State[0], 
        TB_FSM_1.U_fsm.New_State[1], TB_FSM_1.U_fsm.New_State[0], 
        Out[1], Out[0]);
end
*/
endmodule

