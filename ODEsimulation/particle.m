function f = particle(tspan, y)

g=9.81;
r =1;

f = [y(2); -g/r*cos(y(1))];

end