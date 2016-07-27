
% COMMENTS
% Is a sigmoid nonlinearity too simplistic?
% How can I determine optimum initial values for the regression? 
% How would the optimum values be different if I optimised the linearity first
% then the nonlinearity?
% Maybe I shouldn't estimate the ramp with a smooth polynomial? Maybe the
% small changes affect the firing rate?
% Should change initial values to uniform distribution.
% Need to thoroughly read into Matlab optimisation functions. 
% Should possibly ignore trials 3 and 5, 6?
  
%[spikes_A,temps_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
%[spikes_C,temps_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');

disp('Data Loaded');

t = constructTraining(spikes_A([1 2 4 7 8 9]),temps_A([1 2 4 7 8 9]),0.25);
y = t(:,3);
X = t(:,1:2);
%theta - r0, a, b, x0, L, k
opt_theta = [0;0;0;0;0;0];
opt_cost = Inf;

for i = 1:100
    initial = [rand*50,rand*100,rand*100,rand*1000,rand*80,rand*20]';
    [theta,cost] = fminsearch(@(t)(abs(costFunction(t,X,y))),initial);
    if(cost < opt_cost)
        opt_cost = cost;
        opt_theta = theta;
    end
end

disp('Theta found');


%[a,b] = maximumLikelihood(X(:,1),y,X(:,2));
%N = findNonLinear(opt_theta,X,y,50);
%options = fitoptions('poly6','Lower',[0,0,0,0,0,0]);
%N2 = fit(N(:,1),N(:,2),'poly9');
