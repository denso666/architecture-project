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
				MemToReg = 0;
				ALUOp = 3'b010;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 1;
			end
			default: begin
				RegDst = 1'bx;
				Branch = 1'bx;
				MemRead = 1'bx;
				MemToReg = 1'bx;
				ALUOp = 3'b1x;
				MemWrite = 1'bx;
				ALUSrc = 1'bx;
				RegWrite = 1'bx;
			end

		endcase
	end

endmodule
