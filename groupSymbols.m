function newalphabet = groupSymbols(fonte)
alph = strings(round(numel(fonte)/2)+1, 1);
j = 1;

alph(end) = fonte(end);

for i = 1:2:(numel(fonte)-1)
    a = mat2str(fonte(i));
    b = mat2str(fonte(i+1));
    alph(j) = strcat(a,b);
    j = j + 1;
end

newalphabet = unique(alph);

end