%finished

function [entropy] = pl1_ex2(fonte)

[filepath,name,ext] = fileparts(fonte);

if (ext=='.wav')
    [fonte, Fs] = audioread(fonte);
elseif(ext=='.bmp')
    fonte = imread(fonte);
elseif(ext== '.txt')
    fonteca = fileread(fonte);
    fonte = [];
    for i=1:numel(fonteca) 
        fonte(i) = fonteca(i)+0;
    end
end
[freq] = histcounts(fonte);
freq(freq==0) = [];

entropy = - sum((freq./sum(freq)) .* log2(freq./sum(freq)));
end

