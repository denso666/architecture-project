`timescale 1ns/1ns
module test_bench;

	reg clk = 0;
	single_dp duv( clk );

	always #50 clk <= ~clk;

	initial begin
		$dumpfile("wave.vcd");
      	$dumpvars(0, test_bench);
		#50

		clk <= 0;

      	#6000 $finish;
	end

endmodule
