clc
clear

f= @(x) (exp(x));

h=.1;
n=14;
z=1;

for i= 1:n
    a(i)=(f(z+h)-f(z))/h;
    h=h/10;
end
a'

