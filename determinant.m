function [res]= deter(A)
res=0;
m=size(A,1);
if m==2;
    res=((A(1,1)*A(2,2))- (A(1,2)*A(2,1)));
else
for k=1:m
 % cofactor(A,1,k);

res=res+((-1)^((m-1)))*A(1,k)*(deter(cofactor(A,1,k)));;
end
end
end
