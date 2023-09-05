module casca(
input CLOCK_50,
input [3:0] KEY,
output logic [0:6] HEX0,
output logic [0:6] HEX1,
output logic [0:6] HEX2,
output logic [0:6] HEX3,
output logic [0:6] HEX4,
output logic [0:6] HEX5
);

relogio reg1(
.clock(CLOCK_50),
.reset(KEY[0]),
.s_lsd(HEX0),
.s_msd(HEX1),
.m_lsd(HEX2),
.m_msd(HEX3),
.h_lsd(HEX4),
.h_msd(HEX5)
);

endmodule

