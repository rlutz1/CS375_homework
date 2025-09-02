clc, clearvars

% practice: polynomial multiplacation
% 
% idea is to reduce the number of multiplacations to O(n), with 
% additions staying O(n)
%
% we are going to define the multiplacation recursively.
% given y = a_0 + x(a_1 + x(a_2 + x(...a_n-1 + a_nx))),
% 
% p = a_n
% for (i = n-1 -> 0, i--) 
%   p = a_i + px
%
% given any x, this should yield the same result as traditional
% multiplacation.

% let P1 =  1 +  2x + 3x^2   +  4x^3
% let P2 =  4 +  5x +        + 10x^3
% let P2 = -5 + 22x + 4.2x^2 -  2x^3

% traditional multiplacation

test1 = 2;

% P1
pTrad = @(x) 1 + (2 * x) + (3 * (x .^ 2)) + (4 * (x .^ 3));
ansTrad = pTrad(test1);

% improved multiplacation

% P1
coefficients1 = [1, 2, 3, 4];

pImproved = coefficients1(end);

for i = [(length(coefficients1) - 1):-1:1];
   pImproved = coefficients1(i) + (pImproved * test1);
end

ansImproved = pImproved;

% display the results, baby girl

if ansTrad ~= ansImproved
    disp("ansTrad != ansImproved! Check your code!")
end
disp( ...
    "ansTrad: " + ansTrad + ...
    ", and ansImproved: " + ansImproved + ...
    ", with x = " + test1...
    )


% NAUGHTY: copy pasting this code to run with other polynomials.
% this should be methodized to avoid copy paste, but leaving now for
% example, will practice cleaning later.

% traditional multiplacation

% P2
pTrad = @(x) 4 + (5 * x) + (0 * (x .^ 2)) + (10 * (x .^ 3));
ansTrad = pTrad(test1);

% improved multiplacation

% P2
coefficients1 = [4, 5, 0, 10];

pImproved = coefficients1(end);

for i = [(length(coefficients1) - 1):-1:1];
   pImproved = coefficients1(i) + (pImproved * test1);
end

ansImproved = pImproved;

% display the results, baby girl

if ansTrad ~= ansImproved
    disp("ansTrad != ansImproved! Check your code!")
end
disp( ...
    "ansTrad: " + ansTrad + ...
    ", and ansImproved: " + ansImproved + ...
    ", with x = " + test1...
    )


% traditional multiplacation

% P3
pTrad = @(x) -5 + (22 * x) + (4.2 * (x .^ 2)) - (2 * (x .^ 3));
ansTrad = pTrad(test1);

% improved multiplacation

% P3
coefficients1 = [-5, 22, 4.2, -2];

pImproved = coefficients1(end);

for i = [(length(coefficients1) - 1):-1:1];
   pImproved = coefficients1(i) + (pImproved * test1);
end

ansImproved = pImproved;

% display the results, baby girl

if ansTrad ~= ansImproved
    disp("ansTrad != ansImproved! Check your code!")
end
disp( ...
    "ansTrad: " + ansTrad + ...
    ", and ansImproved: " + ansImproved + ...
    ", with x = " + test1...
    )

% END SCRIPT







