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
[xapprox, yapprox, iterationsNeeded, success] = ...
  newtonsMethod(tolerance, iterations, x_init, @(x) function_01(x));

% print success if we've found a zero within iterations and tolerance
if success;
    disp( ...
        "Approximate root found successfully in " ...
        + iterationsNeeded ...
        + " iterations: x = " ...
        + xapprox(end) ...
        );
else;
    disp( ...
        "Approximate root was NOT found within tolerance in " ...
        + iterations + " iterations." ...
        );
end;

% get exact values of function to plot against approximations
h = 0.01; startPt = -1; endPt = 2; % initialization values
xexact = [startPt:h:endPt]; % calculate exact for these vals of x
yexact = zeros(size(xexact)); % preallocate memory
counter = 1;

for x = xexact;
    [y, dy] = function_01(x);
    yexact(counter) = y;
    counter = counter + 1;
end;

% plot the exact graph versus the approximation points
figure(1);
plot(xexact, yexact, "--c", xapprox, yapprox, "oy", xapprox(1), yapprox(1), "og", LineWidth=1.5);
hold on;

legend( ...
    'Exact Values of f(x)', ...
    "Approximations to the Root with Newton's Method", ...
    "Initial Guess, x = " + x_init ...
    );
title("Exact f(x) vs Approximations to the Root using Newton's Method");
xlabel("Domain, [" + startPt + ", " + endPt + "] with h = " + h);
ylabel('Range, output of f(x) and Approximations');
grid on;