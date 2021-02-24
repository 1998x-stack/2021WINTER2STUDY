function z=relativeEntropy(x,y)
%     compute relative entropy (KL divergence) z=KL(p(x)||p(y)) of discrete variable and x and y
%     Input:
%         x y :two integer vector of the same length
%     Output:
%         z: relativa entropy(KL divergence) z=KL(p(x||p(y)))
    assert(numel(x)==numel(y));
    n=numel(x);
    x=reshape(x,1,n);
    y=reshape(y,1,n);
    
    l=min(min(x),min(y));
    x=x-l+1;
    y=y-l+1;
    k=max(max(x),max(y));
    idx=1:n;
    
    Mx=sparse(idx,x,1,n,k,n);
    My=sparse(idx,y,1,n,k,n);
    Px=nonzeros(mean(My,1));
    Py=nonzeros(mean(My,1));
    
    z=-dot(Px,log2(Py)-log2(Px));
    z=max(0,z);
    
    