% Roxanne Lutz
% MATH375
% 9/25/2025
% HW3

% this is newtons method for finding a root but condensed to a function.

function [x_approx, y_approx, iterations_needed, success] = newtonsMethod(tolerance, iterations, x_start, f)

x_curr = x_start; % initial guess

% flag for a successful approximation within these parameters
success = false;
% for counting the actual iterations used for easy printing
iterations_needed = 0;

for i = 1:iterations;

    [y, dy] = f(x_curr); % get f(x) and f'(x)

    % hold values for plotting
    x_approx(i) = x_curr;
    y_approx(i) = y;

    if abs(y) < tolerance; % found 0 within tolerance
        success = true;
        break;
    end;

    iterations_needed = iterations_needed + 1; % for printing only

    x_curr = x_curr - (y ./ dy); % apply newtons method

end;

end