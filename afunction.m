function [final] = afunction(initial)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = initial
while x > 10;
    disp("function running")
    disp(x)
    x = x - 1;
end

final = x;

end