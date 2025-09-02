% Problem 1, HW 1
% Roxanne Lutz
% 9/2/25
% MATH375
clc, clearvars
close all

h = 0.1;
x = [-pi:h:pi];
%AxesH = axes('Xlim', [-pi, pi], 'XTick', [(-pi):h:pi], 'NextPlot', 'add');

y_exact   = cos(x);
y_taylor2 = 1 - (1/2)*(x.^2);

plot(x, y_exact, '*', x, y_taylor2, '--');
