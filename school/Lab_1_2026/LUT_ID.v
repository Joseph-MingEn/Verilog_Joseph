module B_xxxxxxxx(A0, A1, A2, D0, D1, D2, D3);
input A0, A1, A2;
output D0, D1, D2, D3;
reg D0, D1, D2, D3;

always @(*) begin
    case ({A2, A1, A0}) // 使用3位元組合輸入
        3'b000: {D0, D1, D2, D3} = 4'b0000;
        3'b001: {D0, D1, D2, D3} = 4'b0101;
        3'b010: {D0, D1, D2, D3} = 4'b1010;
        3'b011: {D0, D1, D2, D3} = 4'b1100;
        3'b100: {D0, D1, D2, D3} = 4'b0011;
        3'b101: {D0, D1, D2, D3} = 4'b0110;
        3'b110: {D0, D1, D2, D3} = 4'b0101;
        3'b111: {D0, D1, D2, D3} = 4'b1010;
        default: {D0, D1, D2, D3} = 4'b0000;
    endcase
end
endmodule