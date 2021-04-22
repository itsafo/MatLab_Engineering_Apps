close all;
clearvars;
func= @(x) (x).^2;              % function of which we seek the minimum 'y = x^2'
func1= @(x) 2*(x);              % first derivative "y' = 2x"
xaxis=[-5:0.1:5];               % the axis for plotting the function
xin=-3;                         % initial guess (not close, on purpose)
x=xin;
step=0.2;                       % increment step (tunes speed vs accuracy)
for i=1:20
tpoints(i)=i;                   %sequence of iterations from 1 to 20
                                %(adds one element to the array each time)
xpoints(i)=x;                   %sequence of x values from -3 to 0
fpoints(i)=func(x);             %sequence of f(x) values
x= x-step*func1(x);             % core of the gradient descent
figure(1);
plot(tpoints,xpoints,'-s',...   % Plots a graph of [1:20] on x-axis and [-3:0] on y-axis
'MarkerSize',10,...             % note the dots to continue
'MarkerFaceColor','red')        % a command in the next line
figure(2);
plot(xaxis,func(xaxis),'+');    % Plots a graph of [-5:0.1:5] on x-axis & [-5^2:5^2] on y-axis with + sign  
hold on;                        % 
plot(xpoints,fpoints,'-s',...   % Plots a graph of [-3:0] on x-axis and [-3^2:0^2] on y-axis
'MarkerSize',10,...             % On an already defined xaxis [-5:0.1:5] & [-5^2:5^2] y-axis 
'MarkerFaceColor','red')        % of red box points over the function
hold off;
pause(0.2);                     % pauses the algorithm for 0,2 seconds at each iteration
                                % make the pause very small if calculation is much heavier
end