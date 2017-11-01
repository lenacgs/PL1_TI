function pl1_ex2(fonte)

[~, ~, ext] = fileparts(fonte);
[~, f] = readfonte(fonte, ext);

E = entropy(f);
disp('entropy: ');
disp(E);
end

