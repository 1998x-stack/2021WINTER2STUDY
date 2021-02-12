function f=residue1(F,s)
    f=sym(0);
    if nargin==1
        syms s;
    end
    [~,den]=numden(F);
    
    x=solve(den);
    [~,ii]=sort(double(x));
    x=[x(ii);rand(1)];
    k_vec=find(diff(double(x))~=0);
    ee=x(k_vec);
    k_vec=[k_vec(1);diff(k_vec(:,1))];
    for i=1:length(k_vec)
        for j=1:k_vec(i)
            m=k_vec(i);
            s0=ee(i);
            k=limit(diff(F*(s-s0)^m,s,j-1),s,s0);
            f=f+k/(s-s0)^(m-j+1)/factorial(j-1);
        end
    end

end