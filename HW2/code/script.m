% Roxanne Lutz
% MATH375
% 9/15/2025
% HW2

% this is the main script file.

% cleanup tasks
clc, clearvars, close all;

% testing
%{
[y, dy] = function1([3, 4, 5]);
y, dy
%}


% some initial values
tolerance = 10 ^ (-4); % allowed to get approximate within 10^-4 as stated within problem.
iterations = 20; % how many times to iterate
x_0 = 2; % initial guess

for i = 1:iterations;

    [y, dy] = function2(x_0); % get f(x) and f'(x)

    x = x_0 - (y ./ dy); % apply newtons method

    xapprox(i) = x_0;
    yapprox(i) = y;

    if abs(x - x_0) < tolerance; % found 0 within tolerance
        disp("Approximate found successfully: x = " + x);
        %xapprox(i) = x;
        %yapprox(i) = y;
        break;
    end;

    x_0 = x;

end;

xexact = [-10:0.1:10];
counter = 1;
for x = xexact;
    [y, dy] = function2(x);
    yexact(counter) = y;
    counter = counter + 1;
end;


plot(xexact, yexact, "--c", xapprox, yapprox, "oy")
