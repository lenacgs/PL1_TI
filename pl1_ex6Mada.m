function pl1_ex6Mada

[query, freq, nBits, alf] = infoSom('guitarSolo.wav');
[target01, freq1, nBits1, alf1] = infoSom('target01 - repeat.wav');
[target02, freq2, nBits2, alf2] = infoSom('target02 - repeatNoise.wav');

%os 3 alfabetos sao iguais
%matriz alf x alf
probs = zeros(numel(alf), numel(alf));
%probs x ? query
%probs y ? target

disp(numel(alf));

step = numel(query)/4;
for i=1:step:numel(query)
    for j=1:numel(target01)
        aux1 = round(abs(query(j))*100);
        aux2 = round(abs(target01(j))*100);
        disp (aux1);
        disp(aux2);
        probs(aux1, aux2) = probs(aux1, aux2) + 1;
    end
end



end

