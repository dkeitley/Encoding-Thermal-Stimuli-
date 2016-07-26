function J = costFunction(theta,X,y)

    m = length(y);
    J = 0;
    cost = 0;
    
    linear = X*theta(2:3);
    nonLinear = theta(1) + sigmoid(linear,theta(4),theta(5),theta(6));
    cost =(nonLinear-y);
    cost = cost.^(2);
    cost = sum(cost,1);
    J = cost/(2*m);
    
end