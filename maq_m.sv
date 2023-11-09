module maq_m (
input maqm_clock,
input reset,
input enable_1hz,
input inc_min,
output logic [3:0] maqm_lsd,
output logic [2:0] maqm_msd,
output logic maqh_inc_hora
);

always_ff @(posedge maqm_clock or negedge reset)
	if (!reset)
		maqm_lsd <= 4'd0;
	else
		if(enable_1hz && inc_min) begin
			if (maqm_lsd == 4'd9)
				maqm_lsd <= 4'd0;
			else
			maqm_lsd <= maqm_lsd + 4'd1;	
		end
			
always_ff @(posedge maqm_clock or negedge reset)
	if (!reset)
		maqm_msd <= 3'd0;
	else
		if(enable_1hz && inc_min) begin
			if (maqm_lsd == 4'd9 && maqm_msd == 3'd5)
				maqm_msd <= 3'd0;
			else
				if (maqm_lsd==4'd9)
				maqm_msd <= maqm_msd + 3'd1;
				else
				maqm_msd <= maqm_msd;
		end
				
always_comb
	maqh_inc_hora <= (maqm_msd == 3'd5 && maqm_lsd == 4'd9);
	
	
endmodule
