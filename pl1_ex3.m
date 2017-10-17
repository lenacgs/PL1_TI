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
    display(alfabeto)
    
    %x = histcounts(fontefinal, alfabeto);
    %bar(x)
    pl1_ex1(fontefinal, alfabeto)
    xlim(alfabeto)
    
%caso seja uma imagem (de 0 a 255)
elseif(ext=='.bmp')
    fontefinal = imread(fonte);
    info = imfinfo(fonte);
    bits = info.BitDepth;
    bits =2.^bits;
    alfabeto = (1:bits);
    display(alfabeto)
    
    figure()
    
    %x = histcounts(fontefinal, alfabeto)
    %bar(x)
    pl1_ex1(fontefinal, alfabeto)
    xlim(alfabeto)
    
%caso seja um texto
elseif(ext== '.txt')
    alfabeto = ['A':'Z','a':'z'];
    fonte = fileread(fonte); 
    array = [];
    fontefinal = [];
    for i=1:numel(fonte) 
        fontefinal(i) = fonte(i)+0;
    end
    
    for i=1:numel(alfabeto) 
        array(i) = alfabeto(i)+0;
    end
    
    %disp(array)
    %x = histcounts(fontefinal, array(:))
    %bar(x)
    pl1_ex1(fontefinal, array(:))
    
end

