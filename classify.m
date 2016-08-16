function grad = classify(spikes,temp,resting)

    [tvec,rate] = plotTuningCurve(spikes,temp);
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
    
    rate = (rate-mean(rate))/(max(rate)-min(rate));
    tvec = (tvec - mean(tvec))/(max(tvec)-min(tvec));
    m = size(rate,1);
    
    thresh_tvec = tvec(thresh_index:m);
    thresh_rate = rate(thresh_index:m);
    
    %what about if threshold classifier doesn't hold? 
    % adjust baseline for 8
    
    [amp,loc,~,prom] = findpeaks(thresh_rate,thresh_tvec);
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
      
    figure()
    plot(tvec,rate);
    hold on
    plot(thresh_tvec,thresh_rate);
    plot(peak_tvec(1),peak_rate(1),'*g')
    plot(peak_tvec,polyval(p,peak_tvec))
    

end