
%8-21-2025
%sample code for Euler's Method

%to clear the workspace
clc

%
clear y_approx y_exact

%final time
Tf=150;

%growth rate r
r=0.05;

%Timestep
h=1/1;
iterations=Tf/h;

%initial conditions
y_init=100;

%time vector
time=[0:h:Tf];
y_approx(1)=y_init;
y_n=y_init;
for n=1:iterations
    y_new=y_n+h*Basic_f(y_n); % THE EULER SCHEME!!!
    %store numerical solution into a vector
    y_approx(n+1)=y_new;
    %update
    y_n=y_new;
end

%double check some stuff
size(time)
size(y_approx)
% y_exact y(t)=y_o Exp (r t)
%y_exact=y_init*exp(r*time); %this is exact but not for logistic

%solution plotting
figure(1);
%plot(time,y_approx,'ko',time,y_exact,'.-k');hold on
plot(time,y_approx,'ko');hold on
%title('Eulers Method for logistic Model')
title('Eulers Method for Exponential Growth')
%absolute error plotting
y_n=750;
y_approx(1)=y_n;
for n=1:iterations
    y_new=y_n+h*Basic_f(y_n);
    %store numerical solution into a vector
    y_approx(n+1)=y_new;
    %update
    y_n=y_new;
end
plot(time,y_approx,'bo');hold on
y_n=1300;
y_approx(1)=y_n;
for n=1:iterations
    y_new=y_n+h*Basic_f(y_n);
    %store numerical solution into a vector
    y_approx(n+1)=y_new;
    %update
    y_n=y_new;
end
plot(time,y_approx,'ro')
legend('N_0=100','N_0=750','N_0=1300')
grid on;
