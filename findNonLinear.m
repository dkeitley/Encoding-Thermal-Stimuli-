function N = findNonLinear(theta,X,y,numBins)
    % finds time bins which produce similar generator value
    genVals = polyval(theta,X(:,1));
    maxGen = max(genVals);
    minGen = min(genVals);
    binSize = (maxGen-minGen)/numBins;
    N = zeros(numBins,2);
    i = 1;
    for gen = minGen:binSize:maxGen
        indxs = find(gen <= genVals & genVals < gen+binSize);
        rates = y(indxs);
        if(isempty(indxs))
            N(i,:) = [gen + (binSize/2),0];
        else
            N(i,:) = [gen+(binSize/2),mean(rates)];
        end
        i = i + 1;
    end
    N = [N(:,1),smooth(N(:,2),10)];
end