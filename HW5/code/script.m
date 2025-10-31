% Roxanne Lutz
% MATH375
% 10/31/2025
% HW5

% script run cleanup tasks
clc, clearvars, close all;

% preliminary: get f(x) plotted with a fine mesh
start_pt = -5; end_pt = 5;
h = 0.001; % 10,000 points plotted
x_exact = [start_pt:h:end_pt];
y_exact1 = runge_function(x_exact);

% plot the exact graph only, mainly for ensuring code is correct
figure('Name', 'Exact Runge');
plot( ...
    x_exact, y_exact1, "--c", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function' ...
    );
title('Exact Values ONLY of Runge Function');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Output of Runge Function');
grid on;

% -------------------------------------

% SPLINE WITH 21 KNOTS
% number of equally spaced nodes
n = 21;  %s_21
%spacing
h = (end_pt - start_pt) / (n - 1);
t_knots = [start_pt:h:end_pt]; % knot vector
y_table_values = runge_function(t_knots); % fill the table

x_finer1 = [start_pt:h/5:end_pt]; %choose a finer grid to plot points in between knots
%call function, X=evaluation of an interval or point
S_21 = spline_deg_1(t_knots, y_table_values, x_finer1);

% -------------------------------------

% SPLINE WITH 41 KNOTS
% number of equally spaced nodes
n = 41;  %s_41
%spacing
h = (end_pt - start_pt) / (n - 1);
t_knots = [start_pt:h:end_pt]; % knot vector
y_table_values = runge_function(t_knots); % fill the table

x_finer2 = [start_pt:h/5:end_pt]; %choose a finer grid to plot points in between knots
%call function, X=evaluation of an interval or point
S_41 = spline_deg_1(t_knots, y_table_values, x_finer2);

% -------------------------------------

% SPLINE WITH 81 KNOTS
% number of equally spaced nodes
n = 81;  %s_81
%spacing
h = (end_pt - start_pt) / (n - 1);
t_knots = [start_pt:h:end_pt]; % knot vector
y_table_values = runge_function(t_knots); % fill the table

x_finer3 = [start_pt:h/5:end_pt]; %choose a finer grid to plot points in between knots
%call function, X=evaluation of an interval or point
S_81 = spline_deg_1(t_knots, y_table_values, x_finer3);

% -------------------------------------




% plot the splines
figure('Name', 'S_21, S_41, S_81');
plot( ...
    x_finer1, S_21, '--' , ...
    x_finer2, S_41, '-' , ...
    x_finer3, S_81, 'o-'  ...
    ... % t_knots, y_table_values, 'rx' ...
    )
legend('S21', 'S41', 'S81')
title(['Degree 1 Spline Approximation, ', 'n = ', num2str(n)])



y_exact1 = runge_function(x_finer1);
error1 = abs(y_exact1 - S_21);

y_exact2 = runge_function(x_finer2);
error2 = abs(y_exact2 - S_41);

y_exact3 = runge_function(x_finer3);
error3 = abs(y_exact3 - S_81);

figure('Name', 'Absolute Error of Spline Approximations'); %plotting the error
plot( ...
    x_finer1, error1, '.-r', ...
    x_finer2, error2, '.-y', ...
    x_finer3, error3, '.-g' ...
    );
legend( ...
    "Error of S21", ...
    "Error of S41", ...
    "Error of S81" ...
    );
title(['Degree 1 Spline Error, ','n = 21, 41, 81'])