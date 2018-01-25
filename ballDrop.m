clc
clear
x0 = 1;
v0 = 0;
t = 10;
n = 100;              %number of intervals
h = t/n;              %width of interval
m = 5;              %mass
c = .2;              %coefficient

A(1,1) = x0;                %initial position
B(1) = x0;

A(2,1) = -1/h;
A(2,2) = 1/h;
B(2) = v0;

for(i = 3:n)
    A(i,i)= 2*m + c*h;
    A(i,i-1)= -4*m;
    A(i,i-2)= 2*m - c*h;
    B(i)= 2*m*9.8*h^2;
end

X=A\B';
