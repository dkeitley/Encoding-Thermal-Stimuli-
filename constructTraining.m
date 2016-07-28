function training = constructTraining(spikes,temps,binSize)
    % binSize given in seconds
    
    training = [];
    for i = 1:size(spikes,2)
        [p,dp,~] = getPoly(temps{i},5);
        [rate,tvec] = getRate(spikes{i},binSize);
        temp = polyval(p,tvec);
        dtemp = polyval(dp,tvec);
        training = [training;[temp,dtemp,rate]];
    end
    
end
