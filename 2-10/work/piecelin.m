function v=piecelin(x,y,u)
    % linear interpolation
    delta=diff(y)./diff(x);
    
    n=length(x);
    k=ones(size(u));
    for j=2:n-1
        k(x(j)<=u&& x(j+1)>u)=j;
    end
    
    s=u-x(k);
    v=y(k)+s.*deltawhi(k);
end