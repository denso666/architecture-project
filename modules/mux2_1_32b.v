module mux2_1_32b (
	input [31:0] A, B,
	input SEL,
	output reg [31:0] R
);

	always @(*) begin
		if ( SEL ) R = B;
		else R = A;
		case ( SEL )
			0: R = A;
			1: R = B;
		endcase
	end

endmodule
