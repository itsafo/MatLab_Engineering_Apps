clearvars;
close all;
%% PLOTTING A BLURRY CIRCLE FUNCTIONS AND VIEWING PLOT

% x=[0:0.1:10];
% for i=1:length(x)
%     y(i)=exp(x(i));
% end
% plot(x,y)
% xlabel('x')
% ylabel('y')
% 
if 1
% close all;
% clearvars;
dx=0.01;
dy=0.01;
x=[-2:dx:2];
y=[-2:dy:2];
nx = length(x);
ny = length(y);


for i=1:length(x)
    for j=1:length(y)
        r2=x(i)^2+y(j)^2;
        z(j,i)=exp(-r2);
    end
end

figure(1)
% surf(x,y,z)
% pcolor(x,y,z)
display(z)
contourf(x, y, z);
% ylim([0 2.1]);
xlabel('x');
ylabel('y');
zlabel('z=f(x,y)');
axis equal
end

% close all;
% clearvars;
%% SOLVING MULTIPLE ANONYMOUS FUNCTIONS AND VIEWING PLOT
if 0
func = @(x,y) (x-1).^2.*(x+1).^2 + (y-1).^2.*(y+1).^2+x/4-y/4;
func1x= @(x,y) 1/4 - 4*x + 4*x.^3;
func1y= @(x,y) -(1/4) - 4*y + 4*y.^3;
xmin=-2;
xmax=2;
ymin=-2;
ymax=2;
xin=0.0;
yin=0.5;
x=xin;
y=yin;
dtics=0.2;
daxis=0.2;
xtics=[xmin:dtics:xmax];
ytics=[ymin:dtics:ymax];
xaxis=[xmin:daxis:xmax];
yaxis=[ymin:daxis:ymax];
[X,Y]=meshgrid(xaxis,yaxis);
figure(1);
contourf(xaxis,yaxis,func1y(X,Y));
hold on;
end
% plot(xpoints,ypoints,'-s','MarkerSize',10,...
% 'MarkerFaceColor','red')
% hold off;

