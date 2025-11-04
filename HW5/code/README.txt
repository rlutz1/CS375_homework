# MATH375 HW 5

## SCRIPT FILES

### script.m 

Main script file for Computer Problem 1. All figures generated from here are on the domain [-5, 5]. This script file runs all 2 parts of the problem. All extraneous explorations have been commented out but can be uncommented in order to see plottings from report.

Some of the specific visuals to mention that it plots (although they are all labelled):

#### Figure 1

The exact Runge function plotted by itself. Purely for verification of the correct coding of the function.

#### Figure 2 & 3

2 plots the S21, S41, S81 splines together. 3 plots the absolute error between the exact and spline interpolations.

#### Figure 4 & 5

2 plots the G20 polynomial and S21 spline using Cheby-Shev nodes/knots, including data points from the "spline table" (really just Runge function evaluated at Cheby-Shev nodes). 5 plots the absolute error between the exact and two interpolations.

## FUNCTION FILES

### spline_deg_1.m

A file to methodize the generation/evaluation of a degree 1 spline interpolation. This was initally distributed by Dr. Orizaga, but slightly cleaned by myself for use.

### runge_function.m

A file to help methodize the Runge function coding. Simply, the coded exact Runge function, returning output for a given x.

### chebyshev_nodes.m

A file to help provide a reusability function for generating a specified number of Chebyshev nodes for a generic interval [a, b].

### Coef.m and Eval.m

Functions provide for use by Dr. Orizaga.