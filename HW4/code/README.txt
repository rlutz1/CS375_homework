# MATH375 HW 4

## SCRIPT FILES

### script_01.m 

Main script file for Computer Problem 1. All figures generated from here are on the domain [-5, 5], and with a mesh produced with h = 0.001 (thus, 10000 points evaluated). This script file runs all 4 parts of the problem.

Some of the specific visuals to mention that it plots (although they are all labelled):

#### Figure 1

The exact Runge function plotted by itself. Purely for verification of the correct coding of the function.

#### Figure 2 & 3

2 plots the P10 polynomial and data points over the exact Runge function. 3 plots the absolute error between the exact and P10 interplolation at a fine mesh.

#### Figure 4 & 5

2 plots the G10 polynomial and data points over the exact Runge function. 3 plots the absolute error between the exact and G10 interplolation at a fine mesh.

#### Figure 6 & 7

6 contains all three functions so far: exact, P10, and G10. 7 contains the absolute error of P10 and G10 in the same plot versus the exact values.

#### Figure 8 & 9 

8 contains the plotting of all 3 G20, G40, and G60 interpolations overlaid on the exact Runge. 9 contains the absolute error plotting of all three before mentioned interpolations.

## FUNCTION FILES

### runge_function.m

A file to help methodize the Runge function coding. Simply, the coded exact Runge function, returning output for a given x.

### chebyshev_nodes.m

A file to help provide a reusabality function for generating a specified number of Chebyshev nodes for a generic interval [a, b].

### Coef.m and Eval.m

Functions provide for use by Dr. Orizaga.