function out = gauss(A,b)
m=size(A,1)
B=[A b eye(m)]
for i= 1:m                     %column
    n=i;
    for j= i:m                 %row
        if abs(B(j,i))>abs(B(n,i))       %max row
            n=j;
        end
    end
    B([i,n],:)=B([n,i],:);               %swaping
    if(B(i,i)<eps)           %check for singularity
        display('null matrix')
        return;
    end
                  
    for j= i+1:m             %making upper triangular
        B(j,:)=B(j,:)- (B(i,:)*(B(j,i)/B(i,i)));
    end
    
end
B

D=B(:,(m+2:end))
b=B(:,m+1)
B=B(:,(1:m))
D*A;
solvupp(B,b)

     
end