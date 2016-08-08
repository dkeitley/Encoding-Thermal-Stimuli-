
% COMMENTS
% Group A1: 4,5,6,16,17
% Group A2: 7,8,9,10,11,12
% Exp 18 first ramp definitely slow?
  
[spikes_A,temps_A,resting_A] = getData('/home/daniel/Encoding Thermal Stimuli/A fibre ramp positions.xlsx');
[spikes_C,temps_C,resting_C] = getData('/home/daniel/Encoding Thermal Stimuli/C fibre ramp positions.xlsx');

disp('Data Loaded');

A = true; 
t = [];
y = [];
X = [];
r0 = [];

if(A)
    t = constructTraining(spikes_A([7,8,9,10,11,12]),temps_A([7,8,9,10,11,12]),resting_A([7,8,9,10,11,12]),0.2);
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

