
% COMMENTS
% having difficulties classifying with C trials 2 and 9. Maybe the resting
% rate needs to be adjusted? 
% sigmoid produces non-negative firing rate but normalisation makes firing
% rate negative. Need to fix. 

  
[spikes_A,temps_A,resting_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C,resting_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');
disp('Data Loaded');

% m = size(spikes_A,2);
% grad_A = [];
% 
% n = size(spikes_C,2);
% grad_C = [];
% 
% k = 1;
% for i = 1:m
%    g = classify(spikes_A{i},temps_A{i},resting_A{i});
%    if(~isempty(g))
%        grad_A(k,:) = [i,g];
%        k = k + 1;
%    else
%        continue;
%    end
% end
% 
% k = 1;
% for j = 1:n
%    g = classify(spikes_C{j},temps_C{j},resting_C{j});
%    if(~isempty(g))
%        grad_C(k,:) = [j,g];
%        k = k + 1;
%    else
%        continue;
%    end
% end
