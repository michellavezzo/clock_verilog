module maq_h (
input maqh_clock,
input reset,
output [3:0] maqh_lsd,
output [2:0] maqh_msd,
output maqh_inc_hora);

// so incrementa quando o output 

always_ff @(posedge maqh_clock or negedge reset)
	if (!maqh_reset)
		maqh_lsd <= 4'd0;
	else
	 	if (maqh_lsd == 4'd9)
			maqh_lsd <= 4'd0;
		else
		maqh_lsd <= maqh_lsd + 4'd1;			
			
always_ff @(posedge maqh_clock or negedge reset)
	if (!reset)
		maqh_msd <= 3'd0;
	else
		if (maqh_lsd == 4'd4 && maqh_msd == 3'd2)
			maqh_msd <= 3'd0;
			maqh_lsd <= 4'd0;
		else
			if (maqh_lsd==4'd9)
			maqh_msd <= maqh_msd + 3'd1;
			else
			maqh_msd <= maqh_msd;
				
always_comb
// output pro display
	maqh_inc_hora <= (maqh_msd == 3'd5 && maqh_lsd == 4'd9);
	
	
endmodule
