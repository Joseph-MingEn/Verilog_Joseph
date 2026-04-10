
`timescale 1ns / 1ps
module FSM_2(clk, rst, CountOut, Org_State); 
input clk, rst;
output [3:0] CountOut;
reg [3:0] CountOut;
output [2:0] Org_State;

// State machine states
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

reg [2:0] Org_State;
reg [2:0] New_State;

//==== Org_State ===
//always @(posedge rst or posedge clk) begin
always @(posedge clk) begin
    if( (rst == 1'b1)) begin
	    Org_State <= S0;
	end
	else begin
		Org_State <= New_State;
	end
end

//==== New_State ===
always @(Org_State) begin
    case ( Org_State )
        S0: New_State = S1;
		S1: New_State = S2;
        S2: New_State = S3;
		S3: New_State = S4;
        S4: New_State = S5;
		S5: New_State = S6;
        S6: New_State = S7;
		S7: New_State = S7;
        default: New_State = S0;
    endcase
end

//==== Out ===
always @(Org_State) begin
    case ( Org_State )
        S0: CountOut = 4'h1;
		S1: CountOut = 4'hA;
        S2: CountOut = 4'h2;
		S3: CountOut = 4'hB;
        S4: CountOut = 4'h3;
		S5: CountOut = 4'hC;
        S6: CountOut = 4'h4;
		S7: CountOut = 4'hD;
        default: CountOut = 4'b0000;
    endcase
end

endmodule



