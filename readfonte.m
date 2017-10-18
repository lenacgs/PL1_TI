function f = readfonte(fonte)
[filepath,name,ext] = fileparts(fonte);

if (ext=='.wav')
    [f, Fs] = audioread(fonte);
elseif(ext=='.bmp')
    f = imread(fonte);
elseif(ext== '.txt')
    fonteca = fileread(fonte);
    f = [];
    for i=1:numel(fonteca) 
        f(i) = fonteca(i)+0;
    end
end
end