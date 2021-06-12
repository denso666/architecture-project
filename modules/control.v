module control (
	input [5:0] OPCODE,
	output reg RegDst, Branch, MemRead, MemToReg,
	output reg [2:0] ALUOp,
	output reg MemWrite, ALUSrc, RegWrite
);

	always @(*) begin
		case (OPCODE)
			6'b000000: begin// R
				RegDst = 1;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b010;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 1;
			end
			6'b100011: begin// lw
				RegDst = 0;
				Branch = 0;
				MemRead = 1;
				MemToReg = 1;
				ALUOp = 3'b011;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
			end
			6'b101011: begin// sw
				RegDst = 1'bx;
				Branch = 0;
				MemRead = 0;
				MemToReg = 1'bx;
				ALUOp = 3'b011;
				MemWrite = 1;
				ALUSrc = 1;
				RegWrite = 0;
			end
			6'b000100: begin// beq
				RegDst = 1'bx;
				Branch = 1;
				MemRead = 0;
				MemToReg = 1'bx;
				ALUOp = 3'b100;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
			end
			6'b001000: begin// addi
				RegDst = 0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b011;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
			end
			6'b001100: begin// andi
				RegDst = 0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b111;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
			end
			6'b001101: begin// ori
				RegDst = 0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b101;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
			end
			6'b001010: begin// slti
				RegDst = 0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 3'b001;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
			end
		endcase
	end

endmodule
