function example13
    all_ks=[0.1,0.01,0.005,0.001,0.0001,0.00005];
    for k=1:6
        subplot(3,2,k)
        t=-1:all_ks(k):1;
        plot(t,sin(1./(t+eps)));
    end
end