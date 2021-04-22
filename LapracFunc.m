% Iteration with numerical solution of 2D partial differential equation
function lapT=LapracFunc(T,dx,dy)
[ny,nx]=size(T);
lapT=T;
for i=2:nx-1
    for j=2:ny-1
        lapT(j,i) = (1/4)*(T(j,i+1)+T(j,i-1)+T(j+1,i)+T(j-1,i));
    end
    T(2:ny-1,2:nx-1) = lapT(2:ny-1,2:nx-1);
end
end