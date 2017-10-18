%esta solu??o n?o funciona.  quando se combinam os simbolos 2 a 2
%eventualmente vao haver simbolos repetidos, nao pode acontecer
%nao consegui ainda descobrir como vou resolver isto


function pl1_ex5(fonte)
alfabeto = pl1_ex3(fonte);
%agrupar simbolos do alfabeto 2 a 2:
%percorrer a matriz do alfabeto 2 vezes, e concatenar numa matriz de
% strings os s?mbolos 2 a 2.
m = 1;
dim = numel(alfabeto)^2;
disp(dim);
newalphabet = strings(dim, 1);

for i = 1:numel(alfabeto)
    for j = 1:numel(alfabeto)
        a = mat2str(alfabeto(i));
        b = mat2str(alfabeto(j));
        newalphabet(m) = strcat(a, b);
        m = m + 1;
    end
end
disp(newalphabet);

f = readfonte(fonte);
%tornar a fonte numa string
f = mat2str(f);
%percorrer a string e ver qual o numero de ocorr?ncias de cada s?mbolo do
%novo alfabeto
freq = zeros(numel(newalphabet), 1);
for n = 1:numel(newalphabet)
    freq(n) = count(f, newalphabet(n));
end

%numero medio de bits por s?mbolo
prob = freq./sum(freq);
HL = hufflen(prob);
HL = HL.*prob;
x = sum(HL) ./ numel(HL);
disp ('Numero medio de bits por simbolo:');
disp(x);
end

