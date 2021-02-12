function c=poly1(A)
    [nr,nc]=size(A);
    if nc==nr
        I=eye(nc);
        R=I;
        c=[1 zeros(1,nc)];
        for k=1:nc
            c(k+1)=-trace(A*R)/k;
            R=A*R+c(k+1)*I;
        end
    elseif (nr==1 || nc==1)
        A=A(isfinite(A));
        n=length(A);
        c=[1 zeros(1,n)];
        for j=1:n
            c(2:(j+1))=c(2:(j+1))-A(j).*c(1:j);
        end
    else
        error('Argument must be a vector or a square matrix');
    end
        
end