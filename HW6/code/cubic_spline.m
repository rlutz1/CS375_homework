% Roxanne Lutz
% MATH375
% 11/10/2025
% HW6

function [a, b, c, d] = cubic_spline(x, y)

    % attempting to follow the burden textbook for natural spline, page 147
    n = length(x);
    for i = 1:(n - 1) % for i = 0 -> n - 1
        % set h_i = x_i - x_i+1
        h(i) = abs(x(i) - x(i + 1));

        

    end
    h
    a = 1; b = 2; c = 3; d = 4;
end