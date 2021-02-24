b=1.2296e-6*conv([1 4 6 4 1],[1 3 3 1]); a=conv([1,-0.7265],...
    conv([1,-1.488,0.5644],conv([1,-1.595,0.6769],[1,-1.78,0.8713])));
x=0:0.002:2; y=exp(-x).*sin(5*x); r=0.05*randn(size(x)); y1=y+r;
y2=filter(b,a,y1);  % 例 8-32 中给出的滤波方法
[C,L]=wavedec(y1,4,'db6'); A4=wrcoef('a',C,L,'db6',4);
plot(x,y,x,y2,x,A4)   % 原未污染信号与污染信号的两种滤波效果