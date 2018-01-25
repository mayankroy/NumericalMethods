function [B]= cofactor(A,n,o)

m=size(A,1);
%m=p(1,1)
for l=1:m-1
   n=mod(n,m);
   o=mod(o,m);
  n=n+1;
    o=o+1;
    a(l)= n;
    b(l)= o;
end
B=A(a,b);
end
