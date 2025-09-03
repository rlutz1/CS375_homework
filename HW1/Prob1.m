% Problem 1, HW 1
% Roxanne Lutz
% 9/2/25
% MATH375
clc, clearvars
close all

h = 0.1; % domain spacing of 0.1
x = [-pi:h:pi]; % domain [-pi, pi]

y_exact   = cos(x); % exact cos(x) function
y_taylor2 = 1 - (1/2)*(x.^2); % taylor approx, n = 2

figure(1);

% plot part (a):
% plot exact y and taylor approximation

plot(x, y_exact, '-'); hold on;
plot(x, y_taylor2, '*'); hold on;

% plot part (b):
% plot taylor approximation of n = 4

y_taylor4 = y_taylor2 + (1/24)*(x.^4);

plot(x, y_taylor4, '+'); hold on;

% some coherency for analyzing

legend('Exact','Taylor Approx, n = 2', 'Taylor Approx, n = 4');
title('y = cos(x) VS y = 1 - (1/2)*(x^2)');
grid on;
