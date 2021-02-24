%%
% interp1
x=0:0.1:1;
y0=(x.^2-2*x+5).*exp(-5*x).*sin(x);
plot(x,y0)
%%
x=0:0.1:1;
x1=0:0.01:1;
y=(x.^2-2*x+5).*exp(-5*x).*sin(x);
y0=(x1.^2-2*x1+5).*exp(-5*x1).*sin(x1);
y1=interp1(x,y,x1);
y2=interp1(x,y,x1,'PCHIP');
y3=interp1(x,y,x1,'spline');
y4=interp1(x,y,x1,'nearest');
plot(x1,[y1',y2',y3',y4'],':',x,y,'o',x1,y0)
%%
sketcher;
%%
[x0,y0]=ginput(6);
x=min(x0):(max(x0)-min(x0))/8:max(x0);
y=lagrange1(x0,y0,x);
plot(x0,y0,'o')
hold on
plot(x,y,'ro')
%%
bis=[0.6,0.4,0.2,0.1];
for i = 1:4
    subplot(2,2,i)
    b=bis(i);
    [x,y]=meshgrid(-3:b:3,-3:b:3);
    z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
    surf(x,y,z);
    axis([-3 3 -3 3 -1 2])
end
%%
[x,y]=meshgrid(-3:0.6:3,-3:0.6:3);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);

[x1,y1]=meshgrid(-3:0.2:3,-3:0.2:3);
z1=(x1.^2-2*x1).*exp(-x1.^2-y1.^2-x1.*y1);
z2=interp2(x,y,z,x1,y1);
subplot(221)
surf(x1,y1,z1)
axis([-3 3 -3 3 -1 2])
subplot(222)
surf(x1,y1,z2)
axis([-3 3 -3 3 -1 2])
subplot(223)
contour3(x1,y1,z1-z2)
axis([-3 3 -3 3 -1 2])

%%
[x,y]=meshgrid(-3:0.6:3,-3:0.6:3);
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);

[x1,y1]=meshgrid(-3:0.2:3,-3:0.2:3);
z0=(x1.^2-2*x1).*exp(-x1.^2-y1.^2-x1.*y1);
z1=interp2(x,y,z,x1,y1,'cubic');
z2=interp2(x,y,z,x1,y1,'spline');

subplot(221)
surf(x1,y1,z1)
axis([-3 3 -3 3 -1 2])
subplot(222)
surf(x1,y1,z2)
axis([-3 3 -3 3 -1 2])
subplot(223)
surf(x1,y1,z1-z2)
axis([-3 3 -3 3 -1 2])
subplot(224)
surf(x1,y1,z0)
axis([-3 3 -3 3 -1 2])

%%
x=-2+6*rand(200,1);
y=-2+4*rand(200,1);
z=(x.^2-2*x).*exp(-x.^2-y.^2+x.*y);
plot(x,y,'x');
figure
plot3(x,y,z,'x');


%%
x=-2+6*rand(200,1);
y=-2+4*rand(200,1);
z=(x.^2-2*x).*exp(-x.^2-y.^2+x.*y);
[x1,y1]=meshgrid(-3:0.1:3,-2:0.1:2);
z0=(x1.^2-2*x1).*exp(-x1.^2-y1.^2+x1.*y1);
subplot(221)
surf(x1,y1,z0);
axis([-3 3 -2 2 -1 2])

z1=griddata(x,y,z,x1,y1,'cubic');
subplot(222)
surf(x1,y1,z0-z1);
axis([-3 3 -2 2 -0.1 0.2])


z2=griddata(x,y,z,x1,y1,'v4');
subplot(223)
surf(x1,y1,z0-z2);
axis([-3 3 -2 2 -0.1 0.2])
%%
[x,y,z]=meshgrid(-1:0.2:1);
V=exp(x.^2.*z+y.^2.*x+z.^2.*y).*cos(x.^2.*y.*z+z.^2.*y.*x);

[x0,y0,z0]=meshgrid(-1:0.1:1);
V0=exp(x0.^2.*z0+y0.^2.*x0+z0.^2.*y0).*cos(x0.^2.*y0.*z0+z0.^2.*y0.*x0);

