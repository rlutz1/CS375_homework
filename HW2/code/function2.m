% Roxanne Lutz
% MATH375
% 9/15/2025
% HW2

% this is the function to find roots of
% which is the distance function between
% y = x^2 and point (1, 0)
% f(x) = 4x^3 + 2x - 2
% f'(x) = 12x^2 + 2

function [y, dy] = function2(x)
    y = (4 * (x .^ 3)) + (2 * x) - 2;
    dy = (12 * (x .^ 2)) + 2;
end