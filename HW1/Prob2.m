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

% initial values given
N0_1 = 100;
N0_2 = 750;
N0_3 = 1300;

% logistic model constants given
r = 0.05;
K = 1000;

% --------------------------------------
% plot part (a):
% use: r = 0.05, K = 1000, N_0 = 100
% to find solution and plot.
% plot on domain [0, T_f].
% change values of N_0 to 750, 1300...
% --------------------------------------

t_f = 200; % setting to 200 shows convergence clearly
dt = 0.01; % setting with somewhat small steps
ts = [0:dt:t_f];

% solve the ode with the runge-kutta scheme, ode45
[t1, N1_rk] = ode45(@(t, N) logModel(N, r, K), ts, N0_1);
[t2, N2_rk] = ode45(@(t, N) logModel(N, r, K), ts, N0_2);
[t3, N3_rk] = ode45(@(t, N) logModel(N, r, K), ts, N0_3);

% plot the models
figure(1);

plot(ts, N1_rk, 'g--', ts, N2_rk, 'b--', t3, N3_rk, 'y--', 'LineWidth', 1); hold on;

legend('N_0 = 100', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N(t))');
title('Logistic Model, ode45 (Runge-Kutta) (N_0 = 100, 750, 1300)');

% --------------------------------------
% plot part (b):
% repeat part (a) but by implementing 
% Euler's scheme.
% --------------------------------------

iterations = length(ts); % how many times to run the scheme

N1_eu = euler(iterations, N0_1, dt, @(N) logModel(N, r, K));
N2_eu = euler(iterations, N0_2, dt, @(N) logModel(N, r, K));
N3_eu = euler(iterations, N0_3, dt, @(N) logModel(N, r, K));

% plot euler's scheme

figure(2);

plot(ts, N1_eu, 'g--', ts, N2_eu, 'b--', ts, N3_eu, 'y--', 'LineWidth', 1); hold on;

legend('N_0 = 100', 'N_0 = 750', 'N_0 = 1300');
xlabel('Time (t)');
ylabel('Change in N (N(t))');
title("Logistic Model, Euler's Scheme (N_0 = 100, 750, 1300)");

% --------------------------------------
% plot part (c):
% use a single initial condition
% and plot both Euler's and Improved Eulers.
% --------------------------------------

% we will choose N0 = 100
% keep other variables unchanged for consistency

N1_euImproved = eulerImproved(iterations, N0_1, dt, @(N) logModel(N, r, K));

% plot improved euler against euler at N_0 = 100

figure(3);

plot(ts, N1_eu, 'g-', ts, N1_euImproved, 'r--', 'LineWidth', 1.5); hold on;

legend('Euler Scheme', 'Improved Euler Scheme');
xlabel('Time (t)');
ylabel('Change in N (N(t))');
title("Logistic Model, Euler's and Euler's Improved Scheme (N_0 = 100)");

% for fun: figures with all euler & improved comparisons

N2_euImproved = eulerImproved(iterations, N0_2, dt, @(N) logModel(N, r, K));
N3_euImproved = eulerImproved(iterations, N0_3, dt, @(N) logModel(N, r, K));

figure(4);

plot(ts, N1_eu, 'g-', ...
    ts, N1_euImproved, 'r--', ...
    ts, N2_eu, 'b-', ...
    ts, N2_euImproved, 'c--', ...
    ts, N3_eu, 'm-', ...
    ts, N3_euImproved, 'y--', ...
    'LineWidth', 1 ...
    ); hold on;

legend('Euler Scheme, N_0 = 100', ...
    'Improved Euler Scheme, N_0 = 100', ...
    'Euler Scheme, N_0 = 750', ...
    'Improved Euler Scheme, N_0 = 750', ...
    'Euler Scheme, N_0 = 1300', ...
    'Improved Euler Scheme, N_0 = 1300' ...
    );
xlabel('Time (t)');
ylabel('Change in N (N(t))');
title("Logistic Model, Euler's and Euler's Improved Scheme (N_0 = 100, 750, 1300)");


% some fun: error plotting between the methods
% against the exact value

%{
% init values of exact answer, N0 = 100
N1_exact = zeros(iterations, 1); % init vector
counter = 1;

for t = ts;
    N1_exact(counter) = logModelExact(N0_1, t, r, K);
    counter = counter + 1;
end;

% init values of exact answer, N0 = 750
N2_exact = zeros(iterations, 1); % init vector
counter = 1;

for t = ts;
    N2_exact(counter) = logModelExact(N0_2, t, r, K);
    counter = counter + 1;
end;

% init values of exact answer, N0 = 1300
N3_exact = zeros(iterations, 1); % init vector
counter = 1;

for t = ts;
    N3_exact(counter) = logModelExact(N0_3, t, r, K);
    counter = counter + 1;
end;

e1_exactVSode45 = abs(N1_exact - N1_rk);
e1_exactVSeu = abs(N1_exact - N1_eu);
e1_exactVSeuImproved = abs(N1_exact - N1_euImproved);

%e2_exactVSode45 = abs(N2_exact - N2_rk);
%e2_exactVSeu = abs(N2_exact - N2_eu);
%e2_exactVSeuImproved = abs(N2_exact - N2_euImproved);

%e3_exactVSode45 = abs(N3_exact - N3_rk);
%e3_exactVSeu = abs(N3_exact - N3_eu);
%e3_exactVSeuImproved = abs(N3_exact - N3_euImproved);

figure(6);

%plot(ts, N1_exact, 'w--'); hold on;

plot(ts, e1_exactVSode45, 'g:', ...
    ts, e1_exactVSeu, 'r:', ...
    ts, e1_exactVSeuImproved, 'y:' ...
    ); hold on;

%plot(ts, e2_exactVSode45, 'g--', ...
%    ts, e2_exactVSeu, 'r:', ...
%    ts, e2_exactVSeuImproved, 'y*' ...
%    ); hold on;

%plot(ts, e3_exactVSode45, 'g--', ...
%    ts, e3_exactVSeu, 'r:', ...
%    ts, e3_exactVSeuImproved, 'y*' ...
%    ); hold on;

legend('EXACT VS RK, N_0 = 100', ...
    'EXACT VS EU, N_0 = 100', ...
    'EXACT VS EUIMPROVED, N_0 = 100' ...
    );
xlabel('Time (t)');
ylabel('Change in N (N(t))');
title("Error Comparisons between RK (ode45), Euler, and Euler improved (N_0 = 100)");
%}
