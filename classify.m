function [rise,fall,plat]  = classify(spikes,temps,resting)

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
    
    [idx,~] = kmeans(grad(:,2),3,'Replicates',10);
    
    class{1} = find(idx == 1);
    mean1 = mean(grad(class{1},2));
    class{2} = find(idx == 2);
    mean2 = mean(grad(class{2},2));
    class{3} = find(idx == 3);
    mean3 = mean(grad(class{3},2));
    
    [~,imx] = max([mean1,mean2,mean3]);
    rise = grad(class{imx},1);
    [~,imn] = min([mean1,mean2,mean3]);
    fall = grad(class{imn},1);
    imd = setdiff([1,2,3],[imx,imn]);
    plat = grad(class{imd},1);
    
    
end