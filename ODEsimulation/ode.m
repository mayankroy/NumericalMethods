

tspan = [0 10];
y = [0.7 0];
[t1,y1] = ode45('particle', tspan, y );

figure;
plot(t1, y1(:,1),'b');
hold on
plot(t1, y1(:,2),'r');

xlabel('time');
ylabel('displacement');
hold on
r=1;
% start visualization of pendulums
animation(t1, y1,r);