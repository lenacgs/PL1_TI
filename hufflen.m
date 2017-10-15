function HL = hufflen(S)

if nargin<1 %se o numero de elementos do vetor S for 0
   error('hufflen: see help.')
end

HL=zeros(size(S));  %matriz size(S)-by-size(S)
S=S(:); %vetoriza os dados do input
Ip=find(S>0);       % index of positive elements
Sp=S(Ip);           % the positive elements of S

N=length(Sp);       % elements in Sp vector
HLp=zeros(size(Sp));    
C=[Sp(:);zeros(N-1,1)];  % count or weights for each "tree"
Top=1:N;                 % the "tree" every symbol belongs to
[So,Si]=sort(-Sp);       % Si is indexes for descending symbols
last=N;                  % Number of "trees" now
next=N+1;                % next free element in C 
while (last > 1)
   % the two smallest "trees" are put together
   C(next)=C(Si(last))+C(Si(last-1));
   I=find(Top==Si(last));
   HLp(I)=HLp(I)+1;   % one extra bit added to elements in "tree"
   Top(I)=next;
   I=find(Top==Si(last-1));
   HLp(I)=HLp(I)+1;   % and one extra bit added to elements in "tree"
   Top(I)=next;
   last=last-1;                 
   Si(last)=next;
   next=next+1;
   % Si shall still be indexes for descending symbols or nodes
   count=last-1;
   while ((count> 0) & (C(Si(count+1)) >= C(Si(count))))
      temp=Si(count);
      Si(count)=Si(count+1);
      Si(count+1)=temp;
      count=count-1;
   end
end

HL(Ip)=HLp;
return;