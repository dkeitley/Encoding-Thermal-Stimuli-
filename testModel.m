function testModel(theta,spikes,temps,resting)
    m = size(spikes,2);
    
    for i = 1:m
        s = spikes{i};
        t = temps{i};
        r = resting{i};
        
        [p,dp,~] = getPoly(t,5);
        [rate,tvec] = getRate(s,0.25);
        rate = (rate-[ratemax(rate))/(max(rate));
        temp_vals = polyval(p,tvec);
        dtemp_vals = polyval(dp,tvec);
        
        linear = theta(1)*temp_vals + theta(2)*dtemp_vals;      
        predict = sigmoid(linear,theta(3),theta(4),theta(5));
        %predict = (predict-max(predict))/max(predict);

        %subplot(3,ceil(m/3),i)
        plot(tvec,rate);
        hold on
        plot(tvec,predict);
        title(strcat('Trial ',int2str(i)));
        
    end
end