
`timescale 1ns / 1ps
module FSM_0(clk, rst, In, Out, Org_State, New_State); 
input clk, rst, In;
output [1:0] Out, Org_State, New_State;
reg [1:0] Out;


reg [1:0] Org_State;
reg [1:0] New_State;

//==== Org_State ===
//always @(posedge rst or posedge clk) begin
always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Org_State <= 2'b00;
	end
	else begin
		Org_State <= New_State;
	end
end

//==== New_State ===
always @(Org_State or In) begin
    case ( {Org_State, In} )
        {2'b00, 1'b0}: New_State = 2'b00;
		{2'b00, 1'b1}: New_State = 2'b01;
        {2'b01, 1'b0}: New_State = 2'b10;
		{2'b01, 1'b1}: New_State = 2'b11;
        {2'b10, 1'b0}: New_State = 2'b00;
		{2'b10, 1'b1}: New_State = 2'b01;
        {2'b11, 1'b0}: New_State = 2'b11;
		{2'b11, 1'b1}: New_State = 2'b10;
        default: New_State = 2'b00;
    endcase
end

//==== Out ===
always @(Org_State or In) begin
    case ( {Org_State, In} )
        {2'b00, 1'b0}: Out = 2'b00;
		{2'b00, 1'b1}: Out = 2'b11;
        {2'b01, 1'b0}: Out = 2'b10;
		{2'b01, 1'b1}: Out = 2'b01;
        {2'b10, 1'b0}: Out = 2'b01;
		{2'b10, 1'b1}: Out = 2'b01;
        {2'b11, 1'b0}: Out = 2'b11;
		{2'b11, 1'b1}: Out = 2'b00;
        default: Out = 2'b00;
    endcase
end

endmodule

