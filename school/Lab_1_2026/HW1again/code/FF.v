module FF (clk, rst, D, Q);
input clk, rst, D;
output Q;
reg Q;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin 
        Q <= 1'b0;
    end
    else begin
        Q <= D;
    end
end
    
endmodule