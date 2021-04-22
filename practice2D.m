%% LEARN ABOUT 2D TEMPERATURE FIELD

clearvars
close all
% Initial variable declaration
dt=0.0001;
dx=0.05;
tmax=0.2;
L=1;
t=[0:dt:tmax];
x=[0:dx:L];
nx = length(x)

kappa=1.0;
cV=1.0;
alpha=kappa/cV*dt/dx^2;   % alpha = (k/cV)*(dt/dx^2)  

% Iteration
for i=1:length(t)
    for j=1:length(x)
        disp(t(i)*x(j));
    end
end

T = x*0;
disp(T)

% impose Dirichlet boundary conditions
% left-most end is identified by i=1 and has coordinate x=0
% last element of the vector T, with index nx. 
T1=100;
TN=150;
T(1)=T1;
T(nx)=TN;

% Iteration with numerical solution of partial differential equation
for j=1:length(t)
    for i=2:nx-1
        Tnew(i) = T(i) + alpha*(T(i+1)-2*T(i)+T(i-1)); % define an new array Tnew
    end
    Tnew(1)=T1;
    Tnew(nx)=TN;
    T=Tnew;         % overwrite T with the command T=Tnew.
end

if mod(t(j),5*dt)==0
    figure(1)
    plot(x,T,'r')
    xlim([0 1])
    ylim([100 150])
    xlabel('x')
    ylabel('T(x,t)')
    title(sprintf('time = %f',t(i)))
    pause(0.1)
end
