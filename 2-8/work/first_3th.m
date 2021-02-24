%%
%laplace
syms t;
f=t^2*exp(-2*t)*sin(t*+pi);
disp(latex(f))
disp(latex(laplace(f)))

%%

syms t s
f=t^2*exp(-2*t)*sin(t+pi);
F=simplify(laplace(diff(f,t,5)));
disp(latex(f))
disp(latex(F))
F0=laplace(f);
disp(latex(F0))
disp(simplify(F-s^5*F0))
%%
syms t
% f=t^2*exp(-2*t)*sin(t+pi);
f=sym('f(t)');
df2=diff(f,t,2);
disp(laplace(df2))
%%
%  线性性质
syms t a b
f=sym('f(t)');
g=sym('g(t)');
disp(laplace(a*f+b*g)-(a*laplace(f)+b*laplace(g)))

%%
% 时域平移性质
syms t a s
f=sym('f(t-a)');
disp(laplace(f))
f1=exp(-a*s)*laplace(sym('f(a)'));
disp(f1)

disp(f1-laplace(f))
%%
%
syms t s
f=sym('f(t)');
disp(limit(f,t,0)-limit(s*laplace(f),s,inf))
%%
%fourier
syms t w
syms a positive
f=1/(t^2+a^2);
F=fourier(f,t,w);
disp(F);
disp(latex(f))
disp(latex(F))

%%
%
syms t w
syms a positive
f=pi*exp(-a*abs(w))/a;
iF=ifourier(f);
disp('$$')
disp(latex(f))
disp('$$')
disp('$$')

disp(latex(iF));
disp('$$')
%%
%
syms w t;
syms a positive
f=exp(-a*abs(t))/sqrt(abs(t));
F=fourier(f,t,w);

disp('$$')
disp(latex(f))
disp('$$')
disp('$$')

disp(latex(F));
disp('$$')

%%
clear
clc
syms t w
syms a positive
for i=1:8
    f=t^i*exp(-a*t);
    F=int(f*cos(w*t),t,0,inf);
    disp('$$')
    disp(latex(f))
    disp('$$')
    disp('$$')
    disp(latex(simplify(F)));
    disp('$$')
end

%%
%

% syms t w
% syms a positive
% f=t^6*exp(-a*t);
% F=maple('fouriercos',f,t,w);
% disp('$$')
% disp(latex(f))
% disp('$$')
% disp('$$')
% disp(latex(F))
% disp('$$')

%%
syms t k;
syms a positive
f1=t;
f2=a-t;
Fs=int(f1*sin(k*pi*t/a))+int(f2*sin(k*pi*t/a),t,a/2,a);
F=simplify(F);
disp('$$')
disp(latex(f))
disp('$$')
disp('$$')
disp(latex(F))
disp('$$')

%%
n=[1 2 3 4];
d=[1 11 48 106 125 75 18];
[r,p,k]=residue(n,d);
[r1,d1]=rat(r);
disp([r1,d1,p])



%%
% G 分母能精确求出
syms s 
G=(2*s^7+2*s^3+8)/(s^8+30*s^7+386*s^6+2772*s^5+12093*s^4+32598*s^3+52520*s^2+45600*s+16000);
f=residue1(G);
disp(latex(f))

%%
num=[-17,-7,2,1,-1,1];
den=[1 11 48 106 125 75 17];
[r,p,k]=pfrac(num,den);
format long e
disp([r p])

%%
% 封闭曲线
i=sym(sqrt(-1));
syms z
f=1/((z+i)^10*(z-1)*(z-3));
r1=limit(diff(f*(z+i)^10,z,9)/prod(1:9),z,-i);
r2=limit(f*(z-1),z,1);
z=2*pi*i*(r1+r2);
disp(z)

%% 
% example
%%
% 1
clear 
clc
syms a t p o
f1=sin(a*t)/t;
f2=t^5*sin(a*t);
f3=t^8*cos(a*t);
f4=t^6*exp(a*t);
f5=5*exp(-a*t)+t^4*exp(-a*t)+8*exp(-2*t);
f6=exp(p*t)*sin(a*t+o);
f7=exp(-12*t)+6*exp(9*t);
fs=[f1 f2 f3 f4 f5 f6 f7];
for i=1:7
    disp('$$')
    disp(latex(fs(i)))
    disp('$$')
    disp('$$')
    disp(latex(laplace(fs(i))))
    disp('$$')
end

%%
% 2
clear
clc
syms s a b
f=sym(zeros(9));
f(1)=1/(sqrt(s^2)*(s^2-a^2)*(s+b));
f(2)=sqrt(s-a)-sqrt(s-b);
f(3)=log((s-a)/(s-b));
f(4)=1/sqrt(s)/(s+a);
f(5)=3*a^2/(s^3+a^3);
f(6)=(s-1)^8/s^7;
f(7)=log((s^2+a^2)/(s^2+b^2));
lis=sym([1:8])+s;
f(8)=(s^2+3*s+8)/prod(lis);
f(9)=1/2*(s+a)/(s-a);
for i=1:9
    disp('$$')
    disp(latex(f(i)))
    disp('$$')
    disp('$$')
    disp(latex(laplace(f(i))))
    disp('$$')
