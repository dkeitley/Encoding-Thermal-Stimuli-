function J = costFunction(theta,X,y)

    m = length(y);
    J = 0;
    cost = 0;
    
    h = X*theta;
    cost =(h-y);
    cost = cost.^(2);
    cost = sum(cost,1);
    J = cost/(2*m);
    
end