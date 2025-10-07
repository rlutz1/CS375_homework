% Roxanne Lutz
% MATH375
% 9/30/2025
% HW3

% coded version of function from computer problem #3
% see handwritten work in pdf to see how we
% got this function.
% but: f(x) = 
%   x^3 
%   - 2x((4 - tan(x)) / (sin(x) + 3x^2)) 
%   + ((4 - tan(x)) / (sin(x) + 3x^2))^7 
%   + 4x^3((4 - tan(x)) / (sin(x) + 3x^2)) 
%   - 5

function [y, dy] = function_03(x)

    % this is the y substitution value for clear reading
    y_sub = (4 - tan(x)) ./ (sin(x) + (3 .* (x ^ 2)));

    % helpers for coding dy_sub
    lowdhigh = (sin(x) + 3 * (x .^ 2)) .* (-(sec(x) .^ 2));
    highdlow = (4 - tan(x)) .* (cos(x) + (6 .* x));
    lowlow = (sin(x) + 3 .* (x .^ 2)) .^ 2;
    
    dy_sub = (lowdhigh - highdlow) ./ lowlow;

    % now find y and dy
    y = (x .^ 3) - (2 .* x .* y_sub) + (y_sub .^ 7) + (4 .* (x .^ 3) .* y_sub) - 5; %f(x)
    dy = (3 .* (x .^ 2)) - (2 .* y_sub) - (2 .* x .* dy_sub) + (7 .* (y_sub .^ 6) .* dy_sub) + (12 .* (x .^ 2) .* y_sub) + (4 .* (x .^ 3) .* dy_sub); %f'(x) 

end