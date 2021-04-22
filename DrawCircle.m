clc, clear, close all

%% Simple circle
% n = linspace(-2, 2, 1000);
% [x y] = meshgrid(n);
% r= zeros(size(x));
% g = r;
% b = r;
% R=1
% 
% % Using circle equation
% rind=find(x.^2+y.^2<=R.^2);
% r(rind)=1;
% rgb=cat(3, r, g, b);
% imagesc(rgb)
% axis equal, axis off

%% Simple concentric rhombus or square
% x = linspace(-2*pi,2*pi);
% y = linspace(0,4*pi);
% [X,Y] = meshgrid(x,y);
% Z = sin(X) + cos(Y);
% contourf(X,Y,Z,10)

%% Computational assignment circles

if 0
    dx = 0.02; dy = dx; Lx =1; Ly=Lx;
    n = [0:dx:Lx];
    nx = length(n); ny=nx;
    [x y] = meshgrid(n);
    c= zeros(size(x));
    b= zeros(size(x));
    g = c;
    b = c;
    R=1
    C=1;
    T1 = 0; T2 = 5; T3=10; T4=15;
    % T1=Tleft, T2=Tright, T3=Ttop, T4=Tbottom

    % Creating the circle boundary
    for R=0:0.1:0.3
        rind=find((x-0.5).^2+(y-0.5).^2<=(R).^2);
        c(rind)=C;
        ind = find(c(:));
    end
    
   
    Lapc=c;
    % Assigning laplace variable to c
    % Calculating the central difference laplace inside the circle
    
    % Asigning boundary conditions for top and bottom
%     for i=1:nx
%         Lapc(i,1)=T4;
%         Lapc(i,ny)=T3;
%     end
%     % Assigning boundary conditions for right and left
%     for j=1:ny
%         Lapc(1,j)=T1;
%         Lapc(nx,j)=T2;
%     end
    % Calculating Laplace insdide the circular fluid of concentration C = 1
    for i=2:nx-1
        for j=2:ny-1
            Lapc(j,i) = (1/4)*(c(j,i+1)+c(j,i-1)+c(j+1,i)+c(j-1,i));
        end
        c(2:ny-1,2:nx-1) = Lapc(2:ny-1,2:nx-1);
    end
    
    % Ploting the visualization 
    figure(1);
    contourf(x, y, Lapc)   % Plots a nice concentric circle with blue background
                        % with radius from  0.2 to 1.2
    colorbar
    axis([0 1 0 1])     % Xaxis from 0 to 1, yaxis from 0 to 1

end

%% Computational assignment circles

if 1
    dx = 0.02; dy = dx; Lx =1; Ly=Lx;
    n = [0:dx:Lx];
    nx = length(n); ny=nx;
    [x y] = meshgrid(n);
    c= zeros(size(x));
    T1 = 0; T2 = 5; T3=10; T4=15;

    R=1
    C=1;
    % T1=Tleft, T2=Tright, T3=Ttop, T4=Tbottom

    % Creating the circle boundary
    for R=0:0.1:0.3
        rind=find((x-0.5).^2+(y-0.5).^2<=(R).^2);
        c(rind)=C;
        ind = find(c(:));
    end
   
    Lapc = LapandBound(c, nx, ny);
    % Calculating Laplace insdide the circular fluid of concentration C = 1
    
    % Ploting the visualization 
    figure(1);
    contourf(x, y, Lapc)   % Plots a nice concentric circle with blue background
                        % with radius from  0.2 to 1.2
    colorbar
    axis([0 1 0 1])     % Xaxis from 0 to 1, yaxis from 0 to 1
end

%% Concentric circles
if 0
    n = linspace(-2, 2, 1000);
    [x y] = meshgrid(n);
    r= zeros(size(x));
    g = r;
    b = r;
    R=1
    q=1;

    % Using circle equation
    for R=0:0.2:0.8
        rind=find(x.^2+y.^2<=(R+0.2).^2);
        rind1=find(x.^2+y.^2>R.^2);
        rind2=intersect(rind1,rind);
        r(rind2)=q;
        q=q-0.1;
    end
    rgb=cat(3, r, g, b);
    LX=1;
    LY=1;
    dtics=0.1;
    xtics=[0:dtics:LX];
    ytics=[0:dtics:LY];
    % imagesc(rgb)        % Plot a nice concentric circle with black background
    contourf(x, y, r)   % Plots a nice concentric circle with blue background
                        % with radius from  0.2 to 1.2
    ylim([0 1])
    % xticks(xtics)
    % yticks(ytics)
    axis equal %, axis off
end

%% Concentric circle from iteration
if 0
    dx=0.01;
    dy=0.01;
    x=[-2:dx:2];
    y=[-2:dy:2];
    nx = length(x);
    ny = length(y);

    for i=1:length(x)
        for j=1:length(y)
%             r2=x(i)^2+y(j)^2;
%             z(j,i)=exp(-r2);
            z(j,i)=x(i).^2+y(j).^2;
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
%% Concentric circles

if 0
n = linspace(-2, 2, 1000);
[x y] = meshgrid(n);
r= zeros(size(x));
g = r;
b = r;
R=1
q=1;    % This value changes the plot colour

% Using circle equation
for R=0:0.2:1
    rind=find((x+0.4).^2+(y+0.4).^2<=(R+0.2).^2);
    rind1=find((x+0.4).^2+(y+0.4).^2>R.^2);
    rind2=intersect(rind1,rind);
    r(rind2)=q;
    q=q-0.1;    % I hardly see changes due to this
end
r1=rind2
q=1;
for R=0:0.2:1
    gind=find((x-0.4).^2+(y+0.4).^2<=(R+0.2).^2);
    gind1=find((x-0.4).^2+(y+0.4).^2>R.^2);
    gind2=intersect(gind1,gind);
    g(gind2)=q;
    q=q-0.1;
end
q=1;
for R=0:0.2:1
    bind=find(x.^2+y.^2<=(R+0.2).^2);
    bind1=find(x.^2+y.^2>R.^2);
    bind2=intersect(bind1,bind);
    b(bind2)=q;
    q=q-0.1;
end
figure(1);
rgb=cat(3, r, g, b);
% imagesc(rgb)
contourf(x, y, r)
hold on
contourf(x, y, g)
axis equal
end
%% Concentric blurry circle from complicated function
if 0
    dx=0.1;
    dy=0.1;
    x=[0.2:dx:0.8];
    y=[0.2:dy:0.8];
    nx = length(x);
    ny = length(y);
    h0 = 1/20; % cell diameter
    fd=@(p) sqrt(sum(p.^2,2))-1;
    [p,t] = distmesh2d(fd,@huniform,h0,[-1,-1;1,1],[]);
    N = size(p,1); % number of mesh nodes
    M = size(t,1);
%     d=sqrt((p(:,1)-xc).^2+(p(:,2)-yc).^2)-r; From function, dont
%     uncomment
    for i=1:nx
        for j=1:ny
            r2=x(i)^2+y(j)^2;
            z(j,i)=exp(-r2);
        end
    end

    figure(1)
    % surf(x,y,z)
    pcolor(z)
    xlabel('x');
    ylabel('y');
    zlabel('z=f(x,y)');
end


