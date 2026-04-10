
`timescale 1ns / 1ps
module TB_FSM_3;

reg rst, clk, SorG;
wire [3:0] CountOut;

integer sim_out;

FSM_3 U_counter(.clk(clk), .rst(rst), .CountOut(CountOut), .StoporGo(SorG) ); 

always begin
#10
clk=~clk;
end

initial begin
    sim_out=$fopen("C:/Users/Administrator/Desktop/Classes/NTOU_20250201/Verilog_202502/Week7/Test_1/SimOut3.txt", "w");
    rst = 1'b0;
	clk = 1'b0;
	SorG = 1'b0;
	
	#35  rst=1'b1;
	#20  rst=1'b0;
	#200 SorG = 1'b1;
	#200 SorG = 1'b0;
	#300 $fclose(sim_out);
	     $stop;
end

always @(posedge clk) begin
    $fwrite(sim_out, "rst=%b, CurrentState= 3'o%o, NextState= 3'o%o, CountOut= 4'h%h\n", 
        rst, 
        U_counter.Org_State[2:0],
        U_counter.New_State[2:0],
        CountOut[3:0]);
end

endmodule