V1=interp3(x,y,z,V,x0,y0,z0,'spline');
err=V1-V0;
size(err)
max(err(:))

%%
clc
x0=[0 0.4 1 2 pi];
y0=sin(x0);
sp1=csapi(x0,y0);
fnplt(sp1,':r')
hold on
ezplot('sin(t)',[0 pi])
plot(x0,y0,'bo')

%%
x0=-3:0.2:3;
y0=-2:0.2:2;
[x,y]=ndgrid(x0,y0);%只能用ndgrid，否则生成的z矩阵顺序又问
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
sp1=csapi({x0,y0},z);
subplot(221)
fnplt(sp1)
subplot(223)
surf(x,y,z)



%%
% B样条

clc
x0=[0 0.4 1 2 pi];
y0=sin(x0);
sp1=csapi(x0,y0);
fnplt(sp1,':r')
hold on
sp2=spapi(5,x0,y0);
fnplt(sp2,'--g')
hold on
ezplot('sin(t)',[0 pi])
plot(x0,y0,'bo') 

%%
clc
x0=[0 0.4 1 2 pi];
y0=sin(x0);

for i=5:10
    sp2=spapi(5,x0,y0);
    fnplt(sp2)
    hold on
end
legend('5','6','7','8','9','10')
%%
% 样条  数值微积分
clc
syms x 
f=(x^2-3*x+5)*exp(-5*x)*sin(x);
ezplot(diff(f),[0,1]);
hold on

x=0:0.1:1;
y=(x.^2-3.*x+5).*exp(-5.*x).*sin(x);

sp1=csapi(x,y);
dsp1=fnder(sp1,1);
fnplt(dsp1,'r--');
hold on


sp2=spapi(5,x,y);
dsp2=fnder(sp2,1);
fnplt(dsp2,'bo');

%%
clc
x0=-3:0.2:3;
y0=-2:0.2:2;
[x,y]=ndgrid(x0,y0);%只能用ndgrid，否则生成的z矩阵顺序又问
z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
sp=spapi({5,5},{x0,y0},z);
dspxy=fnder(sp,[1,1]);
fnplt(dspxy)
%%
clc
syms x y
z=(x^2-2*x)*exp(-x^2-y^2-x*y);
ezsurf(diff(diff(z,x),y),[-3,3],[-2,2])

%%
x=[0 0.4 1 2 pi];
y=sin(x);
sp1=csapi(x,y);
a=fnint(sp1,1);
xx=fnval(a,[0,pi]);
xx(2)-xx(1)
%%
x=[0 0.4 1 2 pi];
y=sin(x);
sp2=spapi(5,x,y);
b=fnint(sp2,1);
xx=fnval(b,[0,pi]);
xx(2)-xx(1)
%%
ezplot('2-cos(t)',[0 pi]);
hold on
fnplt(a,'g--')
fnplt(b,'b:')

%%
x0=0:0.1:1;
y0=(x0.^2-3.*x0+5).*exp(-5.*x0).*sin(x0);
p3=polyfit(x0,y0,3);
vpa(poly2sym(p3),10)

%%
x0=0:0.1:1;
y0=(x0.^2-3.*x0+5).*exp(-5.*x0).*sin(x0);
x=0:0.01:1;
ya=(x.^2-3.*x+5).*exp(-5.*x).*sin(x);
p3=polyfit(x0,y0,3);
y1=polyval(p3,x);

plot(x,y1,x,ya,x0,y0,'o')
%%
x0=-1+2*[0:10]/10;
y0=1./(1+25.*x0.^2);
x=-1:0.01:1;
ya=1./(1+25*x.^2);
for i=3:2:10
    p=polyfit(x0,y0,i);
    y=polyval(p,x);
    plot(x,y)
    hold on
end
plot(x,ya)
legend('3','5','7','9','origin')

%%
syms x
y=1/(1+25*x^2);
p=taylor(y,x,10);
x1=-1:0.01:1;
y1=subs(p,x,x1);
plot(x1,y1)
hold on
ezplot('1/(1+25*x^2)',[-1,1])


%%

a=[2 5 6];
k=[0 0 0];
for i =1:1000
    p=a(randperm(numel(a),1));
    if p==2
        k(1)=k(1)+1;
    end
    if p==5
        k(2)=k(3)+1;
    end
    if p==6
        k(3)=k(3)+1;
    end
