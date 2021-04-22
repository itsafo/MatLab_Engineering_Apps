%% LEARN ABOUT 2D TEMPERATURE FIELD

clearvars
close all

% Initial variable declaration
dt=0.0005;
dx=0.05;
dy=0.05;
tmax=0.2;
LX=0.6;
LY=0.5;
t=[0:dt:tmax];

x=[0:dx:LX];
y=[0:dy:LY];
dtics=0.1;
xtics=[0:dtics:LX];
ytics=[0:dtics:LY];
kappa=1;
cV=1;
% alpha=kappa/cV*dt/dx^2;   % alpha = (k/cV)*(dt/dx^2)  

nx=length(x);
ny=length(y);
T=zeros(nx,ny);
laplaceT=zeros(nx,ny);
T = T+50;
Tup=100;
Tdown=150;
Tleft=200;
Tright=250;

iteration=0;
while (iteration<2000),
    iteration=iteration+1
    if (mod(iteration,10)==0),
        contourf(x,y,lapT');
        colorbar;
        drawnow;
    end
% impose Dirichlet boundary conditions
% left-most end is identified by i=1 and has coordinate x=0
% last element of the vector T, with index nx. 
for i=1:nx
    T(i,1)=Tdown;
    T(i,ny)=Tup;
end
for j=1:ny
    T(1,j)=Tleft;
    T(nx,j)=Tright;
end

lapT=LapracFunc(T,dx,dy);
size(lapT')
% Plotting 
figure(1);
% contourf(x,y,lapT') % LapT contourf doesn't work
% pcolor(lapT)
% contourf(x,y,T')
title(sprintf('time = %f',T(j)))
axis([0 LX 0 LY])
pbaspect([LX LY 1])
xticks(xtics)
yticks(ytics)
xlabel('x');
ylabel('y');
pause(0.001)
end


