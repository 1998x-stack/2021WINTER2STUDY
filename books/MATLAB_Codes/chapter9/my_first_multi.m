function f = my_first_multi(x)
 
f(1) = x(1)^4 - 10*x(1)^2+x(1)*x(2) + x(2)^4 - (x(1)^2)*(x(2)^2);
f(2) = x(2)^4 - (x(1)^2)*(x(2)^2) + x(1)^4 + x(1)*x(2);