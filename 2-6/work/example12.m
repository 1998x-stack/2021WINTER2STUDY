function example12(angle)
	%angle is between (0,120)
    theta=[0,2*pi*1/3,2*pi*2/3,0];
    rho=[1,1,1,1];
    polar(theta,rho);
	hold on
    i=1;
    while angle*i<2/3*pi
        polar(theta+angle*i,rho)
		hold on
        i=i+1;
    end
end