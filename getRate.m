
%binSize given in seconds
% calculates rate in each binSize
function [rate,tvec] = getRate(spikes,binSize)
    
     dt = 5*10^-5;
     m = size(spikes,1);
     binSize_sample = floor(binSize/(dt));
     rate = zeros(floor(m/binSize_sample),1);
     numBins = floor(m/binSize_sample);
     
     for bin = 1:numBins
           lower = (bin-1)*binSize_sample + 1;
           upper = lower+binSize_sample;
           window = [lower:upper]';
           numSpikes = sum(spikes(window),1);
           rate(bin) = numSpikes/binSize;
     end
     tvec = [binSize/2:binSize:binSize*numBins - binSize/2]';
     
end