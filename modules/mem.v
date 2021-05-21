module mem (
	input [31:0] addr,     
	input [31:0] data,
	input en_W,
	output reg [31:0] R
);

	reg [31:0] memory [0:31];

	always @* begin
	  if ( en_W ) begin
	  	memory[addr] <= data;
	  	R <= 32'bx;
	  end 

	  else R <= memory[addr];
	end

endmodule