`timescale 1ns/1ns
module test_bench;

	reg clk = 0;
	single_dp duv( clk );

	always begin 
		#100 clk = 1;
		#150 clk = 0;
	end

	initial begin
		$dumpfile("wave.vcd");
      	$dumpvars(0, test_bench);

      	#6000 $finish;
	end

endmodule
