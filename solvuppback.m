function C = solvuppback(A,B)
m=size(B);
for i=2:m
    for j = 1:i-1
        if A(i,j)~=0
            disp('Matrix not upper triangular');
            return;
        end
    end
end
m=size(B,1);
C=B;
C(m)=C(m)/A(m,m);

for i=1:m-1
    for j=m-i+1:m
    C(m-i)=C(m-i)- (C(j)*A(m-i,j));
    end    
    C(m-i)=C(m-i)/A(m-i,m-i);
end  
end
