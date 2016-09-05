% Minimises costFunction to give optimum parameter values for the training
% data. 

% theta takes the form a,b,x0,L,k where x0,L,k are sigmoid parameters and
% a,b are coefficients of the temperature and its derivative respecitvely. 

function [opt_theta,opt_cost] = model(spikes,temps,resting)
    
    t = constructTraining(spikes,temps,resting);
    y = t(:,4);
    X = t(:,1:3);
   
    %theta - a, b, x0, L, k
    % theta: a,b,A,B,C,K,M,Q
    opt_theta = [0;0;0;0;0;0;0;0];
    opt_cost = Inf;

    for i = 1:75
        initial = [-10 + rand*20,-10 + rand*20,-2+ rand*2,-3+rand*3,-6+rand*3,-6+rand*3,-50+rand*15,-5+rand*3]';
        [theta,cost] = fminsearch(@(t)(costFunction(t,X,y)),initial);

        if(cost < opt_cost)
            opt_cost = cost;
            opt_theta = theta;
        end
    end

    disp('Theta found');
    norm_theta = theta/(sum(abs(theta)));

end