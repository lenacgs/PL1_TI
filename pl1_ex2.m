function pl1_ex2(fonte)

[~, ~, ext] = fileparts(fonte);
[~, f] = readFonte(fonte, ext);

E = entropy(f);
disp('entropy: ');
disp(E);
end

