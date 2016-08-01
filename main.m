
% COMMENTS
% Min found : 124.49
% Resting rate calculated as an average of spontaneous rates
  
[spikes_A,temps_A,resting_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C,resting_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');

disp('Data Loaded');

% t = constructTraining(spikes_C,temps_C,resting_C,0.25);
% y = t(:,4);
% X = t(:,2:3);
% r0 = t(:,1);
% 
% %theta - a, b, x0, L, k
% opt_theta = [0;0;0;0;0];
% opt_cost = Inf;
% 
% for i = 1:100
%     initial = [-100 + rand*200,-100 + rand*200,-200 + rand*400, rand*100,-100 + rand*200]';
%     [theta,cost] = fminsearch(@(t)(costFunction(t,X,y,r0)),initial,optimset('MaxFunEvals',5000,'MaxIter',5000));
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
