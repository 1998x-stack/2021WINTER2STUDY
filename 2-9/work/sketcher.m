function sketcher(vis)
    x=[];
    y=[];
    i=1;
    h=[];
    axis([0,1,0,1]);
    while 1
        [x0,y0,but]=ginput(1);
        if but==1
            if i>=2
                delete(g)
            end
            x=[x,x0];
            y=[y,y0];
            h(i)=line(x0,y0);
            set(h(i),'Marker','o');
            i=i+1;
            x_1=min(x);
            x_2=max(x);
            xx=[x_1:(x_2-x_1)/(i*30):x_2];
            yy=interp1(x,y,xx,'spline');
            g=line(xx,yy);
            
        else
            break
        end
    end
    if nargin==1
        delete(h);
    end
end