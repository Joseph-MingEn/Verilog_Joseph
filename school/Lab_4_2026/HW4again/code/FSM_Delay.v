module FSM_Delay (clk, rst, Out);
input clk, rst;
output [3:0] Out;
reg [3:0] Out;
reg [2:0] Org_State, New_State;
reg [3:0] target_delay;
reg [3:0] stay_delay;
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin
        Org_State <= S0;
        target_delay <= 4'b0001;
        stay_delay <= 4'b0000;
    end
    else begin
        Org_State <= New_State;
        stay_delay <= stay_delay + 1;
        Out <= stay_delay;
    end
end
    
always @(*) begin
    if (target_delay == stay_delay) begin
        case (Org_State)
            S0: {New_State, target_delay} = {S1, 4'b0001 + 4'h0};
            S1: {New_State, target_delay} = {S2, 4'b0001 + 4'h1};
            S2: {New_State, target_delay} = {S3, 4'b0001 + 4'h3};
            S3: {New_State, target_delay} = {S4, 4'b0001 + 4'h6};
            S4: {New_State, target_delay} = {S5, 4'b0001 + 4'hC};
            S5: {New_State, target_delay} = {S6, 4'b0001 + 4'h0};
            S6: {New_State, target_delay} = {S7, 4'b0001 + 4'h0};
            S7: {New_State, target_delay} = {S7, 4'b0001 + 4'h8};
            default: {New_State, target_delay} = {S0, 4'b0001};
        endcase

        stay_delay <= 0;
    end
end

// always @(Org_State) begin
//     case (Org_State)
//         S0: Out = 4'b0000;
//         S1: Out = 4'b0001;
//         S2: Out = 4'b0011;
//         S3: Out = 4'b0110;
//         S4: Out = 4'b1100;
//         S5: Out = 4'b0000;
//         S6: Out = 4'b0000;
//         S7: Out = 4'b1000;
//         default: Out = 4'b0000;
//     endcase
// end
endmodule