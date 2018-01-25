clc
clear
X=[1 2  3 6 6; 1 -3 -1 -4 1]

syms x

M=size(X);
n=M(2);

g(2,1)=0

for i = 1:n
    B(i)=  nchoosek(n-1,i-1)*(x^(i-1))*((1-x)^((n-1)-(i-1)));
    g = g + X(:,i)*B(i);
end

t = 0:0.01:1;

plot(X(1,:),X(2,:),'o')
hold on
plot(subs(g(1),x,t),subs(g(2),x,t))

