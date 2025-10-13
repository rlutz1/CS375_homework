% Roxanne Lutz
% MATH375
% 10/13/2025
% HW4

% function to produce chebyshev nodes for interpolation
% on a generic interval given a number of nodes.

function [x_G10] = chebyshev_nodes(num_nodes, start_pt, end_pt)

x_k = @(k) cos(((k + 0.5) .* pi) ./ num_nodes);
x_k_tilde = @(k) (0.5 .* (start_pt + end_pt)) + (0.5 .* (end_pt - start_pt) * x_k(k));

for k = 0:(num_nodes - 1);
    x_G10(k + 1) = x_k_tilde(k);
end;

end