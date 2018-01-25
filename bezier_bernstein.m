
% data
x = [2.3,1,2,3.6, 3];
y = [3,1.4,-0.2,2.3, 3.4 ];

% plot of data
plot(x,y,'--o')
axis([0 5 -1 4])
hold on


% Bernstein Polynomials
Bin = @(t,i,N)(nchoosek(N,i)*t.^i.*(1-t).^(N-i));

N =  length(x)-1;

% points of plotting
t = linspace(0,1,50)';


% evaluation of different Bernstein Polynomials and stacking
B = [];
for i = 0 : N
   B = [B Bin(t,i,N)] ;
end

xt = B*(x');  % x coordinates of plot points on curve
yt = B*(y');  % y coordinates of plot points on curve

plot(xt,yt,'k','linewidth',2)

hold off