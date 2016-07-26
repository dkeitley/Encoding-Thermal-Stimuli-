function plotLinear(theta,spikes,temps,binSize)

        [p,dp] = getPoly(temps,3);
        [rate,tvec] = getRate(spikes,binSize);
        temp = polyval(p,tvec);
        dtemp = polyval(dp,tvec);
        y = rate;
        X = [temp,dtemp];
        figure()
        plot(tvec,y);
        hold on
        plot(tvec,X*theta);
        xlabel('Time (s)');
        ylabel('Firing Rate (spikes/s)');
        legend('Actual Firing rate','Predicted Firing Rate','Location','south');
end