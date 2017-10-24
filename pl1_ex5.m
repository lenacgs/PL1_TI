%como o alfabeto de onde agrupamos os s?mbolos j? n?o tem simbolos
%repetidos, entao o novo alfabeto n?o vai ter simbolos repetidos

function pl1_ex5(fonte)

alfabeto = [1 2 3 4 5 6 7 8 9];
%alfabeto = pl1_ex3(fonte);
%agrupar simbolos do alfabeto 2 a 2:
%percorrer a matriz do alfabeto 2 vezes, e concatenar numa matriz de
% strings os s?mbolos 2 a 2.
m = 1;
dim = numel(alfabeto)^2;
newalphabet = strings(dim, 1);

for i = 1:numel(alfabeto)
    for j = 1:numel(alfabeto)
        a = mat2str(alfabeto(i));
        b = mat2str(alfabeto(j));
        newalphabet(m) = strcat(a, b);
        m = m + 1;
    end
end
f = fonte;
%f = readfonte(fonte);
%tornar a fonte numa string
f2 = strjoin(string(f));
f3 = strrep(f2,' ','');
%percorrer a string e ver qual o numero de ocorr?ncias de cada s?mbolo do
%novo alfabeto
freq = zeros(numel(newalphabet), 1);

for n = 1:numel(newalphabet)
    freq(n) = count(f3, newalphabet(n));
end

%numero medio de bits por s?mbolo
prob = freq./sum(freq);
HL = hufflen(prob);
HL = HL.*prob;
x = sum(HL) ./ numel(HL);
disp ('Numero medio de bits por simbolo:');
disp(x);

newalphabet = str2double(newalphabet);

bar(newalphabet, freq);

end

