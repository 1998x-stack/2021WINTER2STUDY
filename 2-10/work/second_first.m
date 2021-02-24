%%
A=[10 -7 0;
    0 -0.1 6;
    0 2.5 5];
b=[7 6.1 2.5]';
disp(b\A)

[l,u,p]=lu(A);
disp(norm(inv(p)*l*u-A))



%%
A=[10 -7 0;
    0 -0.1 6;
    0 2.5 5];
[l,u,p]=lutx(A);


%%

u=-1:0.1:4;
x=[0.2 0.9 1.4 2];
y=x.^1.3;
v=polyinterp(x,y,u);
yu=u.^1.3;
plot(x,y,'o',u,v,'-',u,yu,'r:')
%%
syms u
x=[0.2 0.9 1.4 2];
y=x.^2;
v=polyinterp(x,y,u);
vpa(v,3)
pretty(v)
simplify(v)
%%







