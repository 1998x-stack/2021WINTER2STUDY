%%
%simple
syms s;
P=(s+3)^2*(s^2+3*s+2)*(s^3+12*s^2+48*s+64);
disp('P: ')
disp(P)

% [a,m]=simplify(P);
% disp('simplify(P):')
% disp(a)
% disp(m)

%%
%expand
exp_P=expand(P);
disp('expand(P): ')
disp(exp_P)

%%
%subs
syms t;
subs_P=subs(P,s,t);
disp('subs(P,s,t)');
disp(subs_P)

%%
% latex
syms a b c d t;
f=cos(a*t+b)+sin(c*t)*sin(d*t);
f1=taylor(f);
latex_f=latex(f1);
disp('f1')
disp(f1)
disp('latex')
disp(latex_f)

%%
% floor ceil round fix rat rem gcd lcm factor isprime
A=[-0.6546,0.645,0.6547,4.756,0.505,0.20,9.1];
disp(A);
disp('floor(A)')% 向下取整
disp(floor(A))
disp('ceil(A)')% 向上取整
disp(ceil(A))
disp('round(A)')% 向0取整
disp(round(A))
disp('fix(A)')%最近的整数
disp(fix(A))

HB=hilb(3);
% 元素变化成最简有理数，n和d分别为分子和分母矩阵
[n,d]=rat(HB);
disp(HB)
disp('rat(HB)')
disp(n)
disp(d)


%gcd lcm
m=sym(1856120);
n=sym(1483720);
disp('gcd and lcm')
disp(m)
disp(n)
disp([gcd(m,n),lcm(m,n)])
disp(factor(lcm(m,n)))

% all prime between 1 and 1000
A=1:1000;
disp('all prime between 1 and 1000')
disp(A(isprime(A)))

%%
%循环结构
s=0;
for i=1:100
    s=s+i;
end
disp('for loop')
disp(s)
s1=0;i=1;
while(i<=100)
    s=s+i;
    i=i+1;
end
disp('while loop')
disp(s1)

%级数求和
disp('第一种级数求和')
tic
s=0;
i=1;
for i=1:1000000
    s=s+1/2^i+1/3^i;
end
toc

%第二种级数求和
disp('第二种级数求和')
tic 
i=1:1000000;
s=sum(1./2.^i+1./3.^i);
toc




%%
%hilb
help myhilb
disp('myhilb(3,4)')
disp(myhilb(3,4))
disp('myhilb(4)')
disp(myhilb(4))


%fact
disp('5!')
disp(my_fact(5))

% 多个多项式之间乘积
P=[1,2,4,0,5];
Q=[1,2];
F=[1,2,3];
D=convs(P,Q,F);
disp('convs多个多项式之间乘积')
disp(D)

t=0:0.001:1;
y=zeros(4,length(t));
y(1,:)=sin(t);
y(2,:)=cos(t);
y(3,:)=exp(t);
y(4,:)=t;

plot(t,y)
% grid on

%%
% polor
theta=1:0.01:6*pi;
rho=5*sin(4*theta/3);
polar(theta,rho);
figure;
rho=5*sin(theta/3);
polar(theta,rho);


%bar stairs stem bar semilogx
t=0:0.02:2*pi;
y=sin(t);
subplot(2,2,1)
stairs(t,y);
subplot(2,2,2)
stem(t,y);
subplot(2,2,3)
bar(t,y)
subplot(2,2,4)
semilogx(t,y)


%%
% 隐函数绘图
subplot(2,1,1)
ezplot('x^2*sin(x+y^2)+y^2*exp(x+y)+5*cos(x^2+y)');
subplot(2,1,2)
ezplot('x^2*sin(x+y^2)+y^2*exp(x+y)+5*cos(x^2+y)',[-10,10]);

%%
%plot3
t=0:0.01:3*pi;
x=t.^3.*sin(3*t).*exp(-t);
y=t.^3.*cos(3*t).*exp(-t);
z=t.^2;
plot3(x,y,z);
grid;

stem3(x,y,z);

%%
% 三维曲面 meshgrid

% Butterworth

[x,y]=meshgrid(0:31);
n=2;
D0=200;
D=sqrt((x-16).^2+(y-16).^2);
z=1./(1+D.^(2*n)/D0);
% mesh(x,y,z);
axis([0,31,0,31,0,1])


% surf(x,y,z)

% waterfall(x,y,z);


% shading interp
surf(x,y,z)
% contour3(x,y,z)
shading flat


%%
%题目
%%
%2
syms s x

f=x^5+3*x^4+4*x^3+2*x^2+3*x+6;
disp(f)
subs_f=subs(f,x,(s-1)/(s+1));
disp(subs_f);
disp(simplify(subs_f));
%%
%3
A=[1 2 3 4;4 3 2 1;2 3 4 1;3 2 4 1];
B=[1+4j 2+3j 3+2j 4+1j;4+1j 3+2j 2+3j 1+4j;2+3j 3+2j 4+1j 1+4j; 3+2j 2+3j 4+1j 1+4j];
disp(A)
disp(B)
A(5,6)=5;
disp(A)
%%
%11
Henon(3000);

%%
%12
example12(2/3*pi/2)

%%
%13

example13


%%
%14

subplot(2,2,1)
theta1=0:0.1:3*pi;
polar(theta1,1.0013.*theta1)

subplot(2,2,2)
theta2=theta1;
polar(theta2,cos(7.*theta2./2));

subplot(2,2,3)
theta3=0.1:0.1:pi*2;
polar(theta3,sin(theta3)./theta3)

subplot(2,2,4)
theta4=theta1;
polar(theta4,1-cos(7.*theta4).^3);



%%
%15
ezplot('x^2+y^2-3*x*y^2');
hold on
ezplot('x^3-x^2-y^2+y');


%%
%16
[x,y]=meshgrid(-10:0.1:10);
z=x.*y;
mesh(x,y,z)
shading flat
contour3(x,y,z)

[x,y]=meshgrid(-10:0.1:10);
z=sin(x.*y);
mesh(x,y,z)
shading flat
contour3(x,y,z)
