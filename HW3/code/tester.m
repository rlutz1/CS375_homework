% not to submit, for playing with and testing theory on saddling issues

function [y, dy] = tester(x)
    % convergence point problem at sqrt(3) for this
    y = (x .^ 2) / (1 + (x .^ 2));
    dy = (2 * x) / ((1 + (x .^ 2)) .^ 2);

end