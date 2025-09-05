% log model SOLVED
% this is the solved non-differential equation form:
%
% N(t) = K*N0*e^(rt) / (K-N0) + N0*e^(rt)
%
% (thank you https://math.libretexts.org/Bookshelves/Calculus/Calculus_(OpenStax)/08%3A_Introduction_to_Differential_Equations/8.04%3A_The_Logistic_Equation)

function [result] = logModelExact(N, t, r, K)
    % let C = N0*e^(rt)
    e = exp(1);
    C = N * (e ^ (r * t));
    result = (K * C) / ((K - N) + C);
end

