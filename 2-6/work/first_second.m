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

%%
%二元函数梯度计算

[x,y]=meshgrid(-3:0.1:3,-2:0.1:2);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
[fx,fy]=gradient(z);
fx=fx/0.2;
fy=fy/0.2;
contour(x,y,z,30);
hold on
quiver(x,y,fx,fy)

%%
%积分问题
x1=[0:0.01:pi]';
y=[sin(x1) cos(x1) sin(x1/2)];
x=[x1 x1 x1];
S=sum((2*y(1:end-1,:)+diff(y)).*diff(x))/2;
disp(S)
disp(trapz(x1,y))
%%
x=[0:0.01:3*pi/2,3*pi/2];
y=cos(15*x);
plot(x,y);

syms x
A=int(cos(15*x),0,3*pi/2);
disp('theoritically')
disp(A)
h0=[0.1,0.01,0.001,0.0001,0.00001,0.000001];
v=[];
for h=h0
    x=[0:h:3*pi/2,3*pi/2];
    y=cos(15*x);
    I=trapz(x,y);
    v=[v;h,I,1/15-I];
end
format long
disp(v)

%%
% inline quad

f=inline('2/sqrt(pi)*exp(-x.^2)','x');
y=quadl(f,0,1.5);
disp(y)
%%
%双重积分
% fh=inline('sqrt(1-x.^2/2)','x');%内积分上限
% fl=inline('-sqrt(1-x.^2/2)','x');%内积分下限
% 
% f=inline('exp(-x.^2/3).*sin(x.^2+y)','y','x');% 交换顺序的被积函数
% 
% 
% y=quad2dggen(f,fl,fh,-1/2,1,eps);
% disp(y)

%%
%第一曲面积分
syms u v
syms a positive

x=u*cos(v);
y=u*sin(v);
z=v;
f=x^2*y+z*y^2;
E=simplify(diff(x,u)^2+diff(y,u)^2+diff(z,u)^2);
F=diff(x,u)*diff(x,v)+diff(y,u)*diff(y,v)+diff(z,u)*diff(z,v);
G=simplify(diff(x,v)^2+diff(y,v)^2+diff(z,v)^2);
I=int(int(f*sqrt(E*G-F^2),u,0,a),v,0,2*pi);
disp(I);
disp(latex(I))

%%
%第二曲面积分
syms u v
syms a b c positive
x=a*sin(u)*cos(v);
y=b*sin(u)*sin(v);
z=c*cos(u);
A=diff(y,u)*diff(z,v)-diff(z,u)*diff(y,v);
I=int(int(x^3*A,u,0,pi/2),v,0,2*pi);
disp(I)
disp(latex(I))

%%
% example

%% 
% 2
syms x y
f1=(x^2*y+x*y^3)/(x+y)^3;
l1=limit(limit(f1,x,-1),y,2);
disp('* f1')
disp('$$')
disp(latex(f1))
disp('$$')
disp('* limit of f1')
disp('$$')
disp(latex(l1))
disp('$$')

f2=x*y/(sqrt(x*y+1)-1);
l2=limit(limit(f2,x,0),y,0);
disp('* f2')
disp('$$')
disp(latex(f2))
disp('$$')
disp('* limit of f2')
disp('$$')
disp(latex(l2))
disp('$$')


f3=(1-cos(x^2+y^2))/(x^2+y^2)/exp(x^2+y^2);
l3=limit(limit(f3,x,0),y,0);
disp('* f3')
disp('$$')
disp(latex(f3))
disp('$$')
disp('* limit of f3')
disp('$$')
disp(latex(l3))
disp('$$')

%%
%3
clc
syms x
y1=sqrt(x*sin(x)*sqrt(1-exp(x)));
dy1=diff(y1,x);
disp('* y1')
disp('$$')
disp(latex(y1))
disp('$$')
disp('* gradient of y1')
disp('$$')
disp(latex(dy1))
disp('$$')


y2=sqrt((x-1)*(x-2)/(x-3)/(x-4));
dy2=diff(y2,x);
disp('* y2')
disp('$$')
disp(latex(y2))
disp('$$')
disp('* gradient of y2')
disp('$$')
disp(latex(dy2))
disp('$$')


syms x y
f=atan(y/x)-log(x^2+y^2);
dfdx=diff(f,x);
dfdy=diff(f,y);
dydx=dfdx/dfdy;
disp('* f')
disp('$$')
disp(latex(f))
disp('$$')
disp('* gradient of f')
disp('$$')
disp(latex(dydx))
disp('$$')

syms a x n

y=-1/n/a*log((x^n+a)/x^n);
dy=diff(y,x);
disp('* y')
disp('$$')
disp(latex(y))
disp('$$')
disp('* gradient of y')
disp('$$')
disp(latex(dy))
disp('$$')

%%
%17
clc
syms n N
f1=symsum(1/(5*n-4)/(5*n+1),1,N);
disp('* component1')
disp('$$')
disp(latex(1/(5*n-4)/(5*n+1)))
disp('$$')
disp('* Sum1')
disp('$$')
disp(latex(f1))
disp('$$')
f2=symsum(1/2^n+1/3^n,1,N);
disp('* component2')
disp('$$')
disp(latex(1/2^n+1/3^n))
disp('$$')
disp('* Sum2')
disp('$$')
disp(latex(f2))
disp('$$')





