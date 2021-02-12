function [y,dy]=c6func(x)
    syms x1 x2
    f=100*(x2-x1^2)^2+(1-x1)^2;
    J=jacobian(f,[x1,x2]);
    y=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
    dy=[-400*(x(2)-x(1)^2)*x(1)-2+2*x(1);200*x(2)-200*x(1)^2];
%     y=subs(f,x1,x(1));
%     y=subs(y,x2,x(2));
%     dy=subs(J',x1,x(1));
%     dy=subs(dy,x2,x(2));
end