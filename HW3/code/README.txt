# MATH375 HW 3

## SCRIPT FILES

### script_01.m 

This is the main script file to run for Computer Problem 1. Running this has a default value of x_init = 2 (can be changed on line 11, along with tolerance and iteration cap).

This runs Newton's Method on function_01 function and will print out how many iterations the method needs to find the root approximation. It also prints the root approximation.

Then it plots the exact values and approximations on the [-1:0.001:2] domain to showcase how the approximations approach the root.

### script_02.m 

This is the main script file to run for Computer Problem 2. Running this has a default value of x_start = 1 and x_end = 2  (can be changed on lines 11 and 12, along with tolerance and iteration cap).

This runs Bisection Method on function_02 function and will print out how many iterations the method needs to find the root approximation. It also prints the root approximation.

Then it plots on figure 1 the exact values and approximation midpoints on the [-3:0.001:3] domain to showcase how the approximations approach the root.

Lines 67 - end proved an extra comparison by running function_02 with Newton's Method to see how the methods compare with this function, likewise plotting exact and approximations on [-3:0.001:3] on figure 2.

### script_03.m 

This is the main script file to run for Computer Problem 3. Running this has a default value of x_init = 1 (can be changed on lines 11, along with tolerance and iteration cap).

This runs Newton's Method on function_03 function and will print out how many iterations the method needs to find the root approximation. It also prints the root approximation.

Then it plots on figure 1 the exact values and approximations on the [min(x_approx):0.001:max(x_approx)] domain and [min(y_approx):max(y_approx)] range to showcase how the approximations approach the root at a larger scale. This is done to highlight the volatility of the function and the approximations. In figure 2, we plot the exact and approximations constrained to domain [0:0.001:2] and range [-10, 10]. This is contrived in order to zoom into the actual root found while cutting out many extraneous approximations. This is done to also show how close we are to the root, yet how long Newton's Method took to find it.

Lines 109 - end proved an extra comparison by running function_03 with Bisection Method to see how the methods compare with this function, likewise plotting the approximations on the larger and smaller scales mentioned above in figures 3 and 4 respectively.

## FUNCTION FILES

### function_01.m 

This contains the coded version of f(x) = -x^3 + x^2 + x + 1 for Computer Problem 1 and its hand-derived derivative (see report), returning both f(x) and f'(x).

### function_02.m 

This contains the coded version of f(x) = 2x * (1 + x^2)^(-1) - arctan(x) for Computer Problem 2 and its hand-derived derivative (see report), returning both f(x) and f'(x).

### function_03.m 

This contains the coded version of f(x) = x^3 - 2x((4 - tan(x)) / (sin(x) + 3x^2)) + ((4 - tan(x)) / (sin(x) + 3x^2))^7 + 4x^3((4 - tan(x)) / (sin(x) + 3x^2)) - 5 for Computer Problem 3 and its hand-derived derivative (see report), returning both f(x) and f'(x).

## HELPER FILES

### newtonsMethod.m 

Simple function file to methodize Newton's Method. This is the main implementation of this method, and it will run with a max cap of iterations, with an initial guess, tolerance, and function handle given. Function needs to return both y and dy for a given x.

### bisectionMethod.m 

Simple function file to methodize Bisection Method. This is the main implementation of this method, and it will run with a max cap of iterations, with an initial beginning and end to trap root, tolerance, and function handle given. Function needs to return at least y for a given x.