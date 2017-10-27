%está a funcionar

function I = pl1_ex6av2
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
query = [2 6 4 10 5 9 5 8 0 8];
target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
alf = 0:10;
step = 1;

I = informacaoMutua(query, target, step, alf);

end

