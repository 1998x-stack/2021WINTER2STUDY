A=[1 2 3;4 5 6; 7 8 0];  C=-[10, 5, 4; 5, 6, 7; 4, 7, 9];
X=lyap(A,C)

norm(A*X+X*A'+C)
