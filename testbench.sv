// topo da hierarquia no testbench. Sem sinais de entrada ou saida.
module testbench ();

// sinais para est�mulo. Neste exemplo, definidos neste arquivo.

logic clock;

logic reset;

//fios para interconex�o entre os m�dulos.

// logic [3:0]saida_duv, saida_modelo, saida_modelo2, saida_modelo3, saida_modelo4, saida_modelo5, saida_modelo6;
// saidas duv
logic [6:0] s_lsd;
logic [6:0] s_msd;
logic [6:0] m_lsd;
logic [6:0] m_msd;
logic [6:0] h_lsd;
logic [6:0] h_msd;
// saidas modelo
logic [6:0] s_lsd_model;
logic [6:0] s_msd_model;
logic [6:0] m_lsd_model;
logic [6:0] m_msd_model;
logic [6:0] h_lsd_model;
logic [6:0] h_msd_model;


logic error_detected_1, error_detected_2, error_detected_3, error_detected_4, error_detected_5, error_detected_6;

// conexoes

relogio_duv duv(
    .CLOCK_50(clock),
    .KEY(reset),
    .HEX0(s_lsd),
    .HEX1(s_msd),
    .HEX2(m_lsd),
    .HEX3(m_msd),
    .HEX4(h_lsd),
    .HEX5(h_msd)
    );
relogio_modelo referencia(
    .CLOCK_50(clock),
    .KEY(reset),
    .HEX0(s_lsd_model),
    .HEX1(s_msd_model),
    .HEX2(m_lsd_model),
    .HEX3(m_msd_model),
    .HEX4(h_lsd_model),
    .HEX5(h_msd_model)
    );
output_checker comparador_s_lsd(
    .a(s_lsd),
    .b(s_lsd_model),
    .diff(error_detected_1)
    );
output_checker comparador_s_msd(
    .a(s_msd),
    .b(s_msd_model),
    .diff(error_detected_2)
    );
output_checker comparador_m_lsd(
    .a(m_lsd),
    .b(m_lsd_model),
    .diff(error_detected_3)
    );
output_checker comparador_m_msd(
    .a(m_msd),
    .b(m_msd_model),
    .diff(error_detected_4)
    );
output_checker comparador_h_lsd(
    .a(h_lsd),
    .b(h_lsd_model),
    .diff(error_detected_5)
    );
output_checker comparador_h_msd(
    .a(h_msd),
    .b(h_msd_model),
    .diff(error_detected_6)
    );

initial // voc� pode ter v�rias constru��es initial-begin-end, tal como
	begin // m�ltiplos always comb em um mesmo module	
        clock=1'b0;
        reset=1'b0; // reset inativo. Valores default
        // #0 reset<=1'b0; // ap�s 20 passos de simula��o, o reset vai pra zero (ativo)
        #20 reset<=1'b1; // ap�s 20 passos de simula��o, o reset vai pra um (inativo)
        for (int i=1;i<5120000;i=i+1) //loop com 16 pulsos de clock para testar a sequencia do contador
            #1 clock<=~clock;  //a cada 10 passos de simula��o, o clock alterna
        $display ("PASSOU: Nao ha bugs!!");
        $stop; // a simula��o p�ra
    end
always @(posedge error_detected_1, error_detected_2, error_detected_3, error_detected_4, error_detected_5, error_detected_6) //sempre que houver borda positiva do houve erro
    begin
        $display ("FALHOU: Ha bugs!!"); //mensagem
        // if to check which error was detected, if has more than one error, it will show both

        if (error_detected_1 == 1'b1)
            $display ("Erro: Segundo lsd");
        if (error_detected_2 == 1'b1)
            $display ("Erro: Segundo msd");
        if (error_detected_3 == 1'b1)
            $display ("Erro: Minuto lsd");
        if (error_detected_4 == 1'b1)
            $display ("Erro: Minuto msd");
        if (error_detected_5 == 1'b1)
            $display ("Erro: Hora lsd");
        if (error_detected_6 == 1'b1)
            $display ("Erro: Hora msd");
        #10; // aguarda um pouco
        $stop; // a simula��o p�ra (antes que a mensagem PASSOU apare�a!)
    end
endmodule
