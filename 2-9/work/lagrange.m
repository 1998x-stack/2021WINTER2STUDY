function y=lagrange(x0,y0,x)
    ii=1:length(x0);
    y=zeros(size(x));
    for i=ii
        y=y+y0(i)*(x-x0(i))/(prod(x0(i)-x0(ii(ii~=i))));
    end
end