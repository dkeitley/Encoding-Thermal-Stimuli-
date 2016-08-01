function testModel(theta,spikes,temp,resting)

    [p,dp,~] = getPoly(temp,5);
    [rate,tvec] = getRate(spikes,0.25);
    linear = theta(1)*polyval(p,tvec) + theta(2)*polyval(dp,tvec);
    
%     figure()
%     plot(tvec,linear);
%     hold on
%     plot(tvec,rate);
%     title('Linearity');
%     hold off
%     
%     figure()
%     plot([-500:500],sigmoid([-500:500],theta(3),theta(4),theta(5)));
%     title('Non-linearity');
%     
    
    predict = resting + sigmoid(linear,theta(3),theta(4),theta(5));
 
    figure()
    plot(tvec,rate);
    hold on
    plot(tvec,predict);

end