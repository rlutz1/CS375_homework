% Roxanne Lutz
% MATH375
% 9/15/2025
% HW2

% this is the main script file.

% on-run cleanup tasks
clc, clearvars, close all;

% some initial values
tolerance = 10 ^ (-4); % allowed to get approximate within 10^-4 as stated within problem.
iterations = 20; % how many times to iterate
x_curr = 2; % initial guess

% flag for a successful approximation within these parameters
success = false;
% for counting the actual iterations used for easy printing
iterationsNeeded = 0;

for i = 1:iterations;

    iterationsNeeded = iterationsNeeded + 1; % for printing only

    [y, dy] = function1(x_curr); % get f(x) and f'(x)

    % hold values for plotting
    xapprox(i) = x_curr;
    yapprox(i) = y;

    if abs(y) < tolerance; % found 0 within tolerance
        success = true;
        break;
    end;

    x_curr = x_curr - (y ./ dy); % apply newtons method;

end;

% print success if we've found a zero within iterations and tolerance
if success;
    disp( ...
        "Approximate root found successfully in " ...
        + iterationsNeeded ...
        + " iterations: x = " ...
        + x_curr ...
        );
else;
    disp( ...
        "Approximate root was NOT found within tolerance in " ...
        + iterations ...
        + " iterations." ...
        );
end;

% get exact values of function to find root of
h = 0.1; startPt = -5; endPt =  5; % initilization values
xexact = [startPt:h:endPt]; % calucluate exact for these vals of x
yexact = zeros(size(xexact)); % preallocate memory
counter = 1;

for x = xexact;
    [y, dy] = function1(x);
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
