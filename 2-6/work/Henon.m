function [X,Y]=Henon(n)
    X=zeros(1,n);
    Y=zeros(1,n);
    for i=2:n
        X(i)=1+Y(i-1)-1.4*X(i-1)^2;
        Y(i)=0.3*X(i-1);
    end
    plot(X,Y);
end