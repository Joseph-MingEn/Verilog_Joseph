`timescale 10ps / 1ps
module TB_FSM_HW_2;

reg rst, clk;
wire [4:0] CountOut;

wire [2:0] OrgState;

    integer sim_out;

    FSM_HW_2 U_counter(.clk(clk), .rst(rst), .CountOut(CountOut), .Org_State(OrgState)); 

    always begin
#10
clk=~clk;
end

initial begin
    sim_out=$fopen("C:/Users/Administrator/Desktop/Classes/NTOU_20250201/Verilog_202502/Week7/Test_1/SimOut2.txt", "w");
    rst= 1'b0;
	clk= 1'b0;
	
	#35  rst=1'b1;
	#20  rst=1'b0;
	#200 $fclose(sim_out);
	     $stop;
end


always @(posedge clk) begin
    //$fwrite(sim_out, "rst=%b, CurrentState= 3'o%o, NextState= 3'o%o, CountOut= 4'h%h\n", 
    $fwrite(sim_out, "rst=%b, CountOut= 5'h%h\n", 
        rst, 
        //U_counter.Org_State[2:0],
        //U_counter.New_State[2:0],
        CountOut[4:0]);
end


endmodule

