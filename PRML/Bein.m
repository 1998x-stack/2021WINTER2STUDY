function  [P,Var,E]=Bein(x,p)
    n=numel(x);
    if n==1
        P=p^x*(1-p)^(1-x);
        Var=p*(1-p);
        E=p;
    else
        X=reshape(x,1,n);
        P=prod(p.^X*(1-p).^(1-X));
        E=sum(X)/n;
        Var=(X-E).^2/n;
    end
end