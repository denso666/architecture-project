module single_dp (input clk);

    //------------- PHASE 0
    wire [31:0] INS_ADDR, INS_PC, INS, out_adder1;

    pc fetch_0 ( INS_ADDR, clk, INS_PC );
    adder fetch_1 ( INS_PC, 32'd4, out_adder1 );
    ins_mem fetch_2 ( INS_PC, INS );


    //------------- PHASE 1
    wire RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire [2:0] ALUOp;

    control super (
        INS[31:26],
        RegDst,
        Branch,
        MemRead,
        MemToReg,
        ALUOp,
        MemWrite,
        ALUSrc,
        RegWrite
    );


    //------------- PHASE 2
    wire [4:0] mux_bank;
    wire [31:0] RD1, RD2, ext;

    mux2_1_5b pre_bank ( INS[20:16], INS[15:11], RegDst, mux_bank );
    reg_bank bank (
        INS[25:21],
        INS[20:16],
        mux_bank,
        RegWrite,
        WriteData,
        RD1,
        RD2
    );
    sing_extensor extensor ( INS[15:0], ext );


    //------------- PHASE 3
    wire [2:0] alu_c;
    wire [31:0] mux_alu, alu_out;
    wire z_flag;

    mux2_1_32b pre_alu ( RD2, ext, ALUSrc, mux_alu );
    alu_control a_control ( INS[5:0], ALUOp, alu_c );
    alu super_alu ( RD1, mux_alu, alu_c, alu_out, z_flag );


    //------------- PHASE 4
    wire [31:0] out_shift, out_adder2;

    shift_l s_left ( ext, out_shift );
    adder post_shift ( out_adder1, out_shift, out_adder2 );
    mux2_1_32b post_adder (
        out_adder1,
        out_adder2,
        (Branch && z_flag),
        INS_ADDR
    );


    //------------- PHASE 5
    wire [31:0] mem_out, WriteData;

    mem memory ( alu_out, RD2, MemWrite, MemRead, mem_out );
    mux2_1_32b post_memory ( mem_out, alu_out, MemToReg, WriteData );


endmodule // single_dp
