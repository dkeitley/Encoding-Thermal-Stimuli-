function grad = classify(spikes,temp)

    [tvec,rate] = plotTuningCurve(spikes,temp);
    thresh_length = ceil(0.1*length(rate));
    indexes = find(rate > 0);
    consec = diff(indexes);
    q = indexes(min(strfind(consec',ones(1,thresh_length))))
    
    
    rate = (rate-mean(rate))/(max(rate)-min(rate));
    tvec = (tvec - mean(tvec))/(max(tvec)-min(tvec));
    m = size(rate,1);
    
    crop_tvec = tvec(q:m);
    crop_rate = rate(q:m);
    
    p = polyfit(crop_tvec,crop_rate,1);
    grad = polyder(p);
      
    
    figure()
    plot(tvec,rate);
    hold on
    plot(crop_tvec,crop_rate);
    plot(crop_tvec,polyval(p,crop_tvec))
    
 
    if(grad > 2)
        disp('Ramp')
    elseif( grad < -0.75)
        disp('Fall')
    else
        disp('Plateau')
    end
    




end