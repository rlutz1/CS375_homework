% Roxanne Lutz
% MATH375
% 9/29/2025
% HW3

% this is the bisection method for 

function [x_mids, y_mids, iterationsNeeded, success] = bisectionMethod(tolerance, iterations, x_start, x_end, f)

y_start = f(x_start); % initial evaluation at x1
success = false; % init success flag
iterationsNeeded = 0;

for i = 1:iterations;

    x_mid = x_start + ((x_end - x_start) ./ 2); % find mid x val between x1 and x2
    y_mid = f(x_mid); % evaluate at mid point 

    % x_ends(i) = x_end;
    % y_ends(i) = f(x_end);
    % 
    % x_starts(i) = x_start;
    % y_starts(i) = y_start;

    x_mids(i) = x_mid;
    y_mids(i) = y_mid;

    if (y_mid == 0 || ((x_end - x_start) / 2) < tolerance);
        success = true;
        break;
    end;

    if (y_start * y_mid > 0); % if both pos or neg y vals
        x_start = x_mid;
        y_start = y_mid;
    else;
        x_end = x_mid;
    end;

    iterationsNeeded = iterationsNeeded + 1;

end;

end