function [output] = Basic_f(N)
%Matlab function to account for the right handside of the ODE f(x,y)
r=0.05;K=1000;
%output=r*N*(1-N/K); %Logistic
output=r*N; %basic exponential growth
end