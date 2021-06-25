`timescale 1ns/1ns
module single_dp (input clk);

    //------------- PHASE 0
    wire [31:0] inMuxA, inMuxB, outMux0, outMuxJump, outPC, outInsMem;
    wire PCSrc;
    wire [27:0] out_shift_jump;
    //------------- BUFFER 0
    wire [31:0] A0, B0;


    //------------- PHASE 1
    wire RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, Jump;
    wire [2:0] ALUOp;
    wire [31:0] RD1, RD2, ext, final_WriteData;
    //------------- BUFFER 1
    wire [31:0] A1, B1, C1, D1;
    wire [4:0] E1, F1;
    wire [1:0] outB_WB1;
    wire [3:0] outB_M1;
    wire [4:0] outB_EX1;


    //------------- PHASE 2
    wire [2:0] alu_c;
    wire [31:0] mux_alu, alu_out, out_shift, out_adder2;
    wire [4:0] out_mux_wb;
    wire z_flag;
    //------------- BUFFER 2
    wire [31:0] C2, D2;
    wire B2;
    wire [4:0] E2;
    wire [1:0] outB_WB2;
    wire [3:0] outB_M2;


    //------------- PHASE 3
    wire [31:0] mem_out;
    //------------- BUFFER 3
    wire [31:0] A3, B3;
    wire [4:0] C3;
    wire [1:0] outB_WB3;


    //------------- PHASE 0
    mux2_1_32b mux0( inMuxA, inMuxB, PCSrc, outMux0 );
    pc pcontrol ( clk, outMuxJump, outPC );
    adder adder_ins ( outPC, 32'd4, inMuxA );
    ins_mem instructions ( outPC, outInsMem );

    shift_l_2628 slJump ( outInsMem[25:0], out_shift_jump );
    mux2_1_32b muxJump ( outMux0, {out_shift_jump, inMuxA[3:0]}, outB_M2[3], outMuxJump );

    //------------- BUFFER 0
    buffer_a b0 (
        clk,
        inMuxA, outInsMem,
        A0, B0
    );

    //------------- PHASE 1
    control super (
        B0[31:26],
        RegDst,
        Branch,
        MemRead,
        MemToReg,
        ALUOp,
        MemWrite,
        ALUSrc,
        RegWrite,
        Jump
    );
    reg_bank bank (
        B0[25:21],
        B0[20:16],
        C3,
        outB_WB3[1],
        final_WriteData,
        RD1,
        RD2
    );
    sign_extensor extensor ( B0[15:0], ext );

    //------------- BUFFER 1
    buffer_wb  b_wb1 ( clk, {RegWrite,MemToReg},       outB_WB1 );
    buffer_m   b_m1  ( clk, {Jump,Branch,MemRead,MemWrite}, outB_M1 );
    buffer_ex  b_ex1 ( clk, {RegDst,ALUOp,ALUSrc},     outB_EX1 );
    buffer_b   b1    (
        clk,
        A0, RD1, RD2, ext, B0[20:16],B0[15:11],
        A1, B1, C1, D1, E1, F1
    );

    //------------- PHASE 2
    shift_l s_left ( D1, out_shift );
    adder post_shift ( A1, out_shift, out_adder2 );
    mux2_1_32b pre_alu ( C1, D1, outB_EX1[0], mux_alu );
    alu_control a_control ( D1[5:0], outB_EX1[3:1], alu_c );
    alu super_alu ( B1, mux_alu, alu_c, alu_out, z_flag );
    mux2_1_5b write_back ( E1, F1, outB_EX1[4], out_mux_wb );

    //------------- BUFFER 2
    buffer_wb  b_wb2 ( clk, outB_WB1, outB_WB2 );
    buffer_m   b_m2  ( clk, outB_M1, outB_M2 );
    buffer_c   b2 (
        clk,
        out_adder2, z_flag, alu_out, C1, out_mux_wb,
        inMuxB, B2, C2, D2, E2
    );


    //------------- PHASE 3
    and1b and_branch ( outB_M2[2], B2, PCSrc );
    mem memory ( C2, D2, outB_M2[0], outB_M2[1], mem_out );

    //------------- BUFFER 3
    buffer_wb  b_wb3 ( clk, outB_WB2, outB_WB3 );
    buffer_d b3 (
        clk,
        mem_out, C2, E2,
        A3, B3, C3
    );

    //------------- PHASE 5
    mux2_1_32b post_memory ( B3, A3, outB_WB3[0], final_WriteData );


endmodule // single_dp
