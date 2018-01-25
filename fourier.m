syms x
f = x
n=100;
g=0*x
for i=1:n
    a(i) = double((1/pi)*(int((f*cos((i-1)*x)),x,-pi,pi)));
    b(i) = double((1/pi)*(int((f*sin((i-1)*x)),x,-pi,pi)));
    g=g+(a(i)*cos((i-1)*x)+b(i)*sin((i-1)*x));
end
g
z=-2*pi:0.1:2*pi;
plot(z,subs(g,x,z))
    