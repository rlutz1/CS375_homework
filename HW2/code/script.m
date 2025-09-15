% Roxanne Lutz
% MATH375
% 9/15/2025
% HW2

% this is the main script file.

% on-run cleanup tasks
clc, clearvars, close all;

% some initial values
tolerance = 10 ^ (-4); % allowed to get approximate within 10^-4 as stated within problem.
iterations = 20; % how many times to iterate
x_curr = 2; % initial guess

% init vectors for speed
% xapprox = zeros(iterations, 1);
% yapprox = zeros(iterations, 1);
success = false;

for n = 1:iterations;

    [y, dy] = function2(x_curr); % get f(x) and f'(x)

    % hold values for plotting
    xapprox(n) = x_curr;
    yapprox(n) = y;

    x_next = x_curr - (y ./ dy); % apply newtons method

    if abs(x_next - x_curr) < tolerance; % found 0 within tolerance
        success = true;
        break;
    end;

    x_curr = x_next;

end;

% print success if we've found a zero within iterations and tolerance
if success;
    disp("Approximate found successfully: x = " + x_next);
else;
    disp("Approximate was NOT found successfully.");
end;

% plot exact values of function to find root of
h = 0.1; startPt = -10; endPt =  10;
xexact = [startPt:h:endPt];
% yexact = zeros(size(xexact));
counter = 1;
for x = xexact;
    [y, dy] = function2(x);
    yexact(counter) = y;
    counter = counter + 1;
end;


plot(xexact, yexact, "--c", xapprox, yapprox, "oy")
