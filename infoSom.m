function [fonte, freq, nBits, alf] = infoSom(nome)

[fonte, freq] = audioread(nome);
info = audioinfo(nome);
nBits = info.BitsPerSample;
nBits = 2.^nBits;
delta = 2/nBits;
alf = (-1:delta:1-delta);



end