end
bar(k)
    
%%
ps=zeros(1,10000);
for i=1:10000
    ps(i)=unifrnd(0,1,1);
end
hist(ps)
%%
% lsqcurvefit
x=0:0.1:10;
y=0.12*exp(-0.214*x)+0.54*exp(-0.17*x).*sin(1.23*x);
f=inline('a(1)*exp(-a(2)*x)+a(3)*exp(-a(4)*x).*sin(a(5)*x)','a','x');

[xx,res]=lsqcurvefit(f,[1 1 1 1 1],x,y)
% 初值和终点最好相近

%%
ff=optimset;
ff.TolFun=1e-20;
ff.TolX=1e-15;

x=0:0.1:10;
y=0.12*exp(-0.214*x)+0.54*exp(-0.17*x).*sin(1.23*x);
f=inline('a(1)*exp(-a(2)*x)+a(3)*exp(-a(4)*x).*sin(a(5)*x)','a','x');,[],[],ff

[xx,res]=lsqcurvefit(f,[1 1 1 1 1],x,y)


%% 
% 自相关
syms A1 A2 w1 w2 t1 t2 t tau T
x=A1*cos(w1*t+t1)+A2*cos(w2*t+t2);

Rxx=simplify(limit(int(x*subs(x,t,t+tau),t,0,T)/T,T,inf));
disp(Rxx)

%%
% corrcoef
clc

x=0:0.01:5;
y1=x.*exp(-4*x).*sin(3*x);
y2=x.*exp(-4*x).*cos(3*x);

corrcoef(y1,y2)

%%
% xcorr
t=0:0.01:5;
x=t.*exp(-4*t).*sin(3*t);
y=t.*exp(-4*t).*cos(3*t);
N=150;
c1=xcorr(x,N);
x1=-N:N;
c2=xcorr(x,y,N);
subplot(2,1,1)
stem(x1,c1)
subplot(2,1,2)
stem(x1,c2)

%%
h=0.01;
t=0:h:1;
x=12*sin(2*pi.*t+pi/4)+5*cos(2*pi.*t*4);
X=fft(x);
f=t/h;
plot(f(1:floor(length(f)/2)),abs(X(1:floor(length(f)/2))));
set(gca,'XLim',[0,10])
%%
% freqz


%%
% poisscdf
x=[0:15]';
y1=[];
y2=[];
lam1=[1 2 5 10];
for i=1:length(lam1)
    y1=[y1,poisspdf(x,lam1(i))];
    y2=[y2,poisscdf(x,lam1(i))];
end
subplot(221);
plot(x,y1)
subplot(222);
plot(x,y2)

%%
% normcdf
x=[-5:0.02:5]';
y1=[];
y2=[];
mu1=[-1 0 0 0 1];
sig1=[1 0.1 1 10 1];
sig1=sqrt(sig1);
for i=1:length(sig1)
    y1=[y1,normpdf(x,mu1(i),sig1(i))];
    y2=[y2,normcdf(x,mu1(i),sig1(i))];
