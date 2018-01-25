function [X2] = Gausseidelgreedy(A,X1,B,delta,max,k)

N=size(A,1); 
%LD=A.*eye(m)             for jacobi
%U=A-LD              
LD=tril(A);
U = triu(A,1);
X2=X1;

 for i=1:max
     X2(1)= (B(1)- U(1,2:1+k)*X1(2:1+k))/LD(1,1);
     for j=2:N-1
         X2(j)= (B(j)- U(j,j+1:j+k)*X1(j+1:j+k)- LD(j,j-k:j-1)*X2(j-k:j-1))/LD(j,j);
     end
     X2(N)= (B(N)- LD(N,N-k:N-1)*X2(N-k:N-1))/LD(N,N);
     
     err=abs(norm(X2-X1));
    relerr=err/(norm(X2)+eps);
    
    plot(i,relerr,'*');
    hold on;
    
    
    if((err<delta)|(relerr<delta))
         break
    end
    X1=X2;
 end
     
     if(i==max)
        display('maxedout')
     end
 
end