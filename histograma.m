function histograma(fonte, alfabeto)

alf= alfabeto(:);
x = histcounts(fonte, alf);

bar(x)
xlabel('alphabet');
ylabel('ocurrences in f');
title('histogram')
end

