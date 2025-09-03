% Problem 2, HW 1
% Roxanne Lutz
% 9/3/25
% MATH375
clc, clearvars
close all

% --------------------------------------
% solve the initial value problem given
% by logistic model:
% N' = rN(1-(N/K)), N(0) = N_0
% using built in ODE45
% --------------------------------------

% --------------------------------------
% plot part (a):
% (1) use: r = 0.05, K = 1000, N_0 = 100
% to find solution and plot.
% plot on domain [0, T_f].
% change values of N_0 to 750, 1300...
% --------------------------------------

% N' = rN(1-(N/K)), N(0) = N_0
t_f = 200;
h = 10;

t = [0:t_f];
r = 0.05;
K = 1000;
N_0 = 100;
N_prime = @(y, N) r * N * (1 - N/K);

ode45(N_prime, t, N_0)

%output=r*N*(1-N/K); %Logistic

