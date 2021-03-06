% parses Spike2 exported Matlab files and finds relevant channels

function [fileData,spikes,temp] = parseFile(num,txt,fileNum)

        dt = 5*10^-5;
        fileName = char(txt(fileNum+1,1));
        disp(fileName);
        raw = load(fileName);
        structNames = fieldnames(raw);
        fileData = num(fileNum,:);
        
        channel = regexp(structNames,'Ch3$');
        dh = raw.(char(structNames(find(~cellfun(@isempty,channel))))).values();
        channel = regexp(structNames,'Ch1$');
        temp = raw.(char(structNames(find(~cellfun(@isempty,channel))))).values();
        channel = regexp(structNames,strcat('Ch',int2str(fileData(1)),'$'));
        times = raw.(char(structNames(find(~cellfun(@isempty,channel))))).times();
        
        spikes = zeros(size(dh));
        spikes(int64(times/dt))=1; 
      
end
