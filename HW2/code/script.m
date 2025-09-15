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

for i = 1:iterations;

    [y, dy] = function2(x_curr); % get f(x) and f'(x)

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
    disp("Approximate root found successfully: x = " + x_curr);
else;
    disp("Approximate root was NOT found within tolerance in " + iterations + " iterations.");
end;

% plot exact values of function to find root of
h = 0.1; startPt = -5; endPt =  5; % initilization values
xexact = [startPt:h:endPt]; % calucluate exact for these vals of x
yexact = zeros(size(xexact)); % preallocate memory
counter = 1;

for x = xexact;
    [y, dy] = function2(x);
    yexact(counter) = y;
    counter = counter + 1;
end;

% plot the exact graph versus the approximation points
plot(xexact, yexact, "--c", xapprox, yapprox, "oy")
