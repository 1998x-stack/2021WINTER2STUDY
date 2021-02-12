function E=sinm1(A)
    E=zeros(size(A));
    F=A;
    k=1;
    while norm(E+F-E,1)>0
        E=E+F;
        F=-A^2*F/((k+2)*(k+1));
        k=k+2;
    end
end