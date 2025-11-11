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
 
% ================================================
%  BUILD CLASSIC P10 ON [-3, 3]
% ================================================

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
title("P" + n + " VS Exact tanh(x)");
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Function Output');
% ylim([0, 1]); % limit specified as needed
grid on;

% error plot
error = abs(y_exact - y_P10_Interp);

figure('Name', 'Absolute Error of Interpolating Polynomial Approximation'); %plotting the error
plot( ...
    x_exact, error, '.-r', ...
    LineWidth=1.5 ...
);
hold on;
legend( ...
    "Error of Interp Poly, n = " + n ...
    );
title("Interpolating Polynomial Error, n = " + n);
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('|Exact - Approximate|');
grid on;

% ================================================
%  BUILD CUBIC SPLINE INTERPOLATION ON [-3, 3]
% ================================================

n = 10; % 11 equispaced nodes for now (n + 1 nodes)
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_cubic_spline = [start_pt:h_equispaced:end_pt];
y_cubic_spline = tanh(x_cubic_spline); % evaluate data points

% I believe this is yielding a + bx + cx2 + dx3
[a, b, c, d] = spline_deg_3(x_cubic_spline, y_cubic_spline);

x_cubic_interp = [start_pt:h:end_pt];
% basically we need to go through each of these points
% figure out which interval theyre in
% find the correct interval x is within
for j = 1:length(x_cubic_interp);
    x = x_cubic_interp(j);
    for i = n-1:-1:1
        if (x - x_cubic_spline(i)) >= 0; 
            int = i;
            break;
        end
    end
    % and grab the correct coefficients and calculate
    y_cubic_interp(j) = a(int) + (b(int) .* (x - x_cubic_spline(int))) + (c(int) .* ((x - x_cubic_spline(int)) .^ 2)) + (d(int) .* ((x - x_cubic_spline(int)) .^ 3));
end

% plot the cubic spline and exact
figure('Name', "S" + (n + 1) + ", Exact tanh(x)");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_cubic_interp, y_cubic_interp, '--y', ...
    'LineWidth', 1.5 ...
    )
legend("Exact tanh(x) Values", "S" + (n + 1));
title("S" + (n + 1) + " VS Exact tanh(x)");
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Function Output');
% ylim([0, 1]); % limit specified as needed
grid on;


% error plot
error = abs(y_exact - y_cubic_interp);

figure('Name', 'Absolute Error of Cubic Spline Approximation'); %plotting the error
plot( ...
    x_exact, error, '.-r', ...
    LineWidth=1.5 ...
);
hold on;
legend( ...
    "Error of Cubic Spline, n = " + n ...
    );
title("Degree 3 Spline Error, n = " + n);
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('|Exact - Approximate|');
grid on;


% TODO:
% 1. plot all 3 against each other. plot errors as well for visuals.
% 2. plot on [-5, 5] and see what happens with n = 10
% 3. try increasing n to see how that effects [-5, 5] results.

% ================================================
%  PLOT ALL 3 AGAINST EACH OTHER
% ================================================

% plot the cubic spline and exact
figure('Name', "P" + n + ", S" + (n + 1) + ", Exact tanh(x)");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_cubic_interp, y_cubic_interp, '--y', ...
    x_P10_Interp, y_P10_Interp, '--r', ...
    'LineWidth', 1.5 ...
    )
legend("Exact tanh(x) Values", "S" + (n + 1), "P" + n);
title("P" + n + ", S" + (n + 1) + " VS Exact tanh(x)");
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Function Output');
% ylim([0, 1]); % limit specified as needed
grid on;

% error plot
error_spline = abs(y_exact - y_cubic_interp);
error_poly = abs(y_exact - y_P10_Interp);

figure('Name', 'Absolute Error of Cubic Spline Approximation'); %plotting the error
plot( ...
    x_exact, error_spline, '.-y', ...
    x_exact, error_poly, '.-r', ...
    LineWidth=1.5 ...
);
hold on;
legend( ...
    "Error of Cubic Spline, n = " + n, ...
    "Error of Interp Poly, n = " + n ...
    );
title("Degree 3 Spline and Polynomial Error, n = " + n);
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('|Exact - Approximate|');
grid on;

% ================================================
%  INCREASE INTERVAL TO [-5, 5], n = 10
% ================================================

% ================================================
%  INCREASE n ON [-5, 5]
% ================================================