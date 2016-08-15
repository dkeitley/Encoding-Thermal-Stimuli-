function testModel(theta,spikes,temps,resting)
    m = size(spikes,2);
    
    for i = 1:m
        s = spikes{i};
        t = temps{i};
        r = resting{i};
        [p,dp,~] = getPoly(t,5);
        [rate,tvec] = getRate(s,0.25);
        rate = (rate-min(rate))/(max(rate)-min(rate));
        temp_vals = polyval(p,tvec);
        %norm_temp = (temp_vals - min(temp_vals))/(max(temp_vals)-min(temp_vals));
        dtemp_vals = polyval(dp,tvec);
        %norm_dtemp = (dtemp_vals - min(dtemp_vals))/(max(dtemp_vals)-min(dtemp_vals));
        linear = theta(1)*temp_vals + theta(2)*dtemp_vals;

%         figure()
%         plot([-500:500],sigmoid([-500:500],theta(3),theta(4),theta(5)));
%         title('Non-linearity');
      

        predict = r+sigmoid(linear,theta(3),theta(4),theta(5));

        %subplot(3,ceil(m/3),i)
        plot(tvec,rate);
        hold on
        plot(tvec,predict);
        title(strcat('Trial ',int2str(i)));
        
    end
end