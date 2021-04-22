clc, clear all, clear;


%% Simple Single Intergration of sinx
% Defining function and variables values
y = @sin; a = 0; b = pi; N = 253;
% To study the convergence error you can play around with the N value
% Since you know the analytical solution answer is 2.
% >>> Discrete or analytical integration converges at N = 50, I = 2.0001
% >>> Trapezoidal integration converges at N = 200, I = 2.0
% >>> Simson's 1/3 integration converges at N = 183, I = 2.0
% >>> Simson's 3/8 integration converges at N = 253, I = 2.0
%% Discrete or analytical integration
if 0    % Use 0 to switch this loop of and 1 to switch on
    % Initializing arraya
    M = [1:100];    % Save x array in M
    L = length(M);
    grid = zeros(1,L);  % Save y array in grid
        % You initialize y to zero so new answer from the function
        % fill in this dependent variable
    for i = 1:L
        N = M(i);       % Storing each iteration 
        dx = (b-a)/N;   % using each stored iteration
        x= [0.5:N-0.5]*dx;  % Taking and storing iterationof inner grid x*dx
        y1 = y(x);      % Computing the sine function
        I = sum(y1)*dx; % Integrating and summing till end of iteration
        grid(i) = I;    % Storing each cumsum of iteration for plot
        plot(M,grid);   % Plot x array and new y values
        ylim([1.95 2.1]);
        drawnow;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% TRAPEZOIDAL INTEGRATION
% x = linspace(a,b,N);
% dx = x(2) - x(1);
% 
% y1 = y(x);      % Evaluating function
% 
% w=[ 0.5 ones(1,N-2) 0.5 ]; % We assigned the weight to 0.5 and ones
%                 % We assigned the weigth for the first as 0.5, the middle
%                 % grid as ones and the last as 0.5
% I = sum(w.*y1)*dx;   % Integrating with the function                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%% SIMPSON'S 1/3 RULE INTEGRATION
if 0    % Switch on = 1 and off = 0 
    x = linspace(a,b,N);
    dx = x(2) - x(1);

    y1 = y(x);      % Evaluating function

    I = 0;          % You neeed to initialize the answer I to O 
                    % in Sinmpsons rule 
    for i = 1 : 2 : N-2     % Grid spacing of 2 according to Simp 1/3 rule
        a = y1(i) + 4*y1(i+1) + y1(i+1); % Simpsons integral solution
        I = I + a;  % Cumsuming and storing I for every a iteration answer
    end
    I = I*(dx/3);    % Cumsum of simpsons integral
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SIMPSON'S 3/8 RULE INTEGRATION
if 0    % Switch on = 1 and off = 0 
    x = linspace(a,b,N);
    dx = x(2) - x(1);

    y1 = y(x);      % Evaluating function

    I = 0;          % You neeed to initialize the answer I to O 
                    % in Sinmpsons rule 
    for i = 1 : 3 : N-3     % Grid spacing of 2 according to Simp 1/3 rule
        a = y1(i) + 3*y1(i+1) + 3*y1(i+2) + y1(i+3); % Simpsons integral solution
        I = I + a;  % Cumsuming and storing I for every a iteration answer
    end
    I = I*(3*dx/8)    % Cumsum of simpsons integral
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Euler Integration
if 0    % Switch on = 1 and off = 0 
    g=9.81; %parameters
    m=65;
    c=0.5;
    vt=(m*g/c)^0.5; % terminal velocity
    tstar=(m/g/c)^0.5; % relaxation time
    tmax=20; % maximum time
    t=[0:0.1:tmax]; % time domain for plotting analytic solution
    vel= @(t,vt,tstar) vt*tanh(-t/tstar); % function of the solution
    dt=0.1; %time increment for Euler, Numerical solution almost 
            % equals analytic at smaller dt of 0.1
    loct=0; % local variables for time and velocity
    locv=0;
    time(1)=loct; % time array: initialise first value
    velocity(1)=locv; % velocity array: initialise first value
    i=1; % count the number of steps
    while loct<tmax % loop for integration. use tmax as limit
        i=i+1; % increment the step (integers)
        loct=loct+dt; % increment the time
        locv=locv+dt*(-g+c/m*locv^2); % increment velocity (Euler algorithm)
        time(i)=loct;           % add one value to time array
        velocity(i)=locv;       % add one value to velocity array
        % plotting nicely
        figure(1);
        plot(t,vel(t,vt,tstar),'-'); % plot the analytic solution for comparison
        hold on;
        plot(time,velocity,'-s','MarkerSize',4,... % plot computed numerical solution
        'MarkerFaceColor','red')
        hold off;
        axis([0 tmax -40 0])    % some graphic settings
        pbaspect([2 1 1])
        xlabel('time');
        ylabel('velocity');
        pause(0.1);             % little pause to see the progression
    end
% For dt = 1 you would notice a large difference between the numerical and
% analytic solution compared to dt=0.1 which has little or no difference. 
% So Euler Integration is not very useful for large time steps
end