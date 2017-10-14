function [n] = pl1_ex2(fonte, alfabeto)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

fonte(fonte==0) = [];
n = 0;
for i=1:(numel(alfabeto)-1)
    disp(alfabeto(i))
    prob = sum(fonte==alfabeto(i))/numel(fonte);
    disp(sum(fonte==alfabeto(i)))
    disp(prob)
    n = n - (prob * log2(prob));
end

end

