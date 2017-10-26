%como o alfabeto de onde agrupamos os s?mbolos j? n?o tem simbolos
%repetidos, entao o novo alfabeto n?o vai ter simbolos repetidos

function pl1_ex5(fonte)

%agrupar simbolos do alfabeto 2 a 2:
%percorrer a matriz do alfabeto 2 vezes, e concatenar numa matriz de
% strings os s?mbolos 2 a 2.
f = readfonte(fonte);
%disp(f);
alph = strings(numel(f)/2, 1);
j = 1;
for i = 1:2:numel(f)
    a = mat2str(f(i));
    b = mat2str(f(i+1));
    alph(j) = strcat(a,b);
    j = j + 1;
end

newalphabet = unique(alph);

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


%histograma nao esta a funcionar mas acho que nao e preciso anyway
%newalphabetint = str2double(newalphabet);
%bar(newalphabetint, freq);

end

