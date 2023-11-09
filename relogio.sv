module relogio (
input main_clock,
input main_reset,
output logic [6:0] s_lsd,
output logic [6:0] s_msd,
output logic [6:0] m_lsd,
output logic [6:0] m_msd,
output logic [6:0] h_lsd,
output logic [6:0] h_msd
);
	
	// todo: add enable maquinas
	// todo: passar inc minuto pra m_min e inc hora para m_hora
	
	// todo arrumado:
	
	// ADD m_seg enable_1hz
	// ADD m_min enable_1hz, inc_minuto 
	// ADD m_hora enable_1hz, inc_hora
	
	// relatorio 4 topicos no sigaa
	// projeto arquitetuira
	// quartus, configura]coes
	// codigo, formas de onda 
	
	logic enable1hz;
	
	divisor _enable_1hz (
		.rst(main_reset), 
		.clk_in(main_clock), 
		.clk_out(enable1hz)
	);
	
	logic [3:0] s_lsd_bcd = 4'd0;
	logic [2:0] s_msd_bcd = 3'd0;
	logic inc_hora = 4'd0;
	logic inc_minuto = 4'd0;
	

	maq_s m_seg (
		.maqs_clock(main_clock),
		.maqs_reset(main_reset),
		.enable_1hz(enable1hz),
		.maqs_lsd(s_lsd_bcd),
		.maqs_msd(s_msd_bcd),
		.maqs_inc_minuto(inc_minuto)
	);
	
		// seg lsd
	display_bcd display_seg_lsd(
		.bcd_bcd_in(s_lsd_bcd),
		.bcd_display_out(s_lsd)
	);
	
	// seg msd
	display_bcd display_seg_msd(
		.bcd_bcd_in({1'b0, s_msd_bcd}),
		.bcd_display_out(s_msd)
	);
	
	logic [3:0] m_lsd_bcd = 4'd0;
	logic [2:0] m_msd_bcd = 3'd0;
	maq_m m_min (
		.maqm_clock(main_clock),
		.reset(main_reset),
		.enable_1hz(enable1hz),
		.inc_min(inc_minuto),
		.maqm_lsd(m_lsd_bcd),
		.maqm_msd(m_msd_bcd),
		.maqh_inc_hora(inc_hora)
	);
	
	// m lsd
	display_bcd display_m_lsd(
		.bcd_bcd_in(m_lsd_bcd),
		.bcd_display_out(m_lsd)
	);
	
	// m msd
	display_bcd display_m_msd(
		.bcd_bcd_in({1'b0, m_msd_bcd}),
		.bcd_display_out(m_msd)
	);
	
	logic [3:0] h_lsd_bcd = 4'd0;
	logic [2:0] h_msd_bcd = 3'd0;
	maq_h m_hora (
		.maqh_clock(main_clock),
		.reset(main_reset),
		.enable_1hz(enable1hz),
		.inc_h(inc_hora),
		.inc_m(inc_minuto),
		.maqh_lsd(h_lsd_bcd),
		.maqh_msd(h_msd_bcd)
	);
	
	// h lsd
	display_bcd display_h_lsd(
		.bcd_bcd_in(h_lsd_bcd),
		.bcd_display_out(h_lsd)
	);
	
	// h msd
	display_bcd display_h_msd(
		.bcd_bcd_in({1'b0, h_msd_bcd}),
		.bcd_display_out(h_msd)
	);
	
endmodule