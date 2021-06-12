module mem (
	input [31:0] ADDR,
	input [31:0] DIN,
	input en_W,
	input en_R,
	output reg [31:0] R
);

	reg [31:0] memory [0:31];
	integer i;

	always @(*) begin

	  	if ( en_W ) begin
	  		memory[ADDR] = DIN;
	  		R = 32'bx;
	  	end

	  	if ( en_R ) R = memory[ADDR];

		$display("		Memorie");
		for (i=0; i<32; i=i+1) $display("mem[%d]: %d",i,memory[i]);

	end

endmodule
