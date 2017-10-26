function I = pl1_ex6b()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[query, ~] = audioread('guitarSolo.wav');
[target01, ~] = audioread('target01 - repeat.wav');
%[target02, ~] = audioread('target02 - repeatNoise.wav');

info = audioinfo('guitarSolo.wav');
bits = info.BitsPerSample;
bits = 2.^bits;
delta = 2/bits;
alf = (-1:delta:1-delta);

step = round(length(query) / 4);

%para o target01
tam = length(target01) - length(query) +1;

ocurrs_query = histc(query, alf);
probs_query = ocurrs_query / sum(ocurrs_query);

for i=1:step:tam
    janela = target01(i:(i+length(query)-1));
    ocurrs_janela = histc(janela, alf);
    probs_janela = ocurrs_janela / sum(ocurrs_janela);
    
    matriz = zeros(length(alf), length(alf));
    
    for j=1:length(query)
        matriz(find(alf == query(j)), find(alf == janela(j))) = matriz(find(alf == query(j)), find(alf == janela(j))) + 1;
    end
    
    valor = 0;
    ind_nao_zeros = find(matriz);
    
    for k=1:length(ind_nao_zeros) 
        linha = mod(ind_nao_zeros(k), length(alf));
        coluna = ceil(ind_nao_zeros(k) / length(alf));
        if (linha == 0)
            linha = 256;
        end
        pxy = matriz(linha, coluna) /length(query);
        ind_query = (query == alf(linha));
        ind_janela = (janela == alf(coluna));
        valor = valor + pxy * log2(pxy/ (probs_query(linha)*probs_janela(coluna)));
    end
    I(i) = valor;
    
end

