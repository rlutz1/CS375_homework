% Roxanne Lutz
% MATH375
% 10/5/2025
% HW3

% function for calculating y of the given computer problem 2
% function:
% f(x) = 2x(1+x^2)^-1 - arctanx
%
% we will only return y value and not y' here because
% bisection method does not need y' for approximations.

function [y] = function_02(x)
    y = ((2 .* x) ./ (1 + (x .^ 2))) - atan(x);
end