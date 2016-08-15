function J = costFunction(theta,X,y)

    m = length(y);
    J = 0;
    cost = 0;
    L = theta(4);
    a = theta(1);
    b = theta(2);
    x0 = theta(3);
    k = theta(5);
    r0 = X(:,1);
    
    linear = X(:,2:3)*theta(1:2);
    r = r0 + sigmoid(linear,x0,L,k);
    cost =(r-y);
    cost2 = cost.^(2);
    J = sum(cost2,1);
    J = J/(2*m);
    
end