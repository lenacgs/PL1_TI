function newalphabet = groupSymbols(fonte)
fonte = fonte(1:numel(fonte)-1);
alph = strings(numel(fonte)/2, 1);

j = 1;

for i = 1:2:numel(fonte)
    a = mat2str(fonte(i));
    b = mat2str(fonte(i+1));
    alph(j) = strcat(a,b);
    j = j + 1;
end

newalphabet = unique(alph);
%disp(numel(fonte))
%if (mod(numel(fonte), 2) == 0) %par
%    alph = strings(numel(fonte), 1);
%    for i=2:2:(numel(alph)-1)
%        a = mat2str(fonte(i));
%        b = mat2str(fonte(i+1));
%        alph(i) = strcat(a,b);
%    end
%    for j=1:2:numel(alph)
%        a = mat2str(fonte(j));
%        b = mat2str(fonte(j+1));
%        alph(j) = strcat(a,b);
%    end
%else %impar
%    alph = strings(numel(fonte), 1);
%    disp('primeiro for')
%    for i=1:2:(numel(alph)-1)
%        disp(i)
%        a = mat2str(fonte(i))
%        b = mat2str(fonte(i+1))
%        alph(i) = strcat(a,b);
 %   end
%    disp('segundo for')
%    for j=2:2:numel(alph)
%        disp(j)
%        a = mat2str(fonte(j))
%        b = mat2str(fonte(j+1))
%        alph(j) = strcat(a,b);
%    end
%end 

%newalphabet = unique(alph);
%disp(newalphabet);
end