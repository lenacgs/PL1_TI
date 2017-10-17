function [alfabeto] = pl1_ex3(fonte)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
disp('Funcao Histograma')
[filepath,name,ext] = fileparts(fonte);

%caso seja ficheiro de audio (de 0 a 1)
if (ext=='.wav')
    [fontefinal, Fs] = audioread(fonte);
    info = audioinfo(fonte);
    bits = info.BitsPerSample;
    bits = 2.^bits;
    delta = 2/bits;
    alfabeto = (-1:delta:1-delta);
    
    %x = histcounts(fontefinal, alfabeto);
    %bar(x)
    pl1_ex1(fontefinal, alfabeto);
    pl1_ex2(fonte);
    
%caso seja uma imagem (de 0 a 255)
elseif(ext=='.bmp')
    fontefinal = imread(fonte);
    info = imfinfo(fonte);
    bits = info.BitDepth;
    bits =2.^bits;
    alfabeto = (1:bits);
    
    %x = histcounts(fontefinal, alfabeto)
    %bar(x)
    pl1_ex1(fontefinal, alfabeto);
    pl1_ex2(fonte);
    
%caso seja um texto
elseif(ext== '.txt')
    alfabeto = ['A':'Z','a':'z'];
    fonteaux = fileread(fonte); 
    array = [];
    fontefinal = [];
    for i=1:numel(fonteaux) 
        fontefinal(i) = fonteaux(i)+0;
    end
    
    for i=1:numel(alfabeto) 
        array(i) = alfabeto(i)+0;
    end
    
    %disp(array)
    %x = histcounts(fontefinal, array(:))
    %bar(x)
    pl1_ex1(fontefinal, array(:));
    pl1_ex2(fonte);

end

