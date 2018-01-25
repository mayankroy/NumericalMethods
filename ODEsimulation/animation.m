function animation(t1, y1,r)


figure;
% plot initial states

plot([0 r*cos(y1(1,1))],[0 r*sin(y1(1,1))],'b-','LineWidth',2);
hold on;
plot(r*cos(y1(1,1)),r*sin(y1(1,1)),'b.','MarkerSize',30);
    axis([-2 2 -2 2]);
pause;
hold off;
% plot the intermediate states

for i = 1:length(t1)

    plot([0 r*cos(y1(i,1))],[0 r*sin(y1(i,1))],'b-','LineWidth',2);
    hold on;
    plot(r*cos(y1(i,1)),r*sin(y1(i,1)),'b.','MarkerSize',30);
    axis([-2 2 -2 2]);
    pause(0.02);
    hold off;
end

    