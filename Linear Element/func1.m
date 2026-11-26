function f = func1(xi,x1,x2)

% Intialization
f = zeros(2,1);

% Shape functions for Linear ele
N1 = (1-xi)/2;
N2 = (1+xi)/2;

% Expressing x as linear combination of shape func
x = N1*x1 + N2*x2;

f(1) = N1 * x^2;
f(2) = N2 * x^2;

end
