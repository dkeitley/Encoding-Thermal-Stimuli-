function [spikes,temps] = getData(fileName)

    [num,txt] = xlsread(fileName);
    numFiles = size(num);
    numFiles = numFiles(1);
    k = 1;

    for i = 1:numFiles
        [fileData,raw_spikes,raw_temp] = parseFile(num,txt,i);
        rampNum = fileData(2);
        
        for j = 1:2:rampNum*2
            ramp_start = fileData(2+j);
            ramp_end = fileData(2+j+1);
            
            upTemp = interp(raw_temp,100);
            
            cropTemp = upTemp(ramp_start*100:ramp_end*100,1);
            cropSpikes = raw_spikes(ramp_start*100:ramp_end*100,1);
            
            temps{k} = cropTemp;
            spikes{k} = cropSpikes;
            k = k + 1;
        end
    end


end