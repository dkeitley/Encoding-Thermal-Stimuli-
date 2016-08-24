% best 0.01

function [opt_theta,opt_cost] = model(spikes,temps,resting)

    A = true; 
    t = [];
    y = [];
    X = [];
    r0 = [];

    t = constructTraining(spikes,temps,resting,0.25);
    y = t(:,4);
    X = t(:,1:3);
   
    %theta - a, b, x0, L, k
    opt_theta = [0;0;0;0;0];
    opt_cost = Inf;

    for i = 1:75
        initial = [-10 + rand*20,-10 + rand*20,-10+ rand*20,-10+rand*20,-10+rand*20]';
        [theta,cost] = fminsearch(@(t)(costFunction(t,X,y)),initial);

        if(cost < opt_cost)
            opt_cost = cost;
            opt_theta = theta;
        end
    end

    disp('Theta found');
    norm_theta = theta/(sum(abs(theta)));

end