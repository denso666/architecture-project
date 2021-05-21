module control (
	input [5:0] OPCODE,
	output reg RegDst, Branch, MemRead, MemToReg,
	output reg [2:0] ALUOp,
	output reg MemWrite, ALUSrc, RegWrite
);

	always @* begin
		case (OPCODE)

			6'b000000: begin
				RegDst = 1;
				Branch = 0;
				MemRead = 0;
				MemToReg = 1;
				ALUOp = 3'b010;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 1;
			end
			default: begin
				RegDst = x;
				Branch = x;
				MemRead = x;
				MemToReg = x;
				ALUOp = 3'bx;
				MemWrite = x;
				ALUSrc = x;
				RegWrite = x;
			end

		endcase
	end

endmodule
