% Roxanne Lutz
% MATH375
% 10/31/2025
% HW5

% script run cleanup tasks
clc, clearvars, close all;

% -------------------------------------
% PRELIMINARY
%
% plot exact Runge for verification
% -------------------------------------

% preliminary: get f(x) plotted with a fine mesh
start_pt = -5; end_pt = 5;
h = 0.001; % 10,000 points plotted
x_exact_init = [start_pt:h:end_pt];
y_exact_init = runge_function(x_exact_init);

% plot the exact graph only, mainly for ensuring code is correct
figure('Name', 'Exact Runge');
plot( ...
    x_exact_init, y_exact_init, "--c", ...
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
% PART A
%
% plot splines with 21, 41, 81 knots
% in same figure
% -------------------------------------

% SPLINE WITH 21 KNOTS

% number of equally spaced nodes
n = 21;  %S21
h = (end_pt - start_pt) / (n - 1); % spacing
t_knots_21 = [start_pt:h:end_pt]; % knot vector
y_table_values_21 = runge_function(t_knots_21); % fill the table

x_finer_21 = [start_pt:(h / 5):end_pt]; %choose a finer grid to plot points in between knots
% call function, X=evaluation of an interval or point
S_21 = spline_deg_1(t_knots_21, y_table_values_21, x_finer_21);

% -------------------------------------

% SPLINE WITH 41 KNOTS

% number of equally spaced nodes
n = 41;  %S41
h = (end_pt - start_pt) / (n - 1); % spacing
t_knots_41 = [start_pt:h:end_pt]; % knot vector
y_table_values_41 = runge_function(t_knots_41); % fill the table

x_finer_41 = [start_pt:(h / 5):end_pt]; %choose a finer grid to plot points in between knots
% call function, X=evaluation of an interval or point
S_41 = spline_deg_1(t_knots_41, y_table_values_41, x_finer_41);

% -------------------------------------

% SPLINE WITH 81 KNOTS

% number of equally spaced nodes
n = 81;  %S81
h = (end_pt - start_pt) / (n - 1); % spacing
t_knots_81 = [start_pt:h:end_pt]; % knot vector
y_table_values_81 = runge_function(t_knots_81); % fill the table

x_finer_81 = [start_pt:(h / 5):end_pt]; %choose a finer grid to plot points in between knots
% call function, X=evaluation of an interval or point
S_81 = spline_deg_1(t_knots_81, y_table_values_81, x_finer_81);

% -------------------------------------

% plot the splines

figure('Name', 'S_21, S_41, S_81');
plot( ...
    ... x_exact_init, y_exact_init, '--c', ...
    x_finer_21, S_21, '--r' , ...
    x_finer_41, S_41, '--y' , ...
    x_finer_81, S_81, '--g',  ...
    ... commented for now, used to confirm intersections:
    ... t_knots_21, y_table_values_21, '*r', ... 
    ... t_knots_41, y_table_values_41, '+y', ...
    ... t_knots_81, y_table_values_81, 'og', ...
    LineWidth=1 ...
 )
hold on;

legend( ...
    ... 'Exact Runge', ...
    'S21', ...
    'S41', ...
    'S81', ...
    ... uncomment above knot plotting for this to be meaningful:
    ... "S21 Table Vals", "S41 Table Vals", "S81 Table Vals" ...
    LineWidth=1 ...
    )
title('Degree 1 Spline Approximation, n = 21, 41, 81');
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Approximate Runge Function');
grid on;

% -------------------------------------

% getting and plotting error for analysis

y_exact_21 = runge_function(x_finer_21);
error_21 = abs(y_exact_21 - S_21);

y_exact_41 = runge_function(x_finer_41);
error_41 = abs(y_exact_41 - S_41);

y_exact_81 = runge_function(x_finer_81);
error_81 = abs(y_exact_81 - S_81);

figure('Name', 'Absolute Error of Spline Approximations'); %plotting the error
plot( ...
    x_finer_21, error_21, '.-r', ...
    x_finer_41, error_41, '.-y', ...
    x_finer_81, error_81, '.-g' ...
    );
hold on;
legend( ...
    "Error of S21", ...
    "Error of S41", ...
    "Error of S81" ...
    );
title('Degree 1 Spline Error, n = 21, 41, 81');
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('|Exact - Approximate|');
grid on;

% -------------------------------------
% PART B
%
% construct G_20 with chebyshev
% construct spline S_21 with these knots
% plot!
% -------------------------------------

% 2 notes

% (1) take n to cheby breaking point (~60 nodes), notice that spline does not
% wildly oscillate

% (2) spline is least accurate around the middle, while increasing accuracy
% around the edges--this makes sense because the step h is smallest around
% edges in chebyshev nodes and largest in middle--this is a big reason it
% can somewhat fix runge phenom.

% todo: in write up, take pics of decreasing error of more n
% and finally--break the interpolation with n = 60 to show than spline does
% just fine where chebyshev fails.

% SETUP NODE/KNOT VALUES

n_interp = 20; % G20
% n_interp = 40; % for toying: G40
% n_interp = 60; % for toying: G60
% n_interp = 80; % for toying: G80

n_spline = n_interp + 1; % S(n + 1)

% -------------------------------------

% CONSTRUCT G20

h = 0.01; % arbitrarily chosen mesh
x_G20 = chebyshev_nodes(n_interp + 1, start_pt, end_pt);
y_G20 = runge_function(x_G20); % evaluate data points

a_coeff = Coef(n_interp, x_G20, y_G20); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_G20_Interp = [start_pt:h:end_pt];
for i = 1:length(x_G20_Interp);
    y_G20_Interp(i) = Eval(n_interp, x_G20, a_coeff, x_G20_Interp(i));
end;

% -------------------------------------

% SPLINE WITH 21 CHEBY KNOTS

h = (end_pt - start_pt) / (n_spline - 1); % spacing
t_knots_cheby = flip(x_G20, 2); % knot vector, chebyshev (func returns descending, reverse return)
y_table_values_cheby = runge_function(t_knots_cheby); % fill the table

x_finer_21 = [start_pt:(h / 5):end_pt]; %choose a finer grid to plot points in between knots
% call function, X=evaluation of an interval or point
S_21_cheby = spline_deg_1(t_knots_cheby, y_table_values_cheby, x_finer_21);

% -------------------------------------

% plot the spline and G20
figure('Name', "S_" + n_spline + ", G_" + n_interp);
plot( ...
    x_finer_21, S_21_cheby, '--g' , ...
    x_G20_Interp, y_G20_Interp, '--y', ...
    t_knots_cheby, y_table_values_cheby, '*r' ...
    )
legend("S" + n_spline, "G" + n_interp, "Spline Table Values");
title('Degree 1 Spline and Polynomial Chebyshev Approximation')
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('Approximate Runge Function');
ylim([0, 1]); % limit specified as needed
grid on;

% -------------------------------------

% error plotting

y_exact_cheby_interp = runge_function(x_G20_Interp);
error_cheby_interp = abs(y_exact_cheby_interp - y_G20_Interp);

y_exact_cheby_spline = runge_function(x_finer_21);
error_cheby_spline = abs(y_exact_cheby_spline - S_21_cheby);

figure('Name', 'Absolute Error of Spline/Interp Approximations'); %plotting the error
plot( ...
    x_finer_21, error_cheby_spline, '--y', ...
    x_G20_Interp, error_cheby_interp, '--r' ...
    );
hold on;
legend( ...
    "Error of S" + n_spline + " with Cheby", ...
    "Error of G" + n_interp  + " with Cheby"...
    );
title('Degree 1 Spline VS Poly Interpolation Error');
xlabel("Domain, [" + start_pt + ", " + end_pt + "]");
ylabel('|Exact - Approximate|');
% ylim([0, 0.02]); % limit specified as needed
grid on;
