function J = costFunction(theta,X,y)

    m = length(y);
    J = 0;
    cost = 0;
    k = theta(6);
    a = theta(2);
    b = theta(3);
    x0 = theta(4);
    L = theta(5);
    r0 = theta(1);
    
    
    linear = X*theta(2:3);
    nonLinear = sigmoid(linear,x0,L,k);
    r = r0 + nonLinear;
    cost =(r-y);
    cost2 = cost.^(2);
    J = sum(cost2,1);
    J = J/(2*m);

    
end