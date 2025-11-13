# MATH375 HW 6

## SCRIPT FILES

### script.m 

Main script file for Computer Problem 1. 

Some of the specific visuals to mention that it plots (although they are all labelled):

#### Figure 1 and 2

Plotting interpolating P10 polynomial on [-3, 3] and the absolute error from the exact.

#### Figure 3 and 4

Plotting interpolating S11 cubic spline on [-3, 3] and the absolute error from the exact.

#### Figure 5 and 6

Both P10 and S11 in same plot on [-3, 3] and the absolute error of each.

#### Figure 7 and 8

Both P10 and S11 on [-5, 5], along with error.

#### Figure 9 and 10

Both P10 and S11 on [-5, 5], with n = 20, along with error.

## FUNCTION FILES

### Spline3_Coeff.m and Spline3_Eval.m

Functions provided for use by Dr. Orizaga. Used for generating a cubic spline.

### Coef.m and Eval.m

Functions provided for use by Dr. Orizaga. Used for generating an interpolating polynomial.

### spline_deg_3.m

NOTE: included in the code file, but the code using this is commented out in favor of using the code distributed in class. This is still included in the submission for record purposes.

A file to methodize the generation/evaluation of a degree 3 spline interpolation. This is directly adapated from the Burden textbook pseudocode for a natural cubic spline generation, page 147.
