function [B L P] = LUD(B)

m=size(B,1)
P=eye(m);
L=eye(m);

for i= 1:m                     %column
   
    n=i;
    for j= i:m                 %row
        if abs(B(j,i))>abs(B(n,i))       %max row
            n=j;
        end
    end
    B([i,n],:) = B([n,i],:);
    P([i,n],:) = P([n,i],:);
    
    if(B(i,i)==0)           %check for singularity
        display('null matrix')
        return;
    end
    %making upper triangular
    for j= i+1:m
        multi=B(j,i)/B(i,i);
        B(j,i+1:end)=B(j,i+1:end)- (B(i,i+1:end)*multi);
        B(j,i)=multi;
    end
   
    
end
   L=tril(B,-1)+(eye(m));
 B = triu(B);
          %L inverse
end