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
[t1, N1_rk] = ode45(N_prime, [0:t_f], N_0_1);
[t2, N2_rk] = ode45(N_prime, [0:t_f], N_0_2);
[t3, N3_rk] = ode45(N_prime, [0:t_f], N_0_3);

% plot the models
figure(1);

plot(t1, N1_rk, 'g--'); hold on;
plot(t2, N2_rk, 'b--'); hold on;
plot(t3, N3_rk, 'y--'); hold on;

legend('N_0 = 100', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N)');
title('Logistic Model, ode45 (Runge-Kutta) (N_0 = 100, 750, 1300)');

% --------------------------------------
% plot part (b):
% repeat part (a) but by implementing 
% Euler's scheme.
% --------------------------------------

% Euler's base scheme is as follows:
% x_n+1 = x_n + dt * f'(x_n), x(0) = x_0

% implementing Eulers:
t_f = 2000; % note: 10 times the steps needed to see convergence
ts = [0:t_f];

% N_0 = 100
N_0 =100;
N_curr = N_0;
N_next = N_0;
N1_eu = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_next = N_curr + dt * N_prime(t, N_curr);
    N1_eu(t + 1) = N_next;
    N_curr = N_next;
end;

% N_0 = 750
N_0 = 750;
N_curr = N_0;
N_next = N_0;
N2_eu = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_next = N_curr + dt * N_prime(t, N_curr);
    N2_eu(t + 1) = N_next;
    N_curr = N_next;
end;

% N_0 = 1300
N_0 = 1300;
N_curr = N_0;
N_next = N_0;
N3_eu = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_next = N_curr + dt * N_prime(t, N_curr);
    N3_eu(t + 1) = N_next;
    N_curr = N_next;
end;

% plot euler's scheme

figure(2);

plot(ts, N1_eu, 'g--', ts, N2_eu, 'b--', ts, N3_eu, 'y--'); hold on;

legend('N_0 = 100', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N)');
title("Logistic Model, Euler's Scheme (N_0 = 100, 750, 1300)");

% --------------------------------------
% plot part (c):
% use a single initial condition
% and plot both Euler's and Improved Eulers.
% --------------------------------------

% we will choose N_0 = 100

% implement improved Eulers

t_f = 2000; 
ts = [0:t_f];

N_0 = 100;
N_curr = N_0;
N_next = N_0;
N_tilde = N_0;
N1_euImproved = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_tilde = N_curr + dt * N_prime(t, N_curr);
    N_next = N_curr + (dt / 2) * (N_prime(t, N_curr) + N_prime(t, N_tilde));
    N1_euImproved(t + 1) = N_next;
    N_curr = N_next;
end;

N_0 = 750;
N_curr = N_0;
N_next = N_0;
N_tilde = N_0;
N2_euImproved = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_tilde = N_curr + dt * N_prime(t, N_curr);
    N_next = N_curr + (dt / 2) * (N_prime(t, N_curr) + N_prime(t, N_tilde));
    N2_euImproved(t + 1) = N_next;
    N_curr = N_next;
end;


N_0 = 1300;
N_curr = N_0;
N_next = N_0;
N_tilde = N_0;
N3_euImproved = [];
dt = 0.1; % setting based on class work

for t = ts;
    N_tilde = N_curr + dt * N_prime(t, N_curr);
    N_next = N_curr + (dt / 2) * (N_prime(t, N_curr) + N_prime(t, N_tilde));
    N3_euImproved(t + 1) = N_next;
    N_curr = N_next;
end;
figure(3);

plot(ts, N1_eu, 'g*', ts, N1_euImproved, 'r+', ...
    ts, N2_eu, 'g*', ts, N2_euImproved, 'r+', ...
    ts, N3_eu, 'g*', ts, N3_euImproved, 'r+'); 
hold on;

legend('', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N)');
title("Logistic Model, Euler's and Euler's Improved Scheme (N_0 = 100");
