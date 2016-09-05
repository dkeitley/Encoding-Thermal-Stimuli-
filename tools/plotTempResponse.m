% Plots the firing rate as a function of temperature by calculating the
% firing rate in every 1 degree bin. 

function [tvec,rate] = plotTempResponse(spike,temp)

    temps = {};
    spikes = {};
    if((iscell(spike) && iscell(temp)))
        temps = temp;
        spikes = spike;
    else
        temps{1} = temp;
        spikes{1} = spike;
    end

    numTrials = size(spikes',1);
    m = ceil(numTrials/6);
    figure()
    
     for trial = 1:numTrials
         [p,dp,tvec] = getPoly(temps{trial},5);
         temppoly = polyval(p,tvec);
         dtemppoly = polyval(dp,tvec);
         rate = [];
       
         for t = 20:60
             window = find((t-0.5 < temppoly) & (t + 0.5 >= temppoly));
             numSpikes = sum(spikes{trial}(window));
             duration = (max(window) - min(window))*(5*10^-5);
             if(isempty(duration) == 1)
                rate(t-19) = 0;
             else
                rate(t-19) = numSpikes/duration;
             end
         end
         if(numTrials > 1)
             subplot(m,6,trial)
         end
         range = find(rate ~=0);
         rate = rate(1:range(end))';
         tvec = [20:size(rate,1)+19]';
         plot(tvec,rate);
         title(strcat('Trial',int2str(trial)));

     end
end