function plotSTA(spikes,temps)

    numTrials = size(spikes,2);
    winSize = 300;
    trialAvgs = zeros(numTrials,winSize);
    
    for trial = 1:numTrials
        
        numSpikes = sum(spikes{trial});
        times = find(spikes{trial} == 1);
        avg = zeros(1,winSize);

        for i = 1:numSpikes
            interval = times(i)-winSize : times(i)-1;
            avg = avg + temps{trial}(interval)';
        end
    
        avg = avg./numSpikes;
        trialAvgs(trial,:) = avg;
        
    end
    
    sta = sum(trialAvgs,1);
    sta = sta./numTrials;
    figure()
    plot(sta)

end