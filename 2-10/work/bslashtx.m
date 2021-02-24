function x=bslashtx(A,b)
%     ·´Ð±ÏßÔËËã·û
%     x=bslashtx(A,b). solves A*x=b;
    [~,n]=size(A);
    if isequal(triu(A,1),zeros(n,n))
        x=forward(A,b);
        return
    elseif isequal(tril(A,-1),zeros(n,n))
        x=backsubs(A,b);
        return
    elseif isequal(A,A')
        [R,fail]=chol(A);
        if ~fail
            % positive definite
            y=forward(R',b);
            x=backsubs(R,y);
        end
    end
end
function x=forward(L,x)
    [~,n]=size(L);
    for k=1:n
        j=1:k-1;
        x(k)=(x(k)-L(k,j)*x(j))/L(k,k);
    end
end
function x=backsubs(U,x)
    [~,n]=size(U);
    for k=n:-1:1% key1
        j=k+1:n;% key2
        x(k)=(x(k)-U(k,j)*x(j))/U(k,k);
    end
end