% Roxanne Lutz
% MATH375
% 9/25/2025
% HW3

% this is newtons method for finding a root but condensed to a function.

function [xapprox, yapprox, iterationsNeeded, success] = newtonsMethod(tolerance, iterations, x_start, function1)

% some initial values
% tolerance = 10 ^ (-4); % allowed to get approximate within 10^-4 as stated within problem.
% iterations = 20; % how many times to iterate
x_curr = x_start; % initial guess

% flag for a successful approximation within these parameters
success = false;
% for counting the actual iterations used for easy printing
iterationsNeeded = 0;

for i = 1:iterations;

    

    [y, dy] = function1(x_curr); % get f(x) and f'(x)

    % hold values for plotting
    xapprox(i) = x_curr;
    yapprox(i) = y;

    if abs(y) < tolerance; % found 0 within tolerance
        success = true;
        break;
    end;

    iterationsNeeded = iterationsNeeded + 1; % for printing only

    x_curr = x_curr - (y ./ dy); % apply newtons method;

end;

end