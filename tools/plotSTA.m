% Plots the spike triggered average of length winSize for a given spike
% train and stimulus vector. The winSize is given in seconds. 

function plotSTA(spikes,temps,winSize)

    numTrials = size(spikes,2);
    dt = 5*10^-5;
    winSize = int32(winSize/dt);
    trialAvgs = zeros(numTrials,winSize);
    
    for trial = 1:numTrials
        
        numSpikes = sum(spikes{trial});
        times = find(spikes{trial} == 1);
        avg = zeros(1,winSize);
        numSpikes2 = numSpikes;
        
        for i = 1:numSpikes
            if(times(i) < winSize)
                numSpikes2 = numSpikes2 - 1;
                continue;
            else
                interval = times(i)-winSize : times(i)-1;
                avg = avg + temps{trial}(interval)';
            end
        end
    
        avg = avg./numSpikes2;
        trialAvgs(trial,:) = avg;
        
    end
    
    sta = sum(trialAvgs,1);
    sta = sta./numTrials;
    figure()
    plot(sta)

end