end
subplot(221);
plot(x,y1)
subplot(222);
plot(x,y2)
%%
% chi
x=[0:0.02:2]';
% x=sort(x');
k1=[1 2 3 4 5];
y1=[];
y2=[];
for i=1:length(k1)
   y1=[y1,chi2pdf(x,k1(i))];
   y2=[y2,chi2cdf(x,k1(i))];
   
end
subplot(221)
plot(x,y1)
subplot(222)
plot(x,y2)


%%
% tpdf
x=[-2:0.02:2]';
% x=sort(x');
k1=[1 2 3 4 5];
y1=[];
y2=[];
for i=1:length(k1)
   y1=[y1,tpdf(x,k1(i))];
   y2=[y2,tcdf(x,k1(i))];
   
end
subplot(221)
plot(x,y1)
subplot(222)
plot(x,y2)

%%
% raylrnd
clc
b=3;
x=0:0.1:4;
y=raylpdf(x,b);
p=raylrnd(b,30000 ,1);
yy=hist(p,x);
yy=yy/(30000*0.1);
bar(x,yy)
line(x,y);

%%
%% E V
syms x
syms a lam
p=lam^a*x^(a-1)/gamma(a)*exp(-lam*x);
m=int(x*p,x,0,inf);
disp(m)

v=simplify(int((x-m)^2*p,x,0,inf));
disp(v)

%%
% cov
p=randn(3000,4);
cov(p)
p1=rand(3000,4);
cov(p1)
%%
% mvnpdf
mu1=[-1,2];
Sigma2=[1 1 ;1 3];
[X,Y]=meshgrid(-3:0.1:1,-2:0.1:4);
xy=[X(:) Y(:)];
p=mvnpdf(xy,mu1,Sigma2);
P=reshape(p,size(X));
subplot(2,2,1)
surf(X,Y,P)
Sigma1=diag(diag(Sigma2));
p1=mvnpdf(xy,mu1,Sigma1);
P1=reshape(p1,size(X));
subplot(222)
surf(X,Y,P1)

%%
% mvnrnd
mu1=[-1,2];
Sigma2=[1 1;1 3];
R=mvnrnd(mu1,Sigma2,2000);
plot(R(:,1),R(:,2),'o');
hold on
Sigma1=[1 0;0 3];
R1=mvnrnd(mu1,Sigma1,2000);
plot(R1(:,1),R1(:,2),'r.');
%%
% normfit, gamfit....
p=gamrnd(1.5,3,30000,1);
Pv=[0.9,0.92,0.95,0.98];
A=[];
for i=1:length(Pv)
   [a,b]=gamfit(p,Pv(i));
   A=[A;Pv(i),a(1),b(:,1)',a(2),b(:,2)'];
   
end
disp(A)

%%
% X\y and regress
clc
a=[1 -1.232 2.23 2 4 3.792]';
X=randn(120,6);
y=X*a;

disp('X\y')
b=X\y;
disp(b)
disp('err')
disp(norm(b-a))
alpha=0.02;
[~,aint]=regress(y,X,alpha);
disp('sigma=0')
disp(aint)

yhat1=y+sqrt(0.5)*randn(120,1);
[~,aint1]=regress(yhat1,X,alpha);
disp('sigma=sqrt(0.5)')
disp(aint1)
yhat2=y+sqrt(0.1)*randn(120,1);
[~,aint2]=regress(yhat2,X,alpha);
disp('sigma=sqrt(0.1)')
disp(aint2)

errorbar(1:6,a,aint1(:,1)-a,aint1(:,2)-a)
hold on
errorbar(1:6,a,aint2(:,1)-a,aint2(:,2)-a)

%%
% nlinfit
f=inline('a(1)*exp(-a(2)*x)+a(3)*exp(-a(4)*x).*sin(a(5)*x)','a','x');
x=0:0.1:10;
y=f([0.12,0.213,0.54,0.18,1.23],x);
[a,r,J]=nlinfit(x,y,f,[1;1;1;1;1]);
disp(a)
disp(r)
disp(J)
ci=nlparci(a,r,J)

y1=f([0.12,0.213,0.54,0.18,1.23],x)+0.01*rand(size(x));
[a1,r1,J1]=nlinfit(x,y1,f,[1;1;1;1;1]);
disp(a1)
disp(r1)
disp(J1)
ci1=nlparci(a1,r1,J1)
errorbar(1:5,a,ci(:,1)-a,ci(:,2)-a)
hold on
errorbar(1:5,a,ci1(:,1)-a,ci1(:,2)-a)

%%

%选取统计量
n=200;mu0=9.94;xbar=9.73;s=1.62;
u=sqrt(n)*(mu0-xbar)/s;
alpha=[0.01:0.01:0.09];
K=norminv(1-alpha/2,0,1);

[alpha',K']
abs(u)<K

%%
% kstest(X,cdffun,alpha)
clc
r=gamrnd(1,3,400,1);
alam=gamfit(r);
hist(r,10)
r=sort(r);
[H0,p]=kstest(r,[r,gamcdf(r,alam(1),alam(2))],0.05)

%%
% anova1
clc
A=[5 4 6 7 9;8 6 4 4 3;7 6 4 6 5;7 3 5 6 7;10 5 4 3 7;8 6 3 5 6];
[p,tb1,stats]=anova1(A)



