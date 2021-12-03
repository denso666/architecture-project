`timescale 1ns/1ns
module mux2_1_32b (
	input [31:0] A, B,
	input SEL,
	output reg [31:0] R
);

	always @(*) begin
		case ( SEL )
			0: R <= A;
			1: R <= B;
		endcase
	end

endmodule
