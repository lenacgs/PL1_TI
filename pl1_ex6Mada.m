function pl1_ex6Mada

[query, ~, ~, alf] = infoSom('guitarSolo.wav');
[target01, ~, ~, ~] = infoSom('target01 - repeat.wav');
[target02, ~, ~, ~] = infoSom('target02 - repeatNoise.wav');

%os 3 alfabetos sao iguais
%matriz alf x alf
freqs = zeros(numel(alf), numel(alf));
%probs x target
%probs y query

step = numel(query)/4;

for i = 1:step:numel(target01)
    for j = 1:numel(query)
        indexq = round((query(j) + 1) / 0.0078);
        indext01 = round((target01(j) + 1) / 0.0078);
        freqs(indext01, indexq) = freqs(indext01, indexq) +1;
    end
end

pxy = freqs ./ numel(freqs);
pxy = pxy(pxy~=0);
fx = histcounts(target01);
px = fx ./ numel(target01);

fy = histcounts(query);
py = fy ./ numel(query);
a = px.*py;

b = pxy ./ a;
infoMutua = pxy .* (log(b));
disp('target01');
%plot(infoMutua);

freqs2 = zeros(numel(alf), numel(alf));

for i = 1:step:numel(target02)
    for j =1:numel(query)
        indexq2 = round((query(j) +1) / 0.0078);
        
        indext02 = round((target02(j) + 1) / 0.0078);
        freqs2(indext02, indexq2) = freqs2(indext02, indexq2) +1;
    end
end
pxy2 = freqs2 ./ numel(freqs2);
pxy2 = pxy2(pxy2~=0);
fx2 = histcounts(target02);
px2 = fx2 ./ numel(target02);

c = px2 .* py;
d = pxy2 ./ c;

infoMutua2 = pxy2.* log(d);
disp('target02');
plot(infoMutua2);
end


