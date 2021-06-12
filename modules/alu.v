module alu (
	input [31:0] A, B,
	input [2:0] SEL,
	output reg [31:0] R,
	output reg ZF
);
	always @(*) begin

		case (SEL)
			3'd0: R = A + B;
			3'd1: R = A - B;
			3'd2: R = A & B;
			3'd3: R = A | B;
			3'd4: R = (A < B) ? 32'd1 : 32'd0;
			3'd5: R = A * B;
			3'd6: R = A / B;
			3'd7: R = B << 0;
		endcase

		ZF <= (R) ? 0 : 1;
		// only for testing
		$display ("A:[%d], B:[%d], S[%b], R:[%d]", A, B, SEL, R);
	end

endmodule
