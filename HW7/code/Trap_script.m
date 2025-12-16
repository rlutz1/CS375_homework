%Trapezoid script for approximating 
%the integral(f(x),{x,a,b}).
clc
clear all
format long
%domain [a,b]
a=0;b=pi;
n=161; %number of points in partition
h=(b-a)/(n);
x=[a:h:b];
%little shift from the pseudo-code to MATLAB
sum=0.5*(sin(a)+sin(b));
for i=1:length(x)-2
   x=a+i*h;
   sum=sum+sin(x);
end
sum=sum*h;

fprintf('area approx - our code')
sum