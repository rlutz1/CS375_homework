% Roxanne Lutz
% MATH375
% 11/10/2025
% HW6

% script run cleanup tasks
clc, clearvars, close all;

start_pt = -3; end_pt = 3; % initial start and end points

h = 0.01;
% exact function to compare to
x_exact = [start_pt:h:end_pt];
y_exact = tanh(x_exact);

n = 10; % P10, 11 equispaced nodes (n + 1 nodes)
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_P10 = [start_pt:h_equispaced:end_pt];
y_P10 = tanh(x_P10); % evaluate data points

a_coeff = Coef(n, x_P10, y_P10); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_P10_Interp = [start_pt:h:end_pt];
for i = 1:length(x_P10_Interp);
    y_P10_Interp(i) = Eval(n, x_P10, a_coeff, x_P10_Interp(i));
end;

% plot the spline and G20
figure('Name', "P" + n + ", Exact tanh(x)");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_P10_Interp, y_P10_Interp, '--y', ...
    'LineWidth', 1.5 ...
    )
legend("Exact tanh(x) Values", "P" + n);
title('P10 VS Exact tanh(x)')
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Function Output');
% ylim([0, 1]); % limit specified as needed
grid on;

n = 10; % 11 equispaced nodes for now (n + 1 nodes)
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_cubic_spline = [start_pt:h_equispaced:end_pt];
y_cubic_spline = tanh(x_cubic_spline); % evaluate data points

% I believe this is yielding a + bx + cx2 + dx3
[a, b, c, d] = spline_deg_3(x_cubic_spline, y_cubic_spline);

x_cubic_interp = [start_pt:h:end_pt];
% basically we need to go through each of these points
% figure out which interval theyre in
int = -1;
% find the correct interval x is within
for j = 1:length(x_cubic_interp);
    x = x_cubic_interp(j);
    for i = n-1:-1:1
        if (x - x_cubic_spline(i)) >= 0; 
            int = i;
            break;
        end
    end
    y_cubic_interp(j) = a(int) + (b(int) .* (x - x_cubic_spline(int))) + (c(int) .* ((x - x_cubic_spline(int)) .^ 2)) + (d(int) .* ((x - x_cubic_spline(int)) .^ 3));
end

% plot the spline and G20
figure('Name', "S" + (n + 1) + ", Exact tanh(x)");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_cubic_interp, y_cubic_interp, '--y', ...
    'LineWidth', 1.5 ...
    )
legend("Exact tanh(x) Values", "S" + (n + 1));
title('S10 VS Exact tanh(x)')
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Function Output');
% ylim([0, 1]); % limit specified as needed
grid on;

% and grab the correct coefficients

% TODO:
% 1. plot all 3 against each other. plot errors as well for visuals.
% 2. plot on [-5, 5] and see what happens with n = 10
% 3. try increasing n to see how that effects [-5, 5] results.