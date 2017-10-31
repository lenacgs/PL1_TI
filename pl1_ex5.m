%alguma coisa esta mal neste exercicio, os valores de entropia sao
%superiores a sem agrupamento de simbolos

function pl1_ex5(fonte)

[~, ~, ext] = fileparts(fonte);
[~, f] = readFonte(fonte, ext);

newalphabet = groupSymbols(f);

f2 = strjoin(string(f));
f3 = strrep(f2,' ','');
freq = zeros(numel(newalphabet), 1);
for n = 1:numel(newalphabet)
    freq(n) = count(f3, newalphabet(n));
end

freq = freq(freq~=0);
prob = freq./sum(freq);
x = - sum(prob .* log2(prob));

disp ('Numero medio de bits por simbolo:');
disp(x/2);

end

