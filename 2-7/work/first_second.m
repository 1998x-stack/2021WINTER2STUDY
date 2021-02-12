%%
%diag
V=diag([1 2 3 4])+diag([2 3 4],1)+diag([5 4 3],-1);
disp(V)
%%
%diagm
% A1=magic(3);
% A2=vander(3);
% A3=ones(3);
% A=diagm([A1;A2;A3]);
% disp([A1;A2;A3])
% disp(A)

%%
% Hankel
C=[1 2 3];
R=[3 4 5 6 7 8 9];
H=hankel(C,R);
disp(H)

%%
%Hilbert and invhilb
disp(hilb(3))
disp(invhilb(3))
% 尽量采用符号运算工具箱，采用数值解应该检验结果的正确性

%%
%Vander(C)
C=[1 2 3 4 5];
disp(vander(C))


%%
% 伴随矩阵==用来求解特征值，进而解方程

p=[2 0 4 5 6];
A=compan(p);
disp(A)
disp(svd(A))

%%
% sym
syms a1 a2 a3 a4
disp(compan([a1 a2 a3 a4]))

%%
%det
A=[2 3 4;5 6 7;8 9 2];
disp(A)
disp(det(A))
disp(hilb(3))
disp(det(hilb(3)))
tic
A=(hilb(10));
disp(det(A))
toc

tic
A=sym(hilb(10));
disp(det(A))
toc
%%
%trace
%%
%rank
H=hilb(20);
disp(rank(H))
disp(rank(sym(H)))

%%
%norm
A=magic(4);
disp([norm(A),norm(A,2),norm(A,1),norm(A,inf),norm(A,'fro')])

%%
%poly
disp(poly(magic(3)))
disp(poly(compan([1 2 3 4])))

%%
% poly1
A=magic(3);
disp(poly1(A));
disp(poly(A));

%%
% Cayley-Hamilton
A=vander([1 2 3 4 5 6 7]);
aa=poly(A);
B=polyvalm(aa,A);
disp(norm(B));

aa=poly1(A);
B=polyvalm(aa,A);
disp(norm(B));


%%
% poly2sym
P=[1 2 3 4 5 6];
f=poly2sym(P);
disp(f)
A=sym(magic(3));
g=subs(P,'x',A);
disp(g)
disp(sym2poly(f))
% disp(sym2poly(g))

%%
% inv
format long
H=hilb(4);
Hinv=inv(H);
disp(norm(H*Hinv-eye(size(H))))
%%
% sym inv
H=sym(hilb(7));
disp(norm(double(H*inv(H))-eye(size(H))))

%%
% pinv
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
M=pinv(A);
% 三个条件
% AMA=A
disp(norm(A*M*A-A))

% MAM=M
disp(norm(M*A*M-M));

%AM and MA are Hermite symmetric
disp(norm(A*M-(A*M)'))
disp(norm(M*A-(M*A)'))

%%
% two step QR  eig
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
disp(eig(sym(A)))
disp(vpa(eig(sym(A)),50))
[v,d]=eig(sym(A));
disp(v)
disp(d)
%%
%orth
A=[5 9 8 3;0 3 2 4;2 3 5 9;3 4 5 8];
Q=orth(A);
disp(Q);
disp(norm(Q*Q'-eye(size(A))))

%%
% choleshy 和三角分解
A=[5 9 8 3;0 3 2 4;2 3 5 9;3 4 5 8];
[L,U]=lu(A);
disp(L)
disp(U)

[L,U,P]=lu(A);
disp(L)
disp(U)
disp(P)

disp(norm(L*U-P*A))
disp(norm(inv(P)*L*U-A))

%%
% cholesky 矩阵必须为正定矩阵。
% A=[16 2 3 13;
%     5 11 10 8;
%     9 7 6 12;
%     4 14 15 1];
% D=chol(A);
% disp(D)
% disp(norm(D'*D-A))

%%
% 判断是否是正当
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
[D,p]=chol(A);
disp(D)
disp(p)

disp(norm(A'*A-A*A')<eps)


%%
% Jordan
A=[
    -71 -65 -81 -46;
    75 89 117 50;
    0 4 8 4;
    -67 -121 -173 -58
    ];
[V,D]=eig(A);
disp(V)
disp(D)

[v,d]=eig(sym(A));
disp(v)
disp(d)

[V,J]=jordan(A);
disp(V)
disp(J)
disp(norm(J-inv(V)*A*V))
%%
% SVD
S=svd(A);
disp(S)
[S,V,D]=svd(A);
disp(S)
disp(V)
disp(D)
disp(cond(A)-V(1)/V(end))

%%
% Ax=B
% A:square  x=inv(A)*B
% x=pinv(A)*B  or infinite ways: null(A)  or null(A,'r')

A=[
    1 2 3 4;
    2 2 1 1;
    2 4 6 8;
    4 4 2 2;
    ];
b=[1;3;2;6];
disp([rank(A),rank(A,b)])
Z=null(A,'r');
disp(Z)
x0=pinv(A)*b;
disp(x0)

a1=randn(1);
a2=rand(1);
disp(norm(A*(a1*Z(:,1)+a2*Z(:,2)+x0)-b))


%%
A=[
    1 2 3 4;
    2 2 1 1;
    2 4 6 8;
    4 4 2 2;
    ];
b=[1;3;2;6];
Z=null(sym(A));
x0=sym(pinv(A)*b);
syms a1 a2
disp(a1*Z(:,1)+a2*Z(:,2)+x0)



%%
% Lyapunov AX+XA'=C
A=[1 2 3;
    4 5 6;
    7 8 0;
    ];
C=-[10 5 4;
    5 6 7;
    4 7 9;
    ];
X=lyap(A,C);
disp(X)

%%
% kron
A=[1 2 3;
    4 5 6;
    7 8 0;
    ];
C=-[10 5 4;
    5 6 7;
    4 7 9;
    ];

A0=sym(kron(A,eye(3))+kron(eye(3),A));
c=reshape(C',9,1);
x0=-inv(A0)*c;
X=reshape(x0,3,3)';
disp(X)
disp(norm(double(A*X+X*A'+C)))
%%
% sym A
A=[
    -7 2 0 -1;
    1 -4 2 1;
    2 -1 -6 -1;
    -1 -1 0 -4;
];
syms t;
j=sym(sqrt(-1));
A1=simplify((expm(A*j*t)-expm(-A*j*t))/(2*j));
A2=simplify((expm(A*j*t)+expm(-A*j*t))/(2));
disp(A1)
disp(A2)


