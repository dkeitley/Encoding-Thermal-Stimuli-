
% COMMENTS
   % Exp 27 unit 1 data has more of a lower threshold, the upper threshold
   % How can I upsample when DH has more than 100* TEMP? 


    spikes = [];

    [num,txt] = xlsread('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
    numFiles = size(num);
    numFiles = numFiles(1);
    k = 1;

    for i = 1:numFiles
        raw = load(char(txt(i+1,1)));
        structNames = fieldnames(raw);
        data = num(i,:);
        spike_thresh = data(1);
        
        channel = regexp(structNames,'Ch3$');
        DH = raw.(char(structNames(find(~cellfun(@isempty,channel))))).values();
        channel = regexp(structNames,'Ch1$');
        TEMP = raw.(char(structNames(find(~cellfun(@isempty,channel))))).values();
        for j = 1:2:data(2)*2
            ramp_start = data(2+j);
            ramp_end = data(2+j+1);
            
            cropTEMP = TEMP(ramp_start:ramp_end,1);
            cropDH = DH(ramp_start*100:ramp_end*100,1);
            
            spikes{k} = cropDH;
            temps{k} = cropTEMP;
            k = k + 1;
%             plot(cropTEMP)
%             hold on
            
            threshDH = cropDH;
            threshDH(threshDH > spike_thresh) = 1;
            threshDH(threshDH <  spike_thresh) = 0;
            
           % spikes = [spikes, threshDH(1:150001)];
            
%             figure()
%             plot(cropDH);
%             hold on
%             plot(threshDH);
%             hold off
            
            
        end
    end
        
    


