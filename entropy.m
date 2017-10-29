function E = entropy(fonte)

freq = histcounts(fonte);
freq(freq==0) = [];

E = - sum((freq./sum(freq)) .* log2(freq./sum(freq)));

end

