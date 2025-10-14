% Roxanne Lutz
% MATH375
% 10/13/2025
% HW4

% function to produce chebyshev nodes for interpolation
% on a generic interval given a number of nodes.

function [x_GN] = chebyshev_nodes(num_nodes, start_pt, end_pt)

x_k = @(k) cos((((2 .* k) + 1) .* pi) ./ (2 .* num_nodes));
x_k_tilde = @(k) ((start_pt + end_pt) ./ 2) + (((end_pt - start_pt) ./ 2) * x_k(k));

for k = 0:(num_nodes - 1);
    x_GN(k + 1) = x_k_tilde(k);
end;

end