function [F] = spline(X,Y,M)

M=size(X);
N=M(2);
syms x

H=[1 0 0 0; 1 1 1 1; 0 1 0 0; 0 1 2 3];
G=H^-1;
for i= 1:4
    f(i,1)= (((G(4,i).*x + G(3,i)).*x + G(2,i)).*x + G(1,i));
    f(i,2)= diff(diff(f(i,1),x),x); 
    f(i,3)= subs(f(i,2),x,0);
    f(i,4)= subs(f(i,2),x,1);
end

A= zeros(N,N);
B= zeros(N,1);

B(1,1)=M(1);
B(N,1)=M(2);

A(1,1)=1;
A(N,N)=1;

for i= 2:N-1
    h1=X(i)-X(i-1);
    h2=X(i+1)-X(i);
    
    A(i,i-1)= 2/h1;
    A(i,i)= 4/h1 + 4/h2;
    A(i,i+1)= 2/h2;

    B(i)= -Y(i-1)*(6/(h1^2)) + Y(i)*((6/(h1^2))-(6/(h2^2))) + Y(i+1)*(6/(h2^2));
end

C=A\B

for i= 1:N-1
    h= X(i+1)- X(i);
    F(i)= Y(i)*subs(f(1,1),x,(x-X(i))/h) + Y(i+1)*subs(f(2,1),x,(x-X(i))/h) + C(i)*subs(f(3,1),x,(x-X(i))/h) + C(i+1)*subs(f(4,1),x,(x-X(i))/h);
    Z= X(i):0.01:X(i+1);
    plot(Z,subs(F(i),x,Z))
    hold on;
end
end
