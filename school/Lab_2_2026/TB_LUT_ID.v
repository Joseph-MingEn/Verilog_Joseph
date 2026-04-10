`timescale 1ns / 1ps

module TB_LUT_ID;
wire [2:0] Out;
reg [1:0] In;

//In2Out3_a LUT_2I3O(.In(In), .Out(Out));
//In2Out3_b LUT_2I3O(.In(In), .Out(Out));
//In2Out3_c LUT_2I3O(.In(In), .Out(Out));
In2Out3_d LUT_2I3O(.In(In), .Out(Out));

initial
begin

    In=2'b00;
	
	#10  In=2'b01;
	
	#10  In=2'b10;
	
	#10  In=2'b11;
	
	#10  $stop;
	
end

endmodule

