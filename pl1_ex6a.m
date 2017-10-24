function [I] = pl1_ex6a()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
query = [2 6 4 10 5 9 5 8 0 8]
target = [6 8 9 7 2 4 9 9 4 9 1 4 8 0 1 2 2 6 3 2 0 7 4 9 5 4 8 5 2 7 8 0 7 4 8 5 7 4 3 2 2 7 3 5 2 7 4 9 9 6];
alf = 0:10;
step = 1;
I = [];
tam = length(target) - length(query) +1;
length(alf)

for i=1:step:tam %i representa o indice do array I
    tabela = zeros(length(alf), length(alf));
    window = target(i:(i+length(query)-1));

    for j=1:length(window) %cria a tabela com as ocorrencias dos pares
        tabela(query(j)+1, window(j)+1) = tabela(query(j)+1, window(j)+1)+1; %query(j) +1 porque nao podemos ter indices 0.
    end
    
    disp(window)
    disp(tabela)
    valor = 0;
    for m=1:length(query) %m vai de 1 a 11
        for n=1:length(query)
            if (tabela(query(m)+1, window(n)+1) ~= 0)
                pxy = tabela(query(m)+1, window(n)+1) / (length(alf)*length(alf));
                %disp('pxy')
                %disp(pxy)
                
                px = sum(query == query(m)) / length(query);
                %disp('px')
                %disp(px)
                
                py = sum(window == window(n)) / length(window);
                %disp('py')
                %disp(py)
                
                valor = valor + (pxy * log2(pxy/(px*py)));
            end 
        end 
    end
    disp(valor)
    I(i) = valor;
    pause
end

