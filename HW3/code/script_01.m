% Roxanne Lutz
% MATH375
% 9/25/2025
% HW3

% on-run cleanup tasks
clc, clearvars, close all;

% run newtons method with given method
[xapprox, yapprox, iterationsNeeded, success] = newtonsMethod(10 ^ (-4), 20, -1, @(x) function_01(x));

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
        + "20 iterations." ...
        );
end;

% get exact values of function to find root of
h = 0.1; startPt = -5; endPt =  5; % initilization values
xexact = [startPt:h:endPt]; % calucluate exact for these vals of x
yexact = zeros(size(xexact)); % preallocate memory
counter = 1;

for x = xexact;
    [y, dy] = function_01(x);
    yexact(counter) = y;
    counter = counter + 1;
end;

% plot the exact graph versus the approximation points
figure(1);
plot(xexact, yexact, "--c", xapprox, yapprox, "oy", LineWidth=1.5);
hold on;

legend( ...
    'Exact Values of f(x)', ...
    'Approximations to the Root' ...
    );
title('Derived f(x) vs Approximations to the Root r, where f(r) = 0');
xlabel('Domain, [-5, 5] with h = 0.1');
ylabel('Range, output of f(x) and Approximations of f(r) = 0');
grid on;