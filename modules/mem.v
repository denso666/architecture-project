module mem (
	input [31:0] ADDR,
	input [31:0] DIN,
	input en_W,
	input en_R,
	output reg [31:0] R
);

	reg [31:0] memory [0:31];

	always @* begin

	  if ( en_W ) begin
	  	memory[ADDR] = DIN;
	  	R = 32'bx;
	  end

	  if ( en_R ) begin
		R = memory[ADDR];
	  end

	end

endmodule
