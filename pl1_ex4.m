function [x] = pl1_ex4(fonte)

%para a fonte, determinar a probabilidade de cada simbolo para utilizar na
%func hufflen()

[alfabeto] = pl1_ex3(fonte);
freq = zeros(numel(alfabeto),1);
for n = 1:numel(alfabeto)
    freq(n) = sum(fonte==alfabeto(n));
end
prob = freq./numel(fonte);

HL = hufflen(prob);
%HL length(bits) para cada simbolo 
%fazer media ponderada a partir de HL
%percorrer HL, multiplicar cada elemento pela sua prob, sum(HL) / numel(HL)

HL = HL.*prob;
x = sum(HL) ./ numel(HL);

disp('Numero medio de bits por simbolo: ')

%duvida: fazer com a matriz de frequencias ou a de probabilidades?
%o resultado e o mesmo