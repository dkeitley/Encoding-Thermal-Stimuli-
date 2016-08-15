function opt_theta = model(spikes_A,temps_A,spikes_C,temps_C)

    A = true; 
    t = [];
    y = [];
    X = [];
    r0 = [];

    group = [1,2,3,10,11,12];

    if(A)
        t = constructTraining(spikes_A(group),temps_A(group),resting_A(group),0.2);
        y = t(:,4);
        X = t(:,1:3);
    else
        t = constructTraining(spikes_C([1,3,5,16,2,4]),temps_C([1,3,5,16,2,4]),resting_C([1,3,5,16,2,4]),0.25);
        y = t(:,4);
        X = t(:,1:3);
    end

    %theta - a, b, x0, L, k
    opt_theta = [0;0;0;0;0];
    opt_cost = Inf;

    for i = 1:75
        initial = [-1 + rand*2,-1 + rand*2,-1+ rand*2,-1+rand*2,-1+rand*2]';
        [theta,cost] = fminsearch(@(t)(costFunction(t,X,y)),initial,optimset('MaxFunEvals',5000,'MaxIter',5000));

        if(cost < opt_cost)
            opt_cost = cost;
            opt_theta = theta;
        end
    end

    disp('Theta found');
    norm_theta = theta/(sum(abs(theta)));



end