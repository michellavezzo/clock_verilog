module relogio (
input main_clock
input main_reset
input maq_s
input maq_m
input maq_h
output [3:0] s_lsd,
output [2:0] s_msd,
output [3:0] m_lsd,
output [2:0] m_msd,
output [3:0] h_lsd,
output [2:0] h_msd,
);

// modulo 7seg
// modulo divisor de clock

	logic inc_minuto
	logic inc_hora

	maq_s m_seg (
		.maqs_clock(main_clock)
		.maqs_reset(main_reset)
		.maqs_lsd(s_lsd)
		.maqs_msd(s_msd)
		.maqs_inc_minuto(inc_minuto)
	);
	
	maq_m m_min (
		.maqm_clock(inc_minuto)
		.reset(main_reset)
		.maqm_lsd(m_lsd)
		.maqm_msd(m_msd)
		.maqh_inc_hora(inc_hora)
	);
	
	maq_h m_min (
		.maqh_clock(inc_minuto)
		.reset(main_reset)
		.maqm_lsd(m_lsd)
		.maqm_msd(m_msd)
		.maqh_inc_hora(inc_hora)
	);
	
	// conectar as maquinas a saida do display
	
	

endmodule