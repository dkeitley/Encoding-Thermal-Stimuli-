function [rate,tvec] = getRate(spikes,binSize)
     %bin size given in seconds
     m = size(spikes,1);
     binSize2 = floor(binSize/(5*10^-5));
     rate = zeros(floor(m/binSize2),1);
     numBins = floor(m/binSize2);
     
     for bin = 1:numBins
           lower = (bin-1)*binSize2 + 1;
           upper = lower+binSize2;
           window = [lower:upper]';
           numSpikes = sum(spikes(window),1);
           rate(bin) = numSpikes/binSize;
     end
     tvec = [binSize/2:binSize:binSize*numBins - binSize/2]';
     


end