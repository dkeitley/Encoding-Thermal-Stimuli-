function [rise,fall,plat] = classify(spikes,temps,resting,centroids)

    m = size(spikes,2);
    grad = [];

    k = 1;
    for i = 1:m
       g = peakGradient(spikes{i},temps{i},resting{i});
       if(~isempty(g))
           grad(k,:) = [i,g];
           k = k + 1;
       else
           continue;
       end
    end

    idx = knnsearch(centroids',grad(:,2));
    rise = grad(find(idx == 1),1);
    fall = grad(find(idx == 2),1);
    plat = grad(find(idx == 3),1);

end