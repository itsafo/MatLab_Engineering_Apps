clearvars
close all

dx=0.05;
dy=0.05;
LX=1.1;
LY=1;
x=[0:dx:LX];
y=[0:dy:LY];
dtics=0.1;
xtics=[0:dtics:LX];
ytics=[0:dtics:LY];
kappa=1;
cV=1;
nx=length(x);
ny=length(y);
T=zeros(ny,nx);
boundaries=zeros(ny,nx);

Tup=100;
Tdown=150;
Tleft=200;
Tright=250;
for i=1:nx
    T(1,i)=Tdown;
    boundaries(1,i)=1;
    T(ny,i)=Tup;
    boundaries(ny,i)=1;
end
for j=1:ny
    T(j,1)=Tleft;
    boundaries(j,1)=1;
    T(j,nx)=Tright;
    boundaries(j,nx)=1;
end
nf=0;
map_rs=zeros(ny,nx);
for i=1:nx
    for j=1:ny
        if not (boundaries(j,i)==1)
        nf=nf+1;
        map_srx(nf)=i;
        map_sry(nf)=j;
        map_rs(j,i)=nf;
        end
    end
end

M=sparse(nf,nf);
B=zeros(nf,1);

for iif=1:nf
    xreal=map_srx(iif);
    xleft=xreal-1;
    xright=xreal+1;
    yreal=map_sry(iif);
    ybottom=yreal-1;
    ytop=yreal+1;
    M(iif,iif)=-4;
    if boundaries(yreal,xleft)==1
        B(iif)=B(iif)-T(yreal,xleft);
    else
        M(iif,map_rs(yreal,xleft))=1;
    end
    % here go 3 remaining cases
end

if xleft==0
    xleft=nx;
end
if xright==nx+1
    xright=1;
end
if ybottom==0
    ybottom=ny;
end
if ytop==ny+1
    ytop=1;
end

% Plotting 
figure(1)
contourf(map_rs')    % Plots some rectangular parrallel plots
title(sprintf('time = %f',t(j)))
axis([0 LX 0 LY])
pbaspect([LX LY 1])
xticks(xtics)
yticks(ytics)
xlabel('x');
ylabel('y');
pause(0.001)


