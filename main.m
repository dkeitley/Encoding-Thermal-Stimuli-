
% COMMENTS
% Why isn't maximum likelihood solution optimum?
% How do I deal with non-negativity when making my nonlinear filter continuous?
% Feel like it's very difficult to model when the stimulus is very similar
% yet is producing very different repsonses. 
  
%  [spikes_A,temps_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
%  [spikes_C,temps_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');


t = constructTraining(spikes_A([1,2,4,6,7,8,9]),temps_A([1,2,4,6,7,8,9]),0.25);
y = t(:,3);
X = t(:,1:2);
opt_theta = [0;0];
opt_cost = Inf;

for i = 1:20
    initial = normrnd([0;0],100);
    [theta,cost] = fminsearch(@(t)(abs(costFunction(t,X,y))),initial,optimset('MaxFunEvals',2000));
    if(cost < opt_cost)
        opt_cost = cost;
        opt_theta = theta;
    end
end

[a,b] = maximumLikelihood(X(:,1),y,X(:,2));
disp('Theta found');
N = findNonLinear(opt_theta,X,y,50);
options = fitoptions('poly6','Lower',[0,0,0,0,0,0]);
N2 = fit(N(:,1),N(:,2),'poly9');
