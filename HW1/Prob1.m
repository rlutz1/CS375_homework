% Problem 1, HW 1
% Roxanne Lutz
% 9/2/25
% MATH375
clc, clearvars
close all

% --------------------------------------
% Compare exact values of cos(x)
% to different Taylor approximations.
% --------------------------------------

h = 0.1; % domain spacing of 0.1
x = [-pi:h:pi]; % domain [-pi, pi]

y_exact = cos(x); % exact cos(x) function
y_taylor2 = 1 - (1/2)*(x.^2); % taylor approx, n = 2

% --------------------------------------
% plot part (a):
% plot exact y and taylor approximation on n = 2
% --------------------------------------

figure(1); % just cos(x) and taylor_2
plot(x, y_exact, 'g-'); hold on;
plot(x, y_taylor2, 'b*'); hold on;

legend( ...
    'Exact', ...
    'Taylor_2' ...
    );
title('y = cos(x) vs. Taylor Approximation of n = 2');
xlabel('Domain, [-pi, pi] with h = 0.1');
ylabel('Range, output of all differing functions');
grid on;

% --------------------------------------
% plot part (b):
% plot taylor approximation of n = 4
% --------------------------------------

y_taylor4 = y_taylor2 + (1/24)*(x.^4);

figure(2); % cos(x), taylor_2, taylor_4
plot(x, y_exact, 'g-'); hold on;
plot(x, y_taylor2, 'b*'); hold on;
plot(x, y_taylor4, 'c*'); hold on;

legend( ...
    'Exact', ...
    'Taylor_2', ...
    'Taylor_4' ...
    );
title('y = cos(x) vs. Taylor Approximations of n = 2, 4');
xlabel('Domain, [-pi, pi] with h = 0.1');
ylabel('Range, output of all differing functions');
grid on;

% --------------------------------------
% plot part (c)
% plot absolute errors e_2 and e_4
% --------------------------------------

% formula for absolute/actual error: |f(x) - P_n(x)|
e_2 = abs(y_exact - y_taylor2);
e_4 = abs(y_exact - y_taylor4);

figure(3); % just error plotting
plot(x, e_2, 'ro', x, e_4, 'r.'); hold on;

legend( ...
    'Error, Exact - Taylor_2', ...
    'Error, Exact - Taylor_4' ...
    );
title('Absolute Error for y = cos(x) vs. Taylor Approximations of n = 2, 4');
xlabel('Domain, [-pi, pi] with h = 0.1');
ylabel('Range, output of all differing functions');
grid on;

% some coherency for analyzing

% plot ALL graphs
figure(4); % init the figure
plot(x, y_exact, 'g-'); hold on;
plot(x, y_taylor2, 'b*'); hold on;
plot(x, y_taylor4, 'c*'); hold on;
plot(x, e_2, 'ro', x, e_4, 'r.'); hold on;

legend( ...
    'Exact', ...
    'Taylor_2', ...
    'Taylor_4', ...
    'Error, Exact - Taylor_2', ...
    'Error, Exact - Taylor_4' ...
    );
title('y = cos(x) vs. Taylor Approximations of n = 2, 4 with Error');
xlabel('Domain, [-pi, pi] with h = 0.1');
ylabel('Range, output of all differing functions');
grid on;
