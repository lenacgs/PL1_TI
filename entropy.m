function E = entropy(fonte)
alf = unique(fonte);

freq = zeros(numel(alf),1);
for i = 1:numel(alf)
    freq(i) = numel(find(fonte==alf(i)));
end


E = - sum((freq./sum(freq)) .* log2(freq./sum(freq)));

end

