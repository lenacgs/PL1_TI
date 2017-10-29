function [infoMutua] = infoMutuaSom(alf, query, target)

freqs = zeros(numel(alf), numel(alf));
step = numel(query)/4;

for i = 1:step:numel(target)
    for j = 1:numel(query)
        indexq = round((query(j) + 1) / 0.0078);
        indext = round((target(j) + 1) / 0.0078);
        if (indext == 0), indext = 1; end
        freqs(indext, indexq) = freqs(indext, indexq) +1;
    end
end

pxy = freqs ./ numel(freqs);
pxy = pxy(pxy~=0);
fx = histcounts(target);
px = fx ./ numel(target);

fy = histcounts(query);
py = fy ./ numel(query);
a = px.*py;

b = pxy ./ a;
infoMutua = pxy .* (log(b));


end

