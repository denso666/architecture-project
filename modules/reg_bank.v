module reg_bank (
	input [4:0] AR1, AR2, AW,
	input REG_WRITE,
	input [31:0] DIN,
	output reg [31:0] DR1, DR2
);

	reg [31:0] memory [0:31];
	integer i;

	// load 
	initial $readmemh("bank.mem", memory);

	always @* begin
		// write 
		if (REG_WRITE) memory[AW] = DIN;
		
		// read
		DR1 <= memory[AR1];
		DR2 <= memory[AR2];

		// only for testing, final state of memory
		if (AW == 5'd29) 
			for (i=0; i<32;i=i+1)
				$display("mem[%d]: %b",i,memory[i]);

	end

endmodule

