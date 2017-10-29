function [alfabeto, f] = readFonte(fonte, ext)

if (ext=='.wav')
    [f, ~] = audioread(fonte);
    info = audioinfo(fonte);
    bits = info.BitsPerSample;
    bits = 2.^bits;
    delta = 2/bits;
    alfabeto = (-1:delta:1-delta);
    
elseif(ext=='.bmp')
    f = imread(fonte);
    info = imfinfo(fonte);
    bits = info.BitDepth;
    bits =2.^bits;
    alfabeto = (1:bits);
    
elseif(ext== '.txt')
    fonteaux = fileread(fonte); 
    f = zeros(numel(fonteaux), 1);
    
    for i=1:numel(fonteaux) 
        f(i) = fonteaux(i)+0;
    end
     
    alf = ['A':'Z','a':'z'];
    alf2 = zeros(numel(alf), 1);
    
    for i=1:numel(alf) 
        alf2(i) = alf(i)+0;
    end
    
    alfabeto = sort(alf2(:));
    
end

end

