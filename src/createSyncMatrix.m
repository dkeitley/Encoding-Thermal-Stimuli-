function [sync,t_vec] = createSyncMatrix(spikes)
    %crops spike trains to shortest ramp
    
    m = size(spikes);
    [smallest,indx] = min(cellfun('size',spikes,1));
    sync = zeros(smallest,m(2));
    
    for i = 1:m(2)
        sync(:,i) = spikes{i}(1:smallest);
    end
    dt = 5*10^-5;
    t_vec = 0:dt:(smallest-1)*dt;
    t_vec = t_vec';
end