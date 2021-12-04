`timescale 1ns/1ns
module mux2_1_5b (
	input [4:0] A, B,
	input SEL,
	output reg [4:0] R
);

	always @(*) begin
		case ( SEL )
			0: R <= A;
			1: R <= B;
		endcase
	end

endmodule // mux2_1_5b
