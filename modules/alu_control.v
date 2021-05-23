module alu_control (
	input [5:0] FUNCTION,
	input [2:0] ALUOP,
	output reg [2:0] OP
);

	wire [8:0] control;
	assign control = {ALUOP, FUNCTION};

	always @* begin
		case (control)
			9'b010100000: OP=3'b000;// add
			9'b010100010: OP=3'b001;// sub
			9'b010100100: OP=3'b010;// and
			9'b010100101: OP=3'b011;// or
			9'b010101010: OP=3'b100;// slt
			9'b010011000: OP=3'b101;// mul
			9'b010011010: OP=3'b110;// div
			9'b010000000: OP=3'b111;// nop
			default: OP=3'bx;
		endcase
	end

endmodule
/*
add  -> 100000
sub  -> 100010
and  -> 100100
or   -> 100101
slt  -> 101010

xor  -> 100110
div  -> 011010
mult -> 011000
<<   -> 010000
nop  -> 000000
*/
