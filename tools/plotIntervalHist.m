function plotIntervalHist(spikes,numBins,times)
    
    spike_times = [];
    dt = 5*10^-5;
    edgeWidth = 0.2/numBins;
    edges = [0:edgeWidth:0.2,1];
    figure()
    
    if(nargin > 2)
        model_times = times;
        isi_model = diff(model_times);
        subplot(1,2,1);
        histogram(isi_model,edges);
        title('Model');
        xlabel('Time (s)');
        ylabel('Number of spikes');
        ax = axis();
        axis([0,0.2,0,ax(4)])
        subplot(1,2,2);  
    end
    
    spike_times = dt*find(spikes == 1);
    isi = diff(spike_times);
    
    try
        CV = std(isi)/mean(isi);
        disp('Coefficient of Variation:')
        disp(CV);
    catch
        disp('ISI has 0 mean.');  
    end
    
    histogram(isi,edges);
    ax = axis();
    axis([0,0.2,0,ax(4)])
    title('Data')
    xlabel('Time (s)');
    ylabel('Number of spikes');

end