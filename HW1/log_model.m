% logistic model for growth implementation
%
% given information/equation:
% N' = rN(1-(N/K)), N(0) = N_0

function [result] = log_model(N)
    % given values of r and K
    r = 0.05;
    K = 1000;
    % logistic model
    result = r * N * (1 - N/K)
end
