function pl1_ex3(fonte)

[~, ~, ext] = fileparts(fonte);
[alf, f] = readfonte(fonte, ext);
histograma(f, alf);
x = entropy(f);
disp('entropy: ');
disp(x);

end