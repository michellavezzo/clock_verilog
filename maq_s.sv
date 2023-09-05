module maq_s (
input maqs_clock,
input maqs_reset,
input enable_1hz,
output [3:0] maqs_lsd,
output [2:0] maqs_msd,
output maqs_inc_minuto);

// conectar o if(enable_1hz)

always_ff @(posedge maqs_clock or negedge maqs_reset)
	if (!maqs_reset)
		maqs_lsd <= 4'd0;
	else
		if(enable_1hz) begin
			if (maqs_lsd == 4'd9)
				maqs_lsd <= 4'd0;
			else
				maqs_lsd <= maqs_lsd + 4'd1;
		end
			
always_ff @(posedge maqs_clock or negedge maqs_reset)
	if (!maqs_reset)
		maqs_msd <= 3'd0;
	else
	if(enable_1hz) begin
		if (maqs_lsd == 4'd9 && maqs_msd == 3'd5)
			maqs_msd <= 3'd0;
		else
			if (maqs_lsd==4'd9)
			maqs_msd <= maqs_msd + 3'd1;
			else
			maqs_msd <= maqs_msd;
	end
				
always_comb
	maqs_inc_minuto <= (maqs_msd == 3'd5 && maqs_lsd == 4'd9);
	
	
endmodule
