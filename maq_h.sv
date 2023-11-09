module maq_h (
input maqh_clock,
input reset,
input enable_1hz,
input inc_h,
input inc_m,
output logic [3:0] maqh_lsd,
output logic [2:0] maqh_msd
);

// so incrementa quando o output 
// inc segundo 
always_ff @(posedge maqh_clock or negedge reset)
	if (!reset)
		maqh_lsd <= 4'd0;
	else begin
	if(enable_1hz && inc_h && inc_m) begin
		if (maqh_lsd == 4'd9 || (maqh_lsd == 4'd4 && maqh_msd == 3'd2))
			maqh_lsd <= 4'd0;
		else
			maqh_lsd <= maqh_lsd + 4'd1;	
	end
	end
			
always_ff @(posedge maqh_clock or negedge reset)
	if (!reset)
		maqh_msd <= 3'd0;
	else begin
		if(enable_1hz && inc_h && inc_m) begin
			if (maqh_lsd == 4'd4 && maqh_msd == 3'd2) begin
				maqh_msd <= 3'd0;
				end
			else begin
				if (maqh_lsd==4'd9)
				maqh_msd <= maqh_msd + 3'd1;
				else
				maqh_msd <= maqh_msd;
			end
		end
	end
endmodule
