`timescale 1ns/1ns
module reg_bank (
	input [4:0] AR1, AR2, AW,
	input REG_WRITE,
	input [31:0] DIN,
	output reg [31:0] DR1, DR2
);

	reg [31:0] memory [0:31];
	integer i;

	// load memory
	initial $readmemh("mem/bank.mem", memory);

	always @(*) begin

		// read
		DR1 <= memory[AR1];
		DR2 <= memory[AR2];

		// write
		if ( REG_WRITE ) memory[AW] <= DIN;

	end

endmodule // reg_back
