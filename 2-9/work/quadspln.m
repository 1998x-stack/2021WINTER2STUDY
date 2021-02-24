function y=quadspln(x0,y0,a,b)
    f=inline('interp1(x0,y0,x,''spline'')','x','x0','y0');
    y=quadl(f,a,b,1e-8,[],x0,y0);
end