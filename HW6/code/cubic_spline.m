% Roxanne Lutz
% MATH375
% 11/10/2025
% HW6

function [a, b, c, d] = cubic_spline(x, y)

    % attempting to follow the burden textbook for natural spline, page 147
    n = length(x);

    % step 1
    for i = 1:(n - 1); % for i = 0 -> n - 1
        % set h_i = x_i - x_i+1
        h(i) = abs(x(i) - x(i + 1));  
    end
    
    % step 2
    alpha(1) = 0;
    for i = 2:(n - 1);
        alpha(i) = ((3 ./ h(i)) * (y(i + 1) - y(i))) - ((3 ./ h(i - 1)) * (y(i) - y(i - 1)));
    end    
 
    % step 3
    l(1) = 1; mew(1) = 0; z(1) = 0;

    % step 4
    for i = 2:(n - 1);
        l(i) = (2 .* (x(i + 1) - x(i - 1))) - (h(i - 1) .* mew(i - 1));
        mew(i) = h(i) ./ l(i);
        z(i) = (alpha(i) - (h(i - 1) .* z(i - 1))) ./ l(i);
    end

    % step 5
    l(n) = 1;
    z(n) = 0;
    c(n) = 0;

    % step 6
    for i = (n - 1):-1:1;
        c(i) = z(i) - (mew(i) .* c(i + 1));
        b(i) = ((y(i + 1) - y(i)) ./ h(i)) - (h(i) .* ((c(i + 1) + (2 .* c(i))) ./ 3));
        d(i) = (c(i + 1) - c(i)) ./ (3 .* h(i));
    end


    a = y;
end