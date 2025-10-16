% Roxanne Lutz
% MATH375
% 10/13/2025
% HW4

% script run cleanup tasks
clc, clearvars, close all;

% preliminary: get f(x) plotted with a fine mesh
start_pt = -5; end_pt = 5;
h = 0.001; % 10,000 points plotted
x_exact = [start_pt:h:end_pt];
y_exact = runge_function(x_exact);

% plot the exact graph only, mainly for ensuring code is correct
figure('Name', 'Exact Runge');
plot( ...
    x_exact, y_exact, "--c", ...
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

% -----------------------------------------------------
% PART A
% + construct and plot P10 on [-5, 5] using equispaced pts
% -----------------------------------------------------

n = 10; % P10, 11 equispaced nodes (n + 1 nodes)
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_P10 = [start_pt:h_equispaced:end_pt];
y_P10 = runge_function(x_P10); % evaluate data points

a_coeff = Coef(n, x_P10, y_P10); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_P10_Interp = [start_pt:h:end_pt];
for i = 1:length(x_P10_Interp);
    y_P10_Interp(i) = Eval(n, x_P10, a_coeff, x_P10_Interp(i));
end;

% plot interpolation against exact and data points
figure('Name', "Interpolation of P" + n);
plot( ...
    x_exact, y_exact, "--c", ...
    x_P10, y_P10, 'mo', ...
    x_P10_Interp, y_P10_Interp, "--y", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function', ...
    "Data Points", ...
    "Interpolation" ...
    );
title("Runge Exact VS P" + n + " Interpolation");
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Output of Runge Function and Interpolation');
grid on;

% quick error plot
figure('Name', "Error Plotting of P" + n);
plot( ...
    x_exact, abs(y_exact - y_P10_Interp), "-r", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Absolute Error' ...
    );
title("Absolute Error of Runge Function and P" + n);
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Absolute Error');
grid on;

% -----------------------------------------------------
% PART B
% + construct and plot G10 on [-5, 5] using Chebyshev nodes
% -----------------------------------------------------

n = 10;
x_G10 = chebyshev_nodes(n + 1, start_pt, end_pt);
y_G10 = runge_function(x_G10); % evaluate data points

a_coeff = Coef(n, x_G10, y_G10); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_G10_Interp = [start_pt:h:end_pt];
for i = 1:length(x_G10_Interp);
    y_G10_Interp(i) = Eval(n, x_G10, a_coeff, x_G10_Interp(i));
end;

figure('Name', 'Interpolation of G10');
plot( ...
    x_exact, y_exact, "--c", ...
    x_G10, y_G10, 'mo', ...
    x_G10_Interp, y_G10_Interp, "--g", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function', ...
    "Data Points", ...
    "Interpolation" ...
    );
title('Runge Exact VS G10 Interpolation');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Output of Runge Function and Interpolation');
grid on;

% quick error plot
figure('Name', 'Error Plotting of G10');
plot( ...
    x_exact, abs(y_exact - y_G10_Interp), "-r", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Absolute Error' ...
    );
title('Absolute Error of Runge Function and G10');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Absolute Error');
grid on;


% -----------------------------------------------------
% PART C
% + Plot all 3 (exact, P10, G10) together
% -----------------------------------------------------

figure('Name', 'Interpolation of Both P10 and G10');
plot( ...
    x_exact, y_exact, "--c", ...
    x_P10_Interp, y_P10_Interp, "--y", ...
    x_G10_Interp, y_G10_Interp, "--g", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function', ...
    "Interpolation with Equispaced Points (P10)", ...
    "Interpolation with Chebyshev Nodes (G10)" ...
    );
title('Runge Exact VS P10, G10 Interpolation');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Output of Runge Function and Interpolation');
grid on;

% quick error plot
figure('Name', 'Error Plotting of P10 and G10');
plot( ...
    x_exact, abs(y_exact - y_P10_Interp), "-r", ...
    x_exact, abs(y_exact - y_G10_Interp), "-y", ...
    LineWidth=1 ...
    );
hold on;

legend( ...
    'Absolute Error for P10', ...
    'Absolute Error for G10' ...
    );
title('Absolute Error of Runge Function for P10 and G10');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Absolute Error');
grid on;

% -----------------------------------------------------
% PART D
% + construct and plot G20, G40, G60 on [-5, 5] using equispaced
% + fix window to x = [-5, 5], y = [-0.5, 2]
% -----------------------------------------------------

% n = 20
n = 20;
x_G20 = chebyshev_nodes(n + 1, start_pt, end_pt);
y_G20 = runge_function(x_G20); % evaluate data points

a_coeff = Coef(n, x_G20, y_G20); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_G20_Interp = [start_pt:h:end_pt];
for i = 1:length(x_G20_Interp);
    y_G20_Interp(i) = Eval(n, x_G20, a_coeff, x_G20_Interp(i));
end;

% n = 40
n = 40;
x_G40 = chebyshev_nodes(n + 1, start_pt, end_pt);
y_G40 = runge_function(x_G40); % evaluate data points

a_coeff = Coef(n, x_G40, y_G40); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_G40_Interp = [start_pt:h:end_pt];
for i = 1:length(x_G40_Interp);
    y_G40_Interp(i) = Eval(n, x_G40, a_coeff, x_G40_Interp(i));
end;

% n = 60
n = 60;
x_G60 = chebyshev_nodes(n + 1, start_pt, end_pt);
y_G60 = runge_function(x_G60); % evaluate data points

a_coeff = Coef(n, x_G60, y_G60); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_G60_Interp = [start_pt:h:end_pt];
for i = 1:length(x_G60_Interp);
    y_G60_Interp(i) = Eval(n, x_G60, a_coeff, x_G60_Interp(i));
end;

% plot all together
figure('Name', 'Interpolation of G20, G40, G60');
plot( ...
    x_exact, y_exact, "-c", ...
    x_G20_Interp, y_G20_Interp, "--r", ...
    x_G40_Interp, y_G40_Interp, "--y", ...
    x_G60_Interp, y_G60_Interp, "-g", ...
    LineWidth=1.5 ...
    );
hold on;

legend( ...
    'Exact Values of Runge Function', ...
    "Interpolation with Chebyshev Nodes (G20)", ...
    "Interpolation with Chebyshev Nodes (G40)", ...
    "Interpolation with Chebyshev Nodes (G60)" ...
    );
title('Runge Exact VS G20, G40, G60 Interpolation');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
xlim([-5, 5]); % limit specified
ylabel('Output of Runge Function and Interpolation');
ylim([-0.5, 2]); % limit specified
grid on;

% quick error plot
figure('Name', 'Error Plotting of G20, G40, and G60');
plot( ...
    x_exact, abs(y_exact - y_G20_Interp), "-y", ...
    x_exact, abs(y_exact - y_G40_Interp), "-g", ...
    x_exact, abs(y_exact - y_G60_Interp), "-r", ...
    LineWidth=1 ...
    );
hold on;

legend( ...
    'Absolute Error for G20', ...
    'Absolute Error for G40', ...
    'Absolute Error for G60' ...
    );
title('Absolute Error of Runge Function for G20, G40, and G60');
xlabel("Domain, [" + start_pt + ", " + end_pt + "] with h = " + h);
ylabel('Absolute Error');
grid on;
