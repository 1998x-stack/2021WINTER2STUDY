function z=entropy(x)
%     compute entropy z=H(x) of a discrete variable x
%     Input:
%         x: an integer vectors
%     Output:
%         z: entropy z=H(x)
    n=numel(x);
    [~,~,x]=unique(x);
    Px=accumarray(x,1)/n;
    Hx=-dot(Px,log2(Px));
    z=max(0,Hx);
