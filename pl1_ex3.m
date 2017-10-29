function pl1_ex3(fonte)

[~, ~, ext] = fileparts(fonte);
[alf, f] = readFonte(fonte, ext);
histograma(f, alf);
x = entropy(f);
disp('entropy: ');
disp(x);

end