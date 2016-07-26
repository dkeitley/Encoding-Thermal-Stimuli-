function plotRaster(spikes)

    m = size(spikes);
    trials = m(2);
    dt = 5*10^-5;
    
    for i = 1:trials
        t_vec = 0:dt:(size(spikes{i})-1)*dt;
        plot(t_vec,i*spikes{i},'+')
        hold on
    end
    
    a = axis();
    axis([a(1), a(2), 0.5, a(4)+0.5]);
    xlabel('Time (s)');
    ylabel('Trial Number');

end