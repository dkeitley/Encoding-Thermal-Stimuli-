function classify(spikes,temp,i)

    [tvec,rate] = plotTuningCurve(spikes,temp);
    thresh = find(rate > quantile(rate,0.75));
    q = min(thresh);
    
    rate = (rate-mean(rate))/(max(rate)-min(rate));
    tvec = (tvec - mean(tvec))/(max(tvec)-min(tvec));
    m = size(rate,1);
    
    crop_tvec = tvec(q:m);
    crop_rate = rate(q:m);
    
    p = polyfit(crop_tvec,crop_rate,1);
    grad = polyder(p)
      
    
    subplot(3,6,i)
    plot(tvec,rate);
    hold on
    plot(crop_tvec,crop_rate);
    plot(crop_tvec,polyval(p,crop_tvec))
    title(strcat('Trial ',int2str(i)));
    
 
    if(grad > 2)
        disp('Ramp')
    elseif( grad < -0.75)
        disp('Fall')
    else
        disp('Plateau')
    end
    




end