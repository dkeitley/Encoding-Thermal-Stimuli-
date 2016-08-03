
% COMMENTS
% Min found A: 122.8290
% norm theta A: 0.4009   -0.0051    0.3689   -0.0817    0.3170

% Min found B: 59.4609
% norm theta B: 0.3568    0.4610   -0.0039    0.0423    0.1438

% Look at similarlities between cells. Are they grouped?
% Normalise the parameters - does the derivative have much effect? 
% Exp 18 first ramp definitely slow?
  
% [spikes_A,temps_A,resting_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
% [spikes_C,temps_C,resting_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');

disp('Data Loaded');

A = true; 
t = [];
y = [];
X = [];
r0 = [];

if(A)
    t = constructTraining(spikes_A([4,5,6,16,17]),temps_A([4,5,6,16,17]),resting_A([4,5,6,16,17]),0.25);
    y = t(:,4);
    X = t(:,2:3);
    r0 = t(:,1);
else
    t = constructTraining(spikes_C([1,3,5,16,2,4]),temps_C([1,3,5,16,2,4]),resting_C([1,3,5,16,2,4]),0.25);
    y = t(:,4);
    X = t(:,2:3);
    r0 = t(:,1);
end

%theta - a, b, x0, L, k
opt_theta = [0;0;0;0;0];
opt_cost = Inf;

for i = 1:100
    initial = [-100 + rand*200,-100 + rand*200,-200 + rand*400, rand*100,-100 + rand*200]';
    [theta,cost] = fminsearch(@(t)(costFunction(t,X,y,r0)),initial,optimset('MaxFunEvals',10000,'MaxIter',10000));

    if(cost < opt_cost)
        opt_cost = cost;
        opt_theta = theta;
    end
    
end

disp('Theta found');
norm_theta = theta/(sum(abs(theta)));

%[a,b] = maximumLikelihood(X(:,1),y,X(:,2));
%N = findNonLinear(opt_theta,X,y,50);
%options = fitoptions('poly6','Lower',[0,0,0,0,0,0]);
%N2 = fit(N(:,1),N(:,2),'poly9');