end

%%
clear
clc
syms t s
f=exp(-t);
answer=solve(s^2+3*s+2==fourier(f),s);
disp(answer)

%%
% ezplot
ezplot('exp(-2*t)*sin(4*t+2)+4*exp(-0.5*t)*cos(2*t)-0.5',[0 5])
hold on
line([0 5],[0 0])

%%
% two elem
clear
clc
ezplot('x^2*exp(-x*y^2/2)+exp(-x/2)*sin(x*y)');
syms x y
disp('$$')
disp(latex(x^2*exp(-x*y^2/2)+exp(-x/2)*sin(x*y)))
disp('$$')

hold on
ezplot('y^2*cos(y+x^2)+x^2*exp(x+y)');

disp('$$')
disp(latex(y^2*cos(y+x^2)+x^2*exp(x+y)))
disp('$$')
%%
%
clear
clc
ezplot('x^2+y^2-1')
hold on
ezplot('0.75*x^3-y+0.9')
%%
% solve
syms x y
[x,y]=solve('0.75*x^3-y+0.9=0','x^2+y^2-1=0');
disp([x y])

disp([eval('0.75*x.^3-y+0.9'),eval('x.^2+y.^2-1')])
%%
%
syms a b x y
[x,y]=solve('x^2+a*x^2+6*b+3*y=0','a+x+3-y=0','x,y');
x=simplify(x);
y=simplify(y);
disp(x)
disp(y)
disp(latex(x));
disp(latex(y))

%%
% fsolve
y=[];
xx=0:0.05:10;
x0=0;
h=optimset;
h.Display='off';
for x=xx
    f=inline(['w.*exp(w)-',num2str(x)],'w');
    y1=fsolve(f,x0,h);
    x0=y1;
    y=[y,y1];
end
subplot(211)
plot(xx,y)
subplot(212)
plot(xx,lambertw(xx))

%%
%???
%q=@(p)[p(1)*p(1)+p(2)*p(2)-1;0.75*p(1)^3-p(2)+0.9];

OPT=optimset;
OPT.LargeScale='off';
[x ,Y, c, d]=fsolve('my2deq',[3;2],OPT);
disp([x,Y,c,d])
%%
%????
clear
clc
OPT=optimset;
OPT.LargeScale='off';
f=inline('[p(1)*p(1)+p(2)*p(2)-1;0.75*p(1)^3-p(2)+0.9]','p');

[x,Y,c,d]=fsolve(f,[1;2],OPT);
disp([x,Y,c,d])

%%
%
y=inline('exp(-3*t).*sin(4*t+2)+4*exp(-0.5*t).*cos(2*t)-0.5','t');
ff=optimset;
ff.Display='iter';
[t,f]=fsolve(y,3.52,ff);
disp([t ,f])

%%
% fminunc
f=inline('(x(1)^2-2*x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2))','x');
x0=[0,0];
ff=optimset;
ff.Display='iter';
x=fminsearch(f,x0,ff);
disp(fminunc(f,x0',ff))

%%
% 利用梯度求解最优化问题
[x,y]=meshgrid(0.5:0.01:1.5);
z=100*(y.^2-x).^2+(1-x).^2;
contour3(x,y,z,100);
set(gca,'zlim',[0,310])

%%
%
f=inline('100*(x(2)-x(1)^2)^2+(1-x(1))^2','x');
ff=optimset;
ff.TolX=1e-10;
ff.TolFun=1e-20;
ff.Display='iter';
x=fminunc(f,[0;0],ff);
format long
disp(x)
%%
syms x1 x2
f=100*(x2-x1^2)^2+(1-x1)^2;
J=jacobian(f,[x1,x2]);

ff=optimset;
ff.GradObj='on';
x=fminunc('c6func',[0;0],ff);
disp(x)

%%
[x1,x2]=meshgrid(-3:0.1:3);
z=x1.^2-x2;
i= x1.^2+x2.^2>9;
z(i)=NaN;
i=(x1+x2>1);
z(i)=NaN;
surf(x1,x2,z);
shading interp

%%
% 线性规划

f=-[2 1 4 3 1]';
A=[0 2 1 4 2;3 4 5 -1 -1];
B=[54;62];
Ae=[];
Be=[];
xm=[0 0 3.32 0.678 2.57];
ff=optimset;
ff.LargeScale='off';
ff.TolX=1e-15;
ff.TolFun=1e-20;
ff.TolCon=1e-20;
ff.Display='iter';
[x,f_opt,key,c]=linprog(f,A,B,Ae,Be,xm,[],[],ff);
disp([x,f_opt,key,c])

%%
%example


%%
% 微分方程问题的计算机求解



































