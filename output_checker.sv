module output_checker(input[0:6] a, b, output logic diff);

always_comb
	if(a!=b)
		diff=1'b1;
	else
		diff=1'b0;
endmodule