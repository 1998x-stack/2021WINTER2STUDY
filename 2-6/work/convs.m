function a=convs(varargin)
    % 多个多项式乘积
    a=1;
    for i=1:length(varargin)
        a=conv(a,varargin{i});
    end
end