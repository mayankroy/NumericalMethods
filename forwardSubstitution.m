function C = forwardsub(A,B)
m=size(B,1);
for i=1:m-1
    for j = i+1:m
        if A(i,j)~=0
            disp('Matrix not lower triangular');
            return;
        end
    end
end
C=B;
C(1)=C(1)/A(1,1);

for i=2:m
    for j=1:i-1
    C(i)=C(i)- (A(i,j)*C(j));
    end    
    C(i)=C(i)/A(i,i);
end  
end
