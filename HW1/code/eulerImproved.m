% Euler's IMPROVED scheme for ODE approximations
%
% Euler's improved scheme is as follows:
% x~ = x_n + dt * f'(x_n), x(0) = x_0
% x_n+1 = x_n + (dt / 2) * (f'(x_n) + f'(x~))
%
% iterations -> how many times to run the scheme
% x_0 -> initial value
% dt -> the dt step to use in implementing euler scheme
% func -> ode function we are approximating

function [result] = eulerImproved(iterations, x_0, dt, func)
     
    x_curr = x_0; % init x_curr
    result = zeros(iterations, 1); % init vector
    result(1) = x_0; % init value in answer vector
    
    for i = [2:iterations]; % skip init value iteration
        x_tilde = x_curr + dt * func(x_curr); % trial step
        x_next = x_curr + (dt / 2) * (func(x_curr) + func(x_tilde)); % real step
        result(i) = x_next; % save result
        x_curr = x_next; % init curr for next iteration
    end;

end
