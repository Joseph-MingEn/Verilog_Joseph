
`timescale 10ps / 1ps
module TB_FSM_HW;

reg rst, clk, In, SorG;
wire [3:0] Out;

integer sim_out;

FSM_HW U_fsm(.clk(clk), .rst(rst), .In(In), .Out(Out), .StoporGo(SorG) );

always
begin
    #10
     clk=~clk;
end

initial
begin
    sim_out=$fopen("C:\\Users\\user\\Documents\\GitHub\\Verilog_Joseph\\school\\Lab_3_2026\\Verilog2026_Test_1\\Test_1\\SimOut.txt", "w");
    rst= 1'b0;
    clk= 1'b0;
    In = 1'b0;
	SorG = 1'b1;

    #35  rst=1'b1;
    #20  rst=1'b0;
    #50 In = 1'b1;
	#200 SorG = 1'b0;
	#200 SorG = 1'b1;
    #185 In = 1'b0;
    #1000 $fclose(sim_out);
    $stop;
end
/*
always @(posedge clk) begin
    $fwrite(sim_out, "rst=%b, In=%b, CurrentState= 3'b%b%b%b, NextState= 3'b%b%b%b, Out= 4'b%b%b%b%b\n", 
        rst, In, 
        TB_FSM_HW.U_fsm.Org_State[2], TB_FSM_HW.U_fsm.Org_State[1], TB_FSM_HW.U_fsm.Org_State[0], 
        TB_FSM_HW.U_fsm.New_State[2], TB_FSM_HW.U_fsm.New_State[1], TB_FSM_HW.U_fsm.New_State[0], 
        Out[3], Out[2], Out[1], Out[0]);
end
*/
endmodule

