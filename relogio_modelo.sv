module relogio_modelo(
input CLOCK_50,
input KEY,
output logic [6:0] HEX0,
output logic [6:0] HEX1,
output logic [6:0] HEX2,
output logic [6:0] HEX3,
output logic [6:0] HEX4,
output logic [6:0] HEX5
);

relogio_model_2 reg1(
.main_clock(CLOCK_50),
.main_reset(KEY),
.s_lsd(HEX0),
.s_msd(HEX1),
.m_lsd(HEX2),
.m_msd(HEX3),
.h_lsd(HEX4),
.h_msd(HEX5)
);

// relogio reg1(
// .main_clock(CLOCK_50),
// .main_reset(KEY),
// .s_lsd(HEX0),
// .s_msd(HEX1),
// .m_lsd(HEX2),
// .m_msd(HEX3),
// .h_lsd(HEX4),
// .h_msd(HEX5)
// );

endmodule