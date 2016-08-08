function J = costFunction(theta,X,y,r0)

    m = length(y);
    J = 0;
    cost = 0;
    k = theta(5);
    a = theta(1);
    b = theta(2);
    x0 = theta(3);
    L = theta(4);
    
    linear = X(:,1:2)*theta(1:2);
    nonLinear = sigmoid(linear,x0,L,k);
    r = r0 + nonLinear;
    cost =(r-y);
    cost2 = cost.^(2);
    J = sum(cost2,1);
    J = J/(2*m);

    
end