function testModel(theta,spikes,temp)

    [p,dp,~] = getPoly(temp,3);
    [rate,tvec] = getRate(spikes,0.25);
    linear = theta(2)*polyval(p,tvec) + theta(3)*polyval(dp,tvec);
    
%     figure()
%     plot(tvec,linear);
%     hold on
%     plot(tvec,rate);
%     title('Linearity');
%     hold off
    
%     figure()
%     plot([-500:500],sigmoid([-500:500],theta(4),theta(5),theta(6)));
%     title('Non-linearity');
    
    
    predict = theta(1) + sigmoid(linear,theta(4),theta(5),theta(6));
    spikeArray{1} = spikes;
    figure()
    plot(tvec,rate);
    hold on
    plot(tvec,predict);

end