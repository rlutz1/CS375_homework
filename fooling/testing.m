clc, clearvars % good practice, clear it out
close all % close all the plots on run

% if you want x to print on run:
% x = 10

x = 10; % x is the best var
% a comment here, just for fun

% linear algebra shit ;)
% vector, 1 row of vals, 10 cols across
y = 1:10
whos % 1 by 10 (row by col) vect

z = y' % TRANSPOSE y, 10 by 1 vect
whos

% give me default 100 evenly spaced terms from 20 to 50
% a = linspace(20, 50); 
% set the default to something else:
a = linspace(20, 50, 3);

% create a row of defined vals
% note that it's separated by a SPACE
% can use commas if you want tho
b = [1 2 3]
% a matrix, semicolon starts new row
B = [1 3; 2 4]

% matlab is ASSUMING linear algebra!!
% matrix multiplacation is LIN ALG matrix mult!

% element wise operations
% the DOT! .
% B^2 is really matrix B * B
% but if we want each element of B to be squared:
C = B.^2

clearvars

% --------------------------

% built in function: ones
% get a matrix of all ones, dimensions as args
A = ones(3)
% mtrx of zeros, 3x3
B = zeros(3)
% identity matrix, 3x3
C = eye(3) 
% 3 by 1 col
A = ones(3, 1)

clearvars

% --------------------------

% pattern match style thing
% numbers 1 -> 10, add by 2 until >= 10
a = 1:2:10

clearvars

% --------------------------

A  = [5, 3, 4.2; 9, 0, 3]
% grab the element  in 2nd row, 2nd col
A(2, 2) % one indexing :(

A(end) % last val in mtrx
%A(end - 10) % go to end and go back 10 steps
A(2, 1:end) % give me all vals in the second row

clearvars

% --------------------------

% y = -(x - 3)^2 + 10

% what is min val of function on  0 < x < 5
x = linspace(0, 5); % gimme 100 close numbers in range
y = (-(x - 3).^2) + 10

% plot(x, y, '*') % plot the points using * as the point markers

max(y) % not ~quite~ 10, but close

% what is min of function
min(y) 

% for what x does the max y-val hit
[maxVal, index] = max(y)
% therefore, the index returned in x is what gives us the x we need
x(index)

% what is y(20.7)
% they're called anon functions here:
y = @(x) (-(x - 3).^2) + 10 % now a "function handle", not a matrix anymore
y(20.7) % now we can give y any value to run

clearvars

% --------------------------

x = linspace(-10, 10); % gimme 100 close numbers in range
y1 = (-(x - 3).^2) + 10;
y2 = (-(x - 3).^2) + 15;
y3 = (-(x - 3).^2) + 20;

displayWindow = false

% figure(1) -> opens a blank figure screen
% plot then adds to this
if displayWindow
    figure(1)
    
    plot(x, y1, '--')
    hold on % need this to tell it its a different line
    plot(x, y2, '--')
    hold on
    plot(x, y3, '--')
    
    xlabel("my x's"), ylabel("my y's"), title('my nonsense') % must come after
    % legend() -> adding legend to your plot
end 
clearvars

% logical operators available, x > 2, etc
A = ones(1, 10)
A > 0 % we get a matrix of 1's because all true
A = [1, 2; 3, 4]
A >= 3 % get [0 0; 1 1], true for all of bottom row!, 0 for false
% negation is ~
% ~A % ~~A

clearvars

A = randi(5, 3, 10) % random num generation, 3 x 10
theSum = sum(A)
firstIndex = theSum(1)

% if statement control
if firstIndex > 10
    disp("hit")
end

% for loops
for i = 1:10;
    i
end

z = 10;
% while loops
while z > 0;
 disp("poopoo peepee")
 z = z - 1;
end

% custom function
afunction(20)
