function [a,b] = maximumLikelihood(stim,rate,dstim)

    b1 = sum(dstim.*rate) - (sum(stim.*rate)/sum(stim.^2))*(sum(dstim.*stim));
    b2 = (sum(dstim.*stim)^2)/(sum(stim.^2)) + sum(dstim.^2);
    b = b1/b2;
    
    a = (sum(stim.*rate) - b*sum(dstim.*stim))/(sum(stim.^2));


end