function [spikes,temps,resting] = getData(fileName)

    [num,txt] = xlsread(fileName);
    numFiles = size(num,1);
    k = 1;

    for i = 1:numFiles
        [fileData,raw_spikes,raw_temp] = parseFile(num,txt,i);
        rampNum = fileData(3);
        resting_rate = fileData(2);
        
        for j = 1:2:rampNum*2
            ramp_start = fileData(3+j);
            ramp_end = fileData(3+j+1);
            
            upTemp = interp(raw_temp,100);
            
            cropTemp = upTemp(ramp_start*100:ramp_end*100,1);
            cropSpikes = raw_spikes(ramp_start*100:ramp_end*100,1);
            
            temps{k} = cropTemp;
            spikes{k} = cropSpikes;
            resting{k} = resting_rate;
            k = k + 1;
        end
    end


end