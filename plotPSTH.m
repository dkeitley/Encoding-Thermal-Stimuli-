function rate = plotPSTH(spikes,binNum)
    
    numTrials = size(spikes',1);
    [syncMatrix,tvec] = createSyncMatrix(spikes);
    binSize = floor(size(tvec,1)/binNum);
    numSpikes = zeros(1,binNum);
    numSpikes_win = zeros(binNum,numTrials);
    
    for trial = 1:numTrials 
       for bin = 1:binNum 
           lower = (bin-1)*binSize + 1;
           upper = lower+binSize;
           window = [lower:upper];
           numSpikes_win(bin,trial) = sum(syncMatrix(window,trial));
           numSpikes(bin) = numSpikes(bin) + numSpikes_win(bin,trial);           
       end
    end
    
    binTime = binSize*5*10^-5;
    tvec2 = [binTime/2:binTime:max(tvec)-binTime/2];
    rate = numSpikes/(binTime*numTrials);
    
    %Compute Fano Factor
    fano_bin = floor(0.75*binNum);
    fano = (std(numSpikes_win(fano_bin,:))^2)/(mean(numSpikes_win(fano_bin,:)));
    disp(strcat('Fano Factor: ', num2str(fano)));
    
    figure()
    bar(tvec2,rate,'BarWidth',1);
    xlabel('Time (s)');
    ylabel('Average Firing Rate (spikes/s)');
    
end