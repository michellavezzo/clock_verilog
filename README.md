# clock_verilog
First Project for  STRUCTURED DESIGN OF INTEGRATED CIRCUITS discipline at UFPB. 24h clock with verilog

 - Funcionalidade: relógio digital
 - Entradas: sinal de clock de 50MHz, reset
 - Saídas: 6 x 7 saídas (6 displays de 7 segment
![image](https://github.com/michellavezzo/clock_verilog/assets/38358577/53c3c53b-6cde-4934-8a52-bc315dbcba2c)


https://sig-arq.ufpb.br/arquivos/20232200390b125557224d341662704c1/Metodologia_Top_Down_e_Projeto_01.pptx.pdf

- Apresentação: https://docs.google.com/presentation/d/1Oy-dsdT_-rm48v0Qt0V0dIrS-D5LyxBHKZlPAAGE0Gw/edit?usp=sharing
- Relatório: https://docs.google.com/document/d/1sfhE9NO7-pxY_WpgYsPGobKenIi9OQyMUHDMDFiJpFU/edit?usp=sharing

# Part 2 - Functional verification (Modelsim)
- Relatório: https://docs.google.com/document/d/1gQbyc7YqgM2i0S7PUEcjjVg20sU4GWhu3YzOx_Y2t1c/edit?usp=sharing
## Testbench implementation
![image](https://github.com/michellavezzo/clock_verilog/assets/38358577/266c9be6-3836-45b8-9369-ceca8b22657b)
- Modelsim screenshot

### Docs: 

- https://sig-arq.ufpb.br/arquivos/20230041383b3f583609168490c2c3365/Avaliao_Unidade_3_Concepo_-_2023.1.pdf
- https://sig-arq.ufpb.br/arquivos/20230060367a45581203419a141f5fd0b/Introduo_a_Verificao_Funcional.pptx.pdf

###### OBS: There is a known error at modelsim simulation. 
- ![image](https://github.com/michellavezzo/clock_verilog/assets/38358577/028e75c5-69c6-418b-8d12-279a75773fb9)
- For some reason, the first "run -all" detects a bug.
- ![image](https://github.com/michellavezzo/clock_verilog/assets/38358577/7f0efee0-6b84-4581-aa68-03886cc86d8a)
- Just click at continue to continue the expected simulation 
