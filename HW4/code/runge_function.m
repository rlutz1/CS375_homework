% Roxanne Lutz
% MATH375
% 10/13/2025
% HW4

% function to hold the coding of the actual
% runge function: 1/(1+x^2)

function [y] = runge_function(x)
    y = 1 ./ (1 + (x .^ 2));
end
