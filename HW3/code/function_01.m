% Roxanne Lutz
% MATH375
% 9/25/2025
% HW3

% function for calculating y and y' of the given computer problem 1
% funcition:
% f(x) = -x^3 + x^2 + x + 1

function [y, dy] = function_01(x);
    y = ((-1) * (x .^ 3)) + (x .^ 2) + x + 1
    dy = ((-3) * (x .^2)) + (2 * x) + 1
end;