function [entropy] = pl1_ex4(fonte)

%para a fonte, determinar a probabilidade de cada simbolo para utilizar na
%func hufflen()

disp('funcao histograma')
[filepath,name,ext] = fileparts(fonte);


    

HL = hufflen(S);
%HL length(bits) para cada simbolo 
%fazer media a partir de HL
entropy = sum(HL) / length(HL);