function histograma(fonte, alfabeto)

alf = alfabeto(:);
x = zeros(numel(alf),1);
for i = 1:numel(alf)
    x(i) = numel(find(fonte==alf(i)));
end

bar(x)
xlabel('alphabet');
xlim auto;
ylabel('ocurrences in f');
title('histogram')
end

