function k=my_fact(n)
    % n!
    if nargin~=1
        error('there are to many input arguments')
    end
    if nargout>1
        error('too many out arguments')
    end
    if abs(n-floor(n))>eps || n<0
        error('n 应该是非负整数')
    end
    if n==1 || n==0
        k=1;
    else
        k=n*my_fact(n-1);
    end
end