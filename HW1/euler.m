% Euler's scheme for ODE approximations
%
% Euler's base scheme is as follows:
% x_n+1 = x_n + dt * f'(x_n), x(0) = x_0
%
% ts -> time iteration vector
% N_0 -> initial value
% dt -> the dt step to use in implementing euler scheme

function [result] = euler(iterations, x_0, dt, func)

    x_curr = x_0; % init x_curr
    result = zeros(iterations, 1); % init vector
    result(1) = x_0; % init value in answer vector
    
    for i = [2:iterations]; % skip init value iteration
        x_next = x_curr + dt * func(x_curr);
        result(i) = x_next; % save result
        x_curr = x_next; % init curr for next iteration
    end;

end