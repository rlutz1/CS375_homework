% Problem 1, HW 1
% Roxanne Lutz
% 9/2/25
% MATH375
clc, clearvars
close all

h = 0.1; % domain spacing of 0.1
x = [-pi:h:pi]; % domain [-pi, pi]

y_exact = cos(x); % exact cos(x) function
y_taylor2 = 1 - (1/2)*(x.^2); % taylor approx, n = 2

figure(1); % init the figure

% --------------------------------------
% plot part (a):
% plot exact y and taylor approximation
% --------------------------------------

plot(x, y_exact, 'g-'); hold on;
plot(x, y_taylor2, 'b*'); hold on;

% --------------------------------------
% plot part (b):
% plot taylor approximation of n = 4
% --------------------------------------

y_taylor4 = y_taylor2 + (1/24)*(x.^4);

plot(x, y_taylor4, 'c*'); hold on;

% --------------------------------------
% plot part (c)
% plot absolute errors e_2 and e_4
% --------------------------------------

% formula for absolute/actual error: |f(x) - P_n(x)|
e_2 = abs(y_exact - y_taylor2);
e_4 = abs(y_exact - y_taylor4);

plot(x, e_2, 'ro', x, e_4, 'r.'); hold on;

% some coherency for analyzing

legend( ...
    'Exact', ...
    'Taylor_2', ...
    'Taylor_4', ...
    'Error, Exact - Taylor_2', ...
    'Error, Exact - Taylor_ 4');
title('y = cos(x) vs. Taylor Approximations of n = 2, 4');
grid on;
