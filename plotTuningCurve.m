function plotTuningCurve(spikes,temps,i)

    m = size(spikes');
    numTrials = m(1);
    rate = [];
    
    for t = 20:60
        numSpikes = 0;
        totalDuration = 0;
        tempTrialNum = 0;
        
        for trial = 1:numTrials
           %find spikes times within 1 degree temp range
           [p,dp,tvec] = getPoly(temps{trial},5);
           temppoly = polyval(p,tvec);
           dtemppoly = polyval(dp,tvec);
           window = find((t-0.5 < temppoly) & (t + 0.5 >= temppoly));
           numSpikes = numSpikes + sum(spikes{trial}(window));
           duration = (max(window) - min(window))*(5*10^-5);
           if(isempty(duration) ~= 1)
               tempTrialNum = tempTrialNum + 1;
               totalDuration = totalDuration + duration; 
           end
        end
        
        if(tempTrialNum == 0 | numSpikes == 0)
            rate(t-19) = 0;
        else
            % Using average time between the degree change
            avgDuration = totalDuration/tempTrialNum;
            rate(t-19) = numSpikes/(tempTrialNum*avgDuration);  
        end
    end
    
    %figure()
    subplot(3,6,i)
    range = find(rate ~=0);
    rate = rate(1:range(end));
    size(rate)
    plot([20:size(rate,2)+19]',rate);
    title(strcat('Trial',int2str(i)));
%     xlabel('Temperature');
%     ylabel('Average Firing Rate (spikes/s)');


end