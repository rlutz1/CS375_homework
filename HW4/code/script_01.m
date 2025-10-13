% Roxanne Lutz
% MATH375
% 10/13/2025
% HW4

% script run cleanup tasks
clc, clearvars, close all;

% preliminary: get f(x) plotted with more than 11 points
start_pt = -5; end_pt = 5;
h = 0.001; % 10,000 points plotted
x_exact = [start_pt:h:end_pt];

i = 1;
for x = x_exact;
    y_exact(i) = runge_function(x);
    i = i + 1;
end;

% plot the exact graph only, mainly for ensuring code is correct
figure(1);
plot( ...
    x_exact, y_exact, "--c", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function' ...
    );
title('Exact Values ONLY of Runge Function');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Output of Runge Function');
grid on;

% -----------------------------------------------------
% PART A
% -----------------------------------------------------


