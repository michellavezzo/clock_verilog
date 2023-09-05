
module divisor (input rst, clk_in, output logic clk_out);
	logic [25:0] count;
	
	always_ff @(posedge clk_in)
	begin
		if(!rst)
			begin
				count <= 26'd0;
			end 
		else
		begin
			if(count == 26'd49999999)
				begin
					count <= 26'd0;
				end
			else
				count <= count + 26'd1;
		end
	end
	
always_comb
	clk_out <= (count == 26'd49999999);
endmodule


// Divisor para teste
//module divisor (input rst, clk_in, output logic clk_out);
//
//logic [1:0] count;
//
//always_ff @(posedge clk_in) 
// begin
// 
// if(!rst) 
//  begin
//		clk_out <= 0;
//		count <= 0;
//  end
// else
//  begin
//     if(count == 2'd1)
//	   begin
//		 clk_out <= ~ clk_out;
//		 count <= 2'd0;
//		end
//	  else
//	   count <= count + 2'd1;
//  end
// end
//
//
//endmodule