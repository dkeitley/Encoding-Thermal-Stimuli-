function testModel(theta,nonLinear,spikes,temp)

    predict = nonLinear(polyval(theta,temp));
    spikeArray{1} = spikes;
    r = plotPSTH(spikeArray,50);
    hold on
    plot([0:size(predict,1)-1]*5*10^-5,predict);

end