module alu_control (
	input [5:0] FUNCTION,
	input [2:0] ALUOP,
	output reg [2:0] OP
);

	always @(*) begin
		case ( ALUOP )
			3'b010: begin // R type
				case ( FUNCTION )
					6'b100000: OP=3'b000;// add
					6'b100010: OP=3'b001;// sub
					6'b100100: OP=3'b010;// and
					6'b100101: OP=3'b011;// or
					6'b101010: OP=3'b100;// slt
					6'b011000: OP=3'b101;// mul
					6'b011010: OP=3'b110;// div
					6'b000000: OP=3'b111;// nop
				endcase
			end
			3'b011: OP=3'b000; // add
			3'b100: OP=3'b001; // sub
			3'b111: OP=3'b010; // and
			3'b101: OP=3'b011; // or
			3'b001: OP=3'b100; // slt
		endcase
	end

endmodule
