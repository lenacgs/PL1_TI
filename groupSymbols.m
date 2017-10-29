function newalphabet = groupSymbols(fonte)
alph = strings(numel(fonte)/2, 1);
j = 1;
for i = 1:2:numel(fonte)
    a = mat2str(fonte(i));
    b = mat2str(fonte(i+1));
    alph(j) = strcat(a,b);
    j = j + 1;
end

newalphabet = unique(alph);

end