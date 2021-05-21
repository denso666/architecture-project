module mux2_1_32b (
	input [31:0] A, B,
	input SEL,
	output reg [31:0] R
);

	always @* begin
		if (SEL) R <= A;
		else R <= B;
	end

endmodule
