function A=myhilb(n,m)
    % MYHIL(N,M)  produce a N rows and M columns Hilbert matrix
    % MYHILB(N) N*N hilbert matrix
    % see also HILB

    if nargout>1
        error('Too many output arguments')
    end
    if nargin==1
        m=n;
    elseif nargin==0 || nargin>2
        error('Wrong number of input arguments')
    end
    A=zeros(n,m);
    for i=1:n
        for j=1:m
            A(i,j)=1/(i+j-1);
        end
    end
end