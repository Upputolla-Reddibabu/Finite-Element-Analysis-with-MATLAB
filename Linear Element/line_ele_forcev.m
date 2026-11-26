
L = 4;

% Gauss points and its weighs
xi1 = -0.774597 ; w1 = 5/9;
xi2 = 0.774597 ; w2 = 5/9;
xi3 = 0 ; w3 = 8/9;

% Domain discretization
x1 = 0;  x2 = L/2;

I1 = (func1(xi1,x1,x2)*w1 + func1(xi2,x1,x2)*w2 + func1(xi3,x1,x2)*w3)/4

x1 = L/2;  x2 = L;

I2 = (func1(xi1,x1,x2)*w1 + func1(xi2,x1,x2)*w2 + func1(xi3,x1,x2)*w3)/4

% --- 1. Assemble Global Nodal Force Vector ---
F = zeros(3,1);
F(1:2) = F(1:2) + I1;      % Add Element 1 contribution
F(2:3) = F(2:3) + I2;      % Add Element 2 contribution
F(3)   = F(3) + 1         % Add Neumann boundary flux (+1 at x = L)

