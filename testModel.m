function testModel(theta,spikes,temp,resting)

    [p,dp,~] = getPoly(temp,5);
    [rate,tvec] = getRate(spikes,0.2);
    temp_vals = polyval(p,tvec);
    norm_temp = (temp_vals - mean(temp_vals))/(max(temp_vals)-min(temp_vals));
    dtemp_vals = polyval(dp,tvec);
    norm_dtemp = (dtemp_vals - mean(dtemp_vals))/(max(dtemp_vals)-min(dtemp_vals));
    linear = theta(1)*norm_temp + theta(2)*norm_dtemp;
    
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