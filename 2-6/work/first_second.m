%%
% limit
syms x a b
func=x*(1+a/x)^x*sin(b/x);
disp(func)
disp(latex(func))
L=limit(func,x,inf);
disp('limit of func');
disp(L)

%%
% limit
syms x;
func=(exp(x^3)-1)/(1-cos(sqrt(x-sin(x))));
disp(func)
disp(latex(func))
L=limit(func,x,0,'right');
disp('limit')
disp(L);
t=-0.2:0.001:0.2;
plot(t,(exp(t.^3)-1)./(1-cos(sqrt(t-sin(t)))),'-',[0],[12],'o');
%%
% 多变量极限

syms x y
func=exp(-1/(y^2+x^2))*sin(x)^2/x^2*(1+1/y^2)^(x+10*y^2);
disp(func)
disp(latex(func))
L=limit(limit(func,x,1/sqrt(y)),y,inf);
disp(L)

%%
% diff
syms x
f=sin(x)/(x^2+4*x+3);
df=diff(f);
d2f=diff(df);
d3f=diff(d2f);
d4f=diff(d3f);

disp('* func')
disp(f)
disp('$$')
disp(latex(f))
disp('$$')
disp('* df')
disp(df);
disp('$$')
diff(latex(df));
disp('$$')
disp('* d2f')
disp(d2f)
disp('$$')
disp(latex(d2f))
disp('$$')
disp('* d3f')
disp(d3f)
disp('$$')
disp(latex(d3f))
disp('$$')
disp('* d4f')
disp(d4f)
disp('$$')
disp(latex(d4f))
disp('$$')


%%
% 多元函数偏导数
syms x y
z=(x^2-2*x)*exp(-x^2-y^2-x*y);
zx=simplify(diff(z,x));
zy=simplify(diff(z,y));
disp(zx)
disp(zy)

%%
[x,y]=meshgrid(-3:0.2:3,-2:0.2:2);
z=(x.^2-2.*x).*exp(-x.^2-y.^2-x.*y);
surf(x,y,z);
axis([-3,3 -2 2 -0.7,1.5])

contour(x,y,z,30);
hold on
zx=exp(- x.^2 - x.*y - y.^2).*(2.*x + 2.*x.*y - x.^2.*y + 4.*x.^2 - 2.*x.^3 - 2);
zy=-x.*exp(- x.^2 - x.*y - y.^2).*(x + 2.*y).*(x - 2);
quiver(x,y,zx,zy);

%%
syms x y z
func=sin(x^2*y)*exp(-x^2*y-z^2);
d4f=diff(diff(diff(func,x,2),y),z);
d4f=simplify(d4f);
disp(d4f)
disp('$$')
disp(latex(d4f))
disp('$$')

%%
% Jacobi
syms r theta phi
x=r*sin(theta)*cos(phi);
y=r*sin(theta)*sin(phi);
z=r*cos(theta);
J=jacobian([x,y,z],[r,theta,phi]);
disp(J)
disp('x')
disp('$$')
disp(latex(x))
disp('$$')
disp('y')
disp('$$')
disp(latex(y))
disp('$$')
disp('z')
disp('$$')
disp(latex(z))
disp('$$')

for i=1:3
    for j=1:3
        disp('$$')
        disp(latex(J(i,j)))
        disp('$$')
    end
end

%%
%隐函数

syms x y
func=(x^2-2*x)*exp(-x^2-y^2-x*y);
dfdx=diff(func,x);
dfdy=diff(func,y);
dydx=dfdx/dfdy;
disp('* dy/dx')
disp(dydx)
disp('$$')
disp(latex(simplify(dydx)));
disp('$$')

%% 
%参数方程
syms t
y=sin(t)/(t+1)^3;
x=cos(t)/(t+1)^3;
dy4dx=diff(y,t,4)/diff(x,t,4);
disp('* dy4dx')
disp('$$')
disp(latex(simplify(dy4dx)));
disp('$$')

%%
% 积分问题
syms x 
y=sin(x)/(x^2+4*x+3);
disp('* y')
disp(y)
disp('$$')
disp(latex(y))
disp('$$')
dy=diff(y);
disp('* dy/dx')
disp(dy)
disp(latex(dy))
disp('* int(dy)')
disp(int(dy))
disp('$$')
disp(latex(int(dy)))
disp('$$')

%%
%定积分与无穷积分计算

syms x
I1=int(exp(-x^2/2),x,0,1.5);
disp(I1)
disp(vpa(I1,70))
I2=int(exp(-x^2),x,0,inf);
disp(I2)

%%
% 多重积分
syms x y z
func=-4*z*exp(-x^2*y-z^2)*(cos(x^2*y)-10*cos(x^2*y)*y*x^2+4*x^4*sin(x^2*y)*y*y+4*cos(x^2*y)*x^4*y-sin(x^2*y));
f1=int(func,z);
disp('* f1')
disp(simplify(f1))
disp('$$')
disp(latex(f1))
disp('$$')
f2=int(func,y);
disp('* f2')
disp(simplify(f2))
disp('$$')
disp(latex(f2))
disp('$$')
f3=int(func,x);
disp('* f3')
disp(simplify(f3))
disp('$$')
disp(latex(f3))
disp('$$')


%% 
%Taylor
syms x 
func=sin(x)/(x^2+4*x+3);
y1=taylor(func,x,9);
disp('* Taylor function')
disp(simplify(y1));
disp('$$')
disp(latex(y1))
disp('$$')


%%
% Taylor plot and compare
clc
clear
x0=-2*pi:0.01:2*pi;
y0=sin(x0);
syms x;
y=sin(x);
plot(x0,y0);
axis([-2*pi,2*pi,-1.5,1.5]);
hold on

p=taylor(y,x);
y1=subs(p,x,x0);
disp('* taylor ')
disp(p)
disp('$$')
disp(latex(p))
disp('$$')
plot(x0,y1)
%%
%多变量函数Taylor幂级数展开
syms x y
f=(x^2-2*x)*exp(-x^2-y^2-x*y);
% F=maple('mtaylor',f,'[x,y]',8);
F=taylor(f,x,8);
F=taylor(F,y,8);
disp('* 多变量函数Taylor幂级数展开')

disp(collect(F))
disp('$$')
disp(latex(collect(F)))
disp('$$')

%%
% Flouria
% syms x
% f=x*(x-pi)*(x-2*pi);
% [A,B,F]=

%%
% symsum
format long
disp('sum(2.^[1:63])')
disp(sum(2.^[1:63]))
format short
syms k
s1=symsum(2^k,0,200);
disp(s1);
s2=sum(sym(2).^[0:200]);
disp(s2)


%%
syms n
s=symsum(1/((3*n-2)*(3*n+1)),n,1,inf);
disp(s)

m=1:100000000;
s2=sum(1./((3*m-2).*(3*m+1)));
format long
disp(s2)









