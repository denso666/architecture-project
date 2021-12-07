`timescale 1ns/1ns
module mem (
	input [31:0] ADDR,
	input [31:0] DIN,
	input en_W,
	input en_R,
	output reg [31:0] R
);

	reg [31:0] memory [0:31];

	initial $readmemb("mem/data.mem", memory);

	always @(*) begin

		// enable write
	  	if ( en_W ) begin
	  		memory[ADDR] <= DIN;
	  		R <= 32'bx;
	  	end

		// enable read
	  	else if ( en_R ) R <= memory[ADDR];

		// any option
		else R <= 32'bx;
	end

endmodule // mem
