A=[1 2 3;4 5 6; 7 8 0];
C=-[1+1i, 3+3i, 12+10i; 2+5i, 6, 11+6i; 5+2i, 11+1i, 2+12i];
A0=sym(kron(A,eye(3))+kron(eye(3),A));
c=reshape(C',9,1);  x0=-inv(A0)*c; x=reshape(x0,3,3)'

norm(double(A*x+x*A+C))