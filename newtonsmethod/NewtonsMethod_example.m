%Sample script for Newton's Method
%Solving f(x)=0, with starting initial guess x_o
%Method: x_{n+1}=x_{n}-f(x_n)/f'(x_n+1)

clc
clear all
format long
n_max=20; % num of max iterations we want the code to run, out choice
tol=10^(-14); % we are happy with this being as close to 0 as we need
%initial guess
xold=0;

formatSpec = '%d, %d, %d';
for n=1:n_max
    
    fx=(xold+1)^2-exp(xold)-1; % f(x_n)
    fprimex=2*(xold+1)-exp(xold); %f'(x_n)
    %print
    sprintf(formatSpec,n-1,xold,fx)
    
    % for table printing
    xapprox(n)=xold;
    yapprox(n)=fx;
    
    xnew=xold-(fx)/(fprimex); % newton scheme, babbyyyy
    
    
    %stopping criteria, close enough, stop the loop
     if abs(fx)<tol
        break
    end
    
    %update
    xold=xnew;
end

% plotting
x=[0:.1:2];y=(x+1).^2-exp(x)-1;
figure(2);
plot(x,y)
hold on
plot(xapprox,yapprox,'o')
grid on;
