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

% plot the P10
figure('Name', "P" + n + ", Exact tanh(x)");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_P10_Interp, y_P10_Interp, '--r', ...
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

% USING BURDEN TEXTBOOK CODE
% I believe this is yielding a + bx + cx2 + dx3
% [a, b, c, d] = spline_deg_3(x_cubic_spline, y_cubic_spline);
% 
% x_cubic_interp = [start_pt:h:end_pt];
% % basically we need to go through each of these points
% % figure out which interval theyre in
% % find the correct interval x is within
% for j = 1:length(x_cubic_interp);
%     x = x_cubic_interp(j);
%     for i = n-1:-1:1
%         if (x - x_cubic_spline(i)) >= 0; 
%             int = i;
%             break;
%         end
%     end
%     % and grab the correct coefficients and calculate
%     y_cubic_interp(j) = a(int) + (b(int) .* (x - x_cubic_spline(int))) + (c(int) .* ((x - x_cubic_spline(int)) .^ 2)) + (d(int) .* ((x - x_cubic_spline(int)) .^ 3));
% end

% USING SUPPLIED CODE
x_cubic_interp = [start_pt:h:end_pt];
% gather needed coefficients
[x_cubic_spline, y, z] = Spline3_Coeff(x_cubic_spline, y_cubic_spline);
% evaluation
for i = 1:length(x_cubic_interp)
    y_cubic_interp(i) = Spline3_Eval(x_cubic_spline, y, z, x_cubic_interp(i));
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

figure('Name', 'Absolute Error of Cubic Spline and Polynomial'); %plotting the error
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

% changed endpoints
start_pt = -5; end_pt = 5;

% exact values
x_exact = [start_pt:h:end_pt];
y_exact = tanh(x_exact);

% polynomial interpolation
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_P10 = [start_pt:h_equispaced:end_pt];
y_P10 = tanh(x_P10); % evaluate data points

a_coeff = Coef(n, x_P10, y_P10); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_P10_Interp = [start_pt:h:end_pt];
for i = 1:length(x_P10_Interp);
    y_P10_Interp(i) = Eval(n, x_P10, a_coeff, x_P10_Interp(i));
end;

% cubic spline interpolation
x_cubic_spline = [start_pt:h_equispaced:end_pt];
y_cubic_spline = tanh(x_cubic_spline); % evaluate data points

% USING BURDEN TEXTBOOK CODE
% % I believe this is yielding a + bx + cx2 + dx3
% [a, b, c, d] = spline_deg_3(x_cubic_spline, y_cubic_spline);
% 
% x_cubic_interp = [start_pt:h:end_pt];
% % basically we need to go through each of these points
% % figure out which interval theyre in
% % find the correct interval x is within
% for j = 1:length(x_cubic_interp);
%     x = x_cubic_interp(j);
%     for i = n-1:-1:1
%         if (x - x_cubic_spline(i)) >= 0; 
%             int = i;
%             break;
%         end
%     end
%     % and grab the correct coefficients and calculate
%     y_cubic_interp(j) = a(int) + (b(int) .* (x - x_cubic_spline(int))) + (c(int) .* ((x - x_cubic_spline(int)) .^ 2)) + (d(int) .* ((x - x_cubic_spline(int)) .^ 3));
% end

% USING SUPPLIED CODE
x_cubic_interp = [start_pt:h:end_pt];
% gather needed coefficients
[x_cubic_spline, y, z] = Spline3_Coeff(x_cubic_spline, y_cubic_spline);
% evaluation
for i = 1:length(x_cubic_interp)
    y_cubic_interp(i) = Spline3_Eval(x_cubic_spline, y, z, x_cubic_interp(i));
end

% plot the cubic spline and exact
figure('Name', "P" + n + ", S" + (n + 1) + ", Exact tanh(x), Changed Interval");
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

figure('Name', 'Absolute Error of Cubic Spline and Polynomial, Changed Interval'); %plotting the error
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
%  INCREASE n ON [-5, 5]
% ================================================

clearvars y_cubic_interp x_cubic_interp a b c d a_coeff x_P10_Interp y_P10_Interp x_cubic_spline y_cubic_spline

n = 30; % changed n to see effects on [-5, 5]

% polynomial interpolation
h_equispaced = (end_pt - start_pt) / n; % get equispace
x_Pn = [start_pt:h_equispaced:end_pt];
y_Pn = tanh(x_Pn); % evaluate data points

a_coeff = Coef(n, x_Pn, y_Pn); % get coefficients

% evaluate the interpolating polynomial at a finer mesh
x_Pn_Interp = [start_pt:h:end_pt];
for i = 1:length(x_Pn_Interp);
    y_Pn_Interp(i) = Eval(n, x_Pn, a_coeff, x_Pn_Interp(i));
end;

% cubic spline interpolation
x_cubic_spline = [start_pt:h_equispaced:end_pt];
y_cubic_spline = tanh(x_cubic_spline); % evaluate data points

% USING BURDEN TEXTBOOK CODE
% I believe this is yielding a + bx + cx2 + dx3
% [a, b, c, d] = spline_deg_3(x_cubic_spline, y_cubic_spline);
% 
% x_cubic_interp = [start_pt:h:end_pt];
% % basically we need to go through each of these points
% % figure out which interval theyre in
% % find the correct interval x is within
% for j = 1:length(x_cubic_interp);
%     x = x_cubic_interp(j);
%     for i = n-1:-1:1
%         if (x - x_cubic_spline(i)) >= 0; 
%             int = i;
%             break;
%         end
%     end
%     % and grab the correct coefficients and calculate
%     y_cubic_interp(j) = a(int) + (b(int) .* (x - x_cubic_spline(int))) + (c(int) .* ((x - x_cubic_spline(int)) .^ 2)) + (d(int) .* ((x - x_cubic_spline(int)) .^ 3));
% end

% USING SUPPLIED CODE
x_cubic_interp = [start_pt:h:end_pt];
% gather needed coefficients
[x_cubic_spline, y, z] = Spline3_Coeff(x_cubic_spline, y_cubic_spline);
% evaluation
for i = 1:length(x_cubic_interp)
    y_cubic_interp(i) = Spline3_Eval(x_cubic_spline, y, z, x_cubic_interp(i));
end

% plot the cubic spline and exact
figure('Name', "P" + n + ", S" + (n + 1) + ", Exact tanh(x), Changed n");
plot( ...
    x_exact, y_exact, '--c' , ...
    x_cubic_interp, y_cubic_interp, '--y', ...
    x_Pn_Interp, y_Pn_Interp, '--r', ...
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
error_poly = abs(y_exact - y_Pn_Interp);

figure('Name', 'Absolute Error of Cubic Spline and Polynomial, Changed n'); %plotting the error
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
% this limit will get you zoomed into the worst of the cubic
% ylim([0, 0.002]); 
grid on;
