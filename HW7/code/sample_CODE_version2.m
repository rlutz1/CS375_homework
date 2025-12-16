% Sample Code for Finite Difference method
clear all All
a=1;
b=2;
%number of subintervals
n=10;
h=(b-a)/n;
%unknowns n-2
LBC=1;
RBC=6;

A=zeros(n-1,n-1);
P=3;Q=2;
%main diagonal
for i=1:n-1
    A(i,i)=(-2+h^2*Q);
end

for i=1:n-2
    %lower diag
    A(i+1,i)=(1-h/2*P);
    %upper diagonal
    A(i,i+1)=(1+h/2*P);
end


%right hand side
x=[a+h:h:b-h];
f=h^2*4*x.^2;

%right hand side contributions with the bcs
f(1)=f(1)-(1-h/2*P)*(LBC);   f(end)=f(end)-(1+h/2*P)*(RBC);

%simply solve Au=f, we take f' since it is to be a column vector
u=A\f';

%pad the solution
x=[a x b];
u=[LBC u' RBC];

%building uexact
    C1 = -(exp(3)*(2 + 3*exp(1))) / (exp(1) - 1);
    C2 = (2*exp(1) + 3*exp(3)) / (exp(1) - 1);
    % Define uexact
    uexact = 7 - 6*x + 2*x.^2 + C1*exp(-2*x) + C2*exp(-x);


figure(1)
plot(x,u,'o-',x,uexact,'rx')
title("uapprox VS uexact, n = " + n)
legend('uapprox','exact')
xlabel('x')
ylabel('u')
ax = gca; 
ax.FontSize = 18;
%error plots 
figure(2)
plot(x,abs(u-uexact),'b-')
title(['Error Plot, n = ' num2str(n)])
xlabel('x')
ax = gca; 
ax.FontSize = 18;


% repeat of above but with N = 40 for second part

% Sample Code for Finite Difference method
a=1;
b=2;
%number of subintervals
n=40;
h=(b-a)/n;
%unknowns n-2
LBC=1;
RBC=6;

A=zeros(n-1,n-1);
P=3;Q=2;
%main diagonal
for i=1:n-1
    A(i,i)=(-2+h^2*Q);
end

for i=1:n-2
    %lower diag
    A(i+1,i)=(1-h/2*P);
    %upper diagonal
    A(i,i+1)=(1+h/2*P);
end


%right hand side
x=[a+h:h:b-h];
f=h^2*4*x.^2;

%right hand side contributions with the bcs
f(1)=f(1)-(1-h/2*P)*(LBC);   f(end)=f(end)-(1+h/2*P)*(RBC);

%simply solve Au=f, we take f' since it is to be a column vector
u=A\f';

%pad the solution
x=[a x b];
u=[LBC u' RBC];

%building uexact
    C1 = -(exp(3)*(2 + 3*exp(1))) / (exp(1) - 1);
    C2 = (2*exp(1) + 3*exp(3)) / (exp(1) - 1);
    % Define uexact
    uexact = 7 - 6*x + 2*x.^2 + C1*exp(-2*x) + C2*exp(-x);


figure(3)
plot(x,u,'o-',x,uexact,'rx')
title("uapprox VS uexact, n = " + n)
legend('uapprox','exact')
xlabel('x')
ylabel('u')
ax = gca; 
ax.FontSize = 18;
%error plots 
figure(4)
plot(x,abs(u-uexact),'b-')
title(['Error Plot, n = ' num2str(n)])
xlabel('x')
ax = gca; 
ax.FontSize = 18;