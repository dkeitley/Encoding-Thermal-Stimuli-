function plotIntervalHist(spikes,numBins)
    dt = 5*10^-5;
    spike_times = dt*find(spikes == 1);
    isi = diff(spike_times);
    %careful, std could be 0
    CV = std(isi)/mean(isi);
    disp(CV);
    figure()
    histfit(isi,numBins,'gamma')
    xlabel('Time (s)');
    ylabel('Number of spikes');
    

end