
% COMMENTS
% How would the optimum values be different if I optimised the linearity first
% then the nonlinearity?
% Maybe I shouldn't estimate the ramp with a smooth polynomial? Maybe the
% small changes affect the firing rate?
% Should possibly ignore trials 3 and 5, 6?
% Min found : 106.2683 (1 2 4 5 6 7 8 9)
% Swap A trial 5 for ramp at very beginning of recording
% Could add resting firing rate to model
  
[spikes_A,temps_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');

disp('Data Loaded');

% t = constructTraining(spikes_A([1 2 4 5 6 7 8 9]),temps_A([1 2 4 5 6 7 8 9]),0.25);
% y = t(:,3);
% X = t(:,1:2);
% 
% %theta - r0, a, b, x0, L, k
% opt_theta = [0;0;0;0;0;0];
% opt_cost = Inf;
% 
% for i = 1:50
%     initial = [0,-100 + rand*200,-100 + rand*200,-2000 + rand*4000, rand*100,-100 + rand*200]';
%     [theta,cost] = fminsearch(@(t)(costFunction(t,X,y)),initial,optimset('MaxFunEvals',5000,'MaxIter',5000));
% 
%     if(cost < opt_cost)
%         opt_cost = cost;
%         opt_theta = theta;
%     end
%     
% end
% 
% disp('Theta found');


%[a,b] = maximumLikelihood(X(:,1),y,X(:,2));
%N = findNonLinear(opt_theta,X,y,50);
%options = fitoptions('poly6','Lower',[0,0,0,0,0,0]);
%N2 = fit(N(:,1),N(:,2),'poly9');
