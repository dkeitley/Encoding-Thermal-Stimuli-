
%binSize given in seconds
% constructs a matrix with columns as feature values
function training = constructTraining(spikes,temps,resting,binSize)
    
    training = [];
    for i = 1:size(spikes,2)
        [p,dp,~] = getPoly(temps{i},5);
        [rate,tvec] = getRate(spikes{i},binSize);
        rate = (rate-max(rate))/(max(rate));
        temp = polyval(p,tvec);
        %temp = (temp - min(temp))/(max(temp)-min(temp));
        dtemp = polyval(dp,tvec);
        %dtemp = (dtemp - min(dtemp))/(max(dtemp)-min(dtemp));
        
        training = [training;[ones(size(tvec))*resting{i},temp,dtemp,rate]];
    end
    
end
