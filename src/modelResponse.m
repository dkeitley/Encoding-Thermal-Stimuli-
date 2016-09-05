% Uses the generateSpikes function to generate model spike times from the
% predicted firing rate calculated from model parameters. 

function S = modelResponse(theta,spikes,temp)

    binSize = 0.25; 
    dt = 5*10^-5;
    
    [p,dp,~] = getPoly(temp,5);
    [rate,tvec] = getRate(spikes,binSize);
    rate_norm = (rate-max(rate))/(max(rate));
    
    temp_vals = polyval(p,tvec);
    dtemp_vals = polyval(dp,tvec);
    
    linear = theta(1)*temp_vals + theta(2)*dtemp_vals;
    predict_norm = sigmoid(linear,theta(3),theta(4),theta(5),theta(6),theta(7),theta(8));
    predict_abs = predict_norm*max(rate) + max(rate);
    
    p = polyfit(tvec,predict_abs,7);
    S = generateSpikes(p,max(predict_abs),max(tvec));

    tvec = [1:length(spikes)]'*dt;
    times = tvec(find(spikes == 1));

%     figure()
%     subplot(2,1,1)
%     plot(times,ones(size(times)),'+');
%     title('Data')
%     axis([0,max(tvec),0.9,1.1])
%     subplot(2,1,2)
%     plot(S,ones(size(S)),'+r')
%     title('Model')
%     axis([0,max(tvec),0.9,1.1])

end