% Roxanne Lutz
% MATH375
% 9/29/2025
% HW3

% this is the bisection method for approximating a root.

function [x_mids, y_mids, iterations_needed, success] = bisectionMethod(tolerance, iterations, x_start, x_end, f)

y_start = f(x_start); % initial evaluation at x1
success = false; % init success flag
iterations_needed = 0; % for easy printing

for i = 1:iterations;

    x_mid = (x_end + x_start) ./ 2; % find mid x val between x1 and x2
    [y_mid, ~] = f(x_mid); % evaluate at mid point 

    % save mid values for return plotting
    x_mids(i) = x_mid;
    y_mids(i) = y_mid;

    % if we've gotten close enough to a root, stop, success!
    if (abs(y_mid) < tolerance); 
        success = true;
        break;
    end;

    if (y_start * y_mid > 0); % if both pos or neg y vals
        % set mid value as new lower bound on interval
        x_start = x_mid;
        y_start = y_mid;
    else;
        % otherwise, set mid value as the new upper bound on interval
        x_end = x_mid;
    end;

    iterations_needed = iterations_needed + 1;

end;

end