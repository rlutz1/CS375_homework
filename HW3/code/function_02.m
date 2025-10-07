% Roxanne Lutz
% MATH375
% 10/5/2025
% HW3

% function for calculating y of the given computer problem 2
% function:
% f(x) = 2x(1+x^2)^-1 - arctanx

function [y, dy] = function_02(x)
    y = ((2 .* x) ./ (1 + (x .^ 2))) - atan(x); % f(x)
    dy = ((-3 .* (x .^ 2)) + 1) ./ ((1 + (x .^ 2)) .^ 2); % f'(x)
end