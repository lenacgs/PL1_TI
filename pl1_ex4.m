function pl1_ex4(fonte)

[~, ~, ext] = fileparts(fonte);
[alf, f] = readfonte(fonte, ext);

freq = zeros(numel(alf),1);
for i = 1:numel(alf)
    freq(i) = numel(find(f==alf(i)));
end

prob = freq./numel(f);
HL = hufflen(prob);
v = var(HL);
HL = HL.*prob;
x = sum(HL);
disp('Variance:');
disp(v);
disp('Numero medio de bits por simbolo: ')
disp(x);
end