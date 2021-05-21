module test_bench;

	reg clk;

	single_dp duv( clk );
	
	always #10 clk = ~clk;

	initial begin
		$dumpfile("phase1.vcd");
      	$dumpvars(0, test_bench);

      	clk <= 0;

      	#160 $finish;
	end

endmodule