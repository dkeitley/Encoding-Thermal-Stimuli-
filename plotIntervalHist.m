function plotIntervalHist(spikes,numBins,times)
    
    spike_times = [];
    dt = 5*10^-5;
    
    if(nargin > 2)
        spike_times = times;
    else
        spike_times = dt*find(spikes == 1);
    end
    
    isi = diff(spike_times);
    
    try
        CV = std(isi)/mean(isi);
        disp(CV);
    catch
        disp('ISI has 0 mean.');  
    end
    
    figure()
    %histfit(isi,numBins,'gamma')
    hist(isi,numBins);
    xlabel('Time (s)');
    ylabel('Number of spikes');

end