

module In2Out3_a(In, Out);
	output [2:0] Out;  
	input [1:0] In;

    wire w00= ~In[0] & ~In[1];
	wire w11;
	assign w11=In[0] & In[1];
	
	assign Out[0]= w00 | (In[0] & ~In[1]);
	assign Out[1]= (In[0] & ~In[1]) | (~In[0] & In[1]);
	assign Out[2]= w00 | (In[0] & ~In[1]) | (~In[0] & In[1]) | w11;
	
endmodule


module In2Out3_b(In, Out);
	output [2:0] Out;  
	input [1:0] In;

	
	assign Out= (In == 2'b00)? 3'b101 : 
                (In == 2'b01)? 3'b111 :
				(In == 2'b10)? 3'b110 :
				(In == 2'b10)? 3'b100 :
				3'bxxx;
	
endmodule



module In2Out3_c(In, Out);
	output [2:0] Out;  
	input [1:0] In;
	
	reg [2:0] Out;
	
	always @(*) begin
	    if(In == 2'b00) begin
		    Out = 3'b101;
		end
		else if (In == 2'b01) begin
		    Out = 3'b111;
		end 
		else begin
		    if(In == 2'b10) begin
			    Out = 3'b110;
			end
			else begin
			    Out = 3'b100;
			end
		end
	end

endmodule



module In2Out3_d(In, Out);
	output [2:0] Out;  
	input [1:0] In;
	
	reg [2:0] Out;

    always @(*) begin
        case (In)
            2'b00: Out = 3'b101;
            2'b01: Out = 3'b111;
            2'b10: Out = 3'b110;
            2'b11: Out = 3'b100;
            default: Out = 3'bxxx;
        endcase
    end
endmodule

