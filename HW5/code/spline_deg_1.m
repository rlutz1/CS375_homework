% Roxanne Lutz
% MATH375
% 10/31/2025
% HW5

% code provided in class, equivalent to Spline1 code

function [output] = spline_deg_1(t, y, X)
% t vector represents the knots and y-vec contains y-values
% x is the point to be evaluated by the constructed degree 1 spline
% edited version can take vector of values [a:h:b]
clear output
n = length(t);

for j = 1:length(X) 
    x = X(j); % the x we want to evaluate using our splines

    % find the correct interval x is within
    for i = n-1:-1:1
        if (x - t(i)) >= 0;
            break;
        end
    end

    % simple line evaluation given the spline in that interval
    output(j) = y(i) + (x-t(i)) .* ((y(i + 1) - y(i)) / (t(i + 1) - t(i)));

end

end

