function rate = calcRestingRate(rest_start,rest_end,raw_spikes,times)

    dt = 5*10^-5;
    spikes = zeros(size(raw_spikes));
    spikes(int64(times/dt)) = 1;
    numSpikes = sum(spikes(rest_start*100:rest_end*100));
    secs = (rest_end - rest_start)*5*10^-3;
    rate = numSpikes/secs;
    

end