# MATH375 HW 1 

## Prob1.m

This script goes step by step through the problem, all within the one script file.

All plotting uses the same `x` vector with `h` domain spacing. Screenshots for Part C when changing the domain spacing were taken after changing the value of `h` in the script directly and can be replicated as such.

The parts and some additional data are split into different figures.

### Figure 1

Taylor approximation of n = 2 against exact.

### Figure 2

Taylor approximations of n = 2, 4 against exact.

### Figure 3

Taylor approximations of n = 2, 4, 6 against exact. Added to illustrate that with more terms, the Taylor approximation does indeed get more accurate.

### Figure 4

Absolute error for approximations n = 2, 4.

### Figure 5 

Absolute error for approximations n = 2, 4, 6. Added to illustrate that with more terms, the Taylor approximation does indeed get more accurate.

### Figure 6

All exact and n = 2, 4 approximations plotted, along with the approximations' absolute error.

## Prob2.m

This script requires 3 other function files: 
+ logModel -> contains the logistic model function/ODE
+ euler -> contains the implementation of euler's scheme
+ eulerImproved -> contains the implementation of euler's IMPROVED scheme

Otherwise, the script runs in order from Part's A - C.

A step size is intialized as `dt = 0.01` by default, but can be changed on run. All models are plotted on domain [0, 200] (t_f = 200) to show convergence.

The figure values are as follows:

### Figure 1

Figure to show all initial conditions using ode45 (or Runge-Kutta) for solving logistic model (N0 = 100, 750, 1300).

### Figure 2

Figure to show all initial conditions using Euler's scheme for solving logistic model (N0 = 100, 750, 1300).

### Figure 3

The figure to illustrate the difference between Euler and Euler improved for a single initial condition (N0 = 100 was chosen).

### Figure 4

An optional figure to showcase how ode45, Euler, and Euler improved compare against each other for N0 = 100.