module mux2_1_5b (
	input [4:0] A, B,
	input SEL,
	output reg [4:0] R
);

	always @* R = (!SEL) ? A : B;

endmodule
