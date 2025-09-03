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
% use: r = 0.05, K = 1000, N_0 = 100
% to find solution and plot.
% plot on domain [0, T_f].
% change values of N_0 to 750, 1300...
% --------------------------------------

t_f = 200; % setting to 200 shows convergence clearly

% given values of r and K
r = 0.05;
K = 1000;

% show different initial values and how it affects
N_0_1 = 100;
N_0_2 = 750;
N_0_3 = 1300;

% the given model:
% N' = rN(1-(N/K)), N(0) = N_0
N_prime = @(t, N) r * N * (1 - N/K);

% solve the ode with the runge-kutta scheme, ode45
[t1, N1] = ode45(N_prime, [0:t_f], N_0_1);
[t2, N2] = ode45(N_prime, [0:t_f], N_0_2);
[t3, N3] = ode45(N_prime, [0:t_f], N_0_3);

% plot the models
figure(1);

plot(t1, N1, 'g--'); hold on;
plot(t2, N2, 'b--'); hold on;
plot(t3, N3, 'y--'); hold on;

legend('N_0 = 100', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N)');
title('Logistic Model (N_0 = 100, 750, 1300)');

% --------------------------------------
% plot part (b):
% (1) use: r = 0.05, K = 1000, N_0 = 100
% to find solution and plot.
% plot on domain [0, T_f].
% change values of N_0 to 750, 1300...
% --------------------------------------

figure(2);

