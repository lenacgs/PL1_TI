function pl1_ex4(fonte)

[~, ~, ext] = fileparts(fonte);
[~, f] = readFonte(fonte, ext);

freq = histcounts(f);

prob = freq./numel(f);

HL = hufflen(prob);
HL = HL.*prob;
x = sum(HL) ./ numel(HL);

disp('Numero medio de bits por simbolo: ')
disp(x);
end