module FSM_MoorModel (clk, rst, In, Out);
input clk, rst, In;
output [4:0] Out;
reg [4:0] Out;
reg [2:0] Org_State, New_State;
parameter [2:0] S0 = 3'b000,
                S1 = 3'b001,
                S2 = 3'b010,
                S3 = 3'b011,
                S4 = 3'b100,
                S5 = 3'b101,
                S6 = 3'b110,
                S7 = 3'b111;

always @(posedge clk or posedge rst)
begin
    if(rst == 1'b1)
    begin
        Org_State <= S0;
    end
    else
    begin
        Org_State <= New_State;
    end
end

always @(*) begin
    if (In == 1'b1) begin
        case (Org_State)
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
end

always @(Org_State) begin
    case (Org_State)
        S0: Out = 5'b00000;
        S1: Out = 5'b00001 + Out;
        S2: Out = 5'b00011 + Out;
        S3: Out = 5'b00110 + Out;
        S4: Out = 5'b01100 + Out;
        S5: Out = 5'b00000 + Out;
        S6: Out = 5'b00000 + Out;
        S7: Out = 5'b01000 + Out;
        default: Out = 5'b00000 + Out;
    endcase    
end
endmodule