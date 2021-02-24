function z=jointEntropy(x,y)
%     Compute joint entropy z=H(x,y) of two discrete variables
%     Input:
%         x,y:two integer vector of the same length
%     Output:
%         z:joint entropy z=H(x,y)
    assert(numel(x)==numel(y));
    n=numel(x);
    x=reshape(x,1,n);
    y=reshape(y,1,n);
    
    l=min(min(x),min(y));
    x=x-l+1;
    y=y-l+1;
    k=max(max(x),max(y));
    
    idx=1:n;
    p=nonzeros(sparse(idx,x,1,n,k,n));
    
    z=-dot(p,log2(p));
    z=max(0,z);
end