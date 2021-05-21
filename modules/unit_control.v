module unit_control (
	input [5:0] OPCODE,
	output reg MtoREG, REGWRITE, MtoWRITE,
	output reg [2:0] ALUOP
);

	always @* begin
		case (OPCODE)

			6'b000000: begin
				MtoREG = 0;
				REGWRITE = 1;
				MtoWRITE = 0;
				ALUOP = 3'b010;
			end
			default: begin
				MtoREG = 1'bx;
				REGWRITE = 1'bx;
				MtoWRITE = 1'bx;
				ALUOP = 3'bx;				
			end

		endcase
	end

endmodule