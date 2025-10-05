% Roxanne Lutz
% MATH375
% 9/25/2025
% HW3

% on-run cleanup tasks
clc, clearvars, close all;

tolerance = 10 ^ (-8); % tolerance specified by problem
iterations = 20; % chosen arbitrarily to get approximation
x_init = 2; % initial guess based on graph

% run newtons method with given method
[x_approx, y_approx, iterations_needed, success] = ...
  newtonsMethod(tolerance, iterations, x_init, @(x) function_01(x));

% print success if we've found a zero within iterations and tolerance
if success;
    disp( ...
        "Approximate root found successfully in " ...
        + iterations_needed ...
        + " iterations: x = " ...
        + x_approx(end) ...
        );
else;
    disp( ...
        "Approximate root was NOT found within tolerance in " ...
        + iterations + " iterations." ...
        );
end;

% get exact values of function to plot against approximations
h = 0.01; start_pt = -1; end_pt = 2; % initialization values
x_exact = [start_pt:h:end_pt]; % calculate exact for these vals of x
y_exact = zeros(size(x_exact)); % preallocate memory
counter = 1;

for x = x_exact;
    [y, dy] = function_01(x);
    y_exact(counter) = y;
    counter = counter + 1;
end;

% plot the exact graph versus the approximation points
figure(1);
plot(x_exact, y_exact, "--c", x_approx, y_approx, "oy", x_approx(1), y_approx(1), "og", LineWidth=1.5);
hold on;

legend( ...
    'Exact Values of f(x)', ...
    "Approximations to the Root with Newton's Method", ...
    "Initial Guess, x = " + x_init ...
    );
title("Exact f(x) vs Approximations to the Root using Newton's Method");
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Range, output of f(x) and Approximations');
grid on;