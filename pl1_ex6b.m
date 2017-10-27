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
%disp('alf')
%length(alf)
%disp('query')
%length(query)
%disp('probs_query')
%length(probs_query)
%pause

for i=1:step:tam
    janela = target01(i:(i+length(query)-1));
    ocurrs_janela = histc(janela, alf);
    probs_janela = ocurrs_janela / sum(ocurrs_janela);
    
    matriz = zeros(length(alf), length(alf));
    
    for j=1:length(query)
        matriz(find(alf == query(j)), find(alf == janela(j))) = matriz(find(alf == query(j)), find(alf == janela(j))) + 1;
        %disp('para o query')
        %query(j)
        %a = find(alf == query(j))
        %disp('para a janela')
        %janela(j)
        %b = find(alf == janela(j))
        %matriz(a, b)
        %pause
    end
    
    valor = 0;
    ind_nao_zeros = find(matriz);
    
    for k=1:length(ind_nao_zeros) 
        linha = mod(ind_nao_zeros(k), length(alf));
        coluna = ceil(ind_nao_zeros(k) / length(alf));
        if (linha == 0)
            linha = 256;
        end
        pxy = matriz(linha, coluna) /(length(query)*length(query)); %por quanto e que se deve dividir?
        ind_query = (query == alf(linha));
        ind_janela = (janela == alf(coluna));
        valor = valor + pxy * log2(pxy/ (probs_query(linha-1)*probs_janela(coluna-1)));
    end
    I(i) = valor;
    
end

