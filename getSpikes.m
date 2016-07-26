function spikes = getSpikes(train,thresh)

spikes = train;
spikes(spikes >= thresh) = 1;
spikes(spikes < thresh) = 0;



end