module STUDENT_ROM(
    input  [2:0] addr,
    output reg [3:0] data
);

always @(*) begin
    case(addr)
        3'd0: data = 4'h0; // A0
        3'd1: data = 4'h1; // A1
        3'd2: data = 4'h3; // A2
        3'd3: data = 4'h6; // A3
        3'd4: data = 4'hC; // A4
        3'd5: data = 4'h0; // A5
        3'd6: data = 4'h0; // A6
        3'd7: data = 4'h8; // A7
        default: data = 4'h0;
    endcase
end

endmodule