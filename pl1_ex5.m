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

prob = freq./sum(freq);
HL = hufflen(prob);
HL = HL.*prob;
x = sum(HL) ./ numel(HL);
disp ('Numero medio de bits por simbolo:');
disp(x);

end

