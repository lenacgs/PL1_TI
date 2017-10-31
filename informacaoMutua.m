function [ I ] = informacaoMutua(query, target, step, alf)

tam = length(target) - length(query) +1;

ocurrs_query = histc(query, alf);
probs_query = ocurrs_query / sum(ocurrs_query);

for i=1:step:tam
    janela = target(i:(i+length(query)-1));
    ocurrs_janela = histc(janela, alf);
    probs_janela = ocurrs_janela / sum(ocurrs_janela);
    
    matriz = zeros(length(alf), length(alf));
    
    for j=1:length(query)
        matriz(query(j)+1, janela(j)+1) = matriz(query(j)+1, janela(j)+1) + 1;
    end
    
    valor = 0;
    ind_nao_zeros = find(matriz);
    
    for k=1:length(ind_nao_zeros)
        linha = mod(ind_nao_zeros(k), length(alf));
        coluna = ceil(ind_nao_zeros(k) / length(alf));
        if (linha == 0)
            linha = 11;
        end
        pxy = matriz(linha, coluna) /length(query);
        valor = valor + pxy * log2(pxy/ (probs_query(linha)*probs_janela(coluna)));
    end
    I(i) = valor;
end
    
 