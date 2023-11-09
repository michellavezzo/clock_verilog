module maq_s (
input maqs_clock,
input maqs_reset,
input enable_1hz,
output logic [3:0] maqs_lsd,
output logic [2:0] maqs_msd,
output logic maqs_inc_minuto
);

// conectar o if(enable_1hz)

always_ff @(posedge maqs_clock or negedge maqs_reset)
	if (!maqs_reset) begin
		// $display ("MAQ_S_LSD: RESET");
		maqs_lsd <= 4'd0;
	end
	else begin
		// $display ("MAQ_S_LSD: else1");
		if(enable_1hz) begin
			// $display ("MAQ_S1_LSD: ENABLE 1HZ");
			if (maqs_lsd == 4'd9)
				maqs_lsd <= 4'd0;
			else
				maqs_lsd <= maqs_lsd + 4'd1;
		end
	end
			
always_ff @(posedge maqs_clock or negedge maqs_reset)
	if (!maqs_reset) begin
		// $display ("MAQ_S_MSD: RESET");
		maqs_msd <= 3'd0;
	end
	else
	if(enable_1hz) begin
		// $display ("MAQ_S_MSD: ENABLE 1HZ");
		if (maqs_lsd == 4'd9 && maqs_msd == 3'd5) begin
			// $display ("MAQ_S_MSD: ENABLE 1HZ IF1");
			maqs_msd <= 3'd0;
		end
		else begin
			// $display ("MAQ_S_MSD: ENABLE 1HZ ELSE1");
			if (maqs_lsd==4'd9) begin
				// $display ("MAQ_S_MSD: ENABLE 1HZ IF2");
				maqs_msd <= maqs_msd + 3'd1;
			end
			else begin
				// $display ("MAQ_S_MSD: ENABLE 1HZ ELSE2");
				maqs_msd <= maqs_msd;
			end
		end
	end
				
always_comb
	maqs_inc_minuto <= (maqs_msd == 3'd5 && maqs_lsd == 4'd9);
	
	
endmodule
