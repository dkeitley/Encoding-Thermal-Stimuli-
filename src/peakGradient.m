% Finds an estimate for the gradient of the firing rate after its peak 
% following threshold. 

% Threshold is defined as the point for which the firing rate maintains above
% the resting firing rate for more than 10% of the trial duration. 

% Each peak is identified by having the largest prominence of peaks 
% returned by the Matlab findpeaks function*. Peaks for which lie within 
% the last 10% of the trial duration are disregarded. This ensures there is
% sufficient data to characterise between rise, fall and plateau
% repsponses.

% * see here for more information on prominence.
% http://uk.mathworks.com/help/signal/ref/findpeaks.html#buff2uu

function grad = peakGradient(spikes,temp,resting)

    [tvec,rate] = plotTempResponse(spikes,temp);
    l = length(rate);
    
    thresh_length = ceil(0.1*l);
    indexes = find(rate > resting);
    consec = diff(indexes);
    q = indexes(min(strfind(consec',ones(1,thresh_length))));
    
    if(isempty(q))
        grad = [];
        disp('Error: No threshold temperature found.')
        return ;
    end
    thresh_index = q-1;
    
    rate = (rate-max(rate))/(max(rate));
    m = size(rate,1);
    
    thresh_tvec = tvec(thresh_index:m);
    thresh_rate = rate(thresh_index:m);

    [~,loc,~,prom] = findpeaks(thresh_rate,thresh_tvec);
    
    peak_index = Inf;
    while(peak_index >= ceil(0.9*l))
        if(isempty(prom))
            peak_index = thresh_index;
            break;
        else
            [maxp,ind] = max(prom);
            prom = prom(prom ~= maxp);
            peak_index = find(tvec == loc(ind));
        end
    end
            
    peak_rate = rate(peak_index:end);
    peak_tvec = tvec(peak_index:end);

    p = polyfit(peak_tvec,peak_rate,1);
    grad = polyder(p);
      
%     figure()
%     plot(tvec,rate,'k');
%     hold on
%     plot(thresh_tvec,thresh_rate,'b');
%     plot(peak_tvec(1),peak_rate(1),'*g')
%     plot(peak_tvec,polyval(p,peak_tvec),'r')
%    

end