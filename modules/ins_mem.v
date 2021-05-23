module ins_mem (
    input [31:0] ADDR,
    output reg [31:0] INS
);
    reg [7:0] mem [0:399];

    initial $readmemb ("mem/instructions.mem", mem);

    always @( ADDR ) begin
        INS = { mem[ADDR], mem[ADDR+1], mem[ADDR+2], mem[ADDR+3] };

        // only for testing
        //$display("INS: %b; ADDR: %d", INS, ADDR);
    end
endmodule
/* phase 1 instructions
000000 00001 00010 10100 00000 100000
000000 00101 00100 10101 00000 100010
000000 01000 00100 11000 00000 100100
000000 01010 01010 11001 00000 100101
000000 00101 01010 11010 00000 101010
000000 00000 00000 00000 00000 000000
*/
