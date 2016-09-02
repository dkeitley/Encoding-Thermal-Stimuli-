function J = costFunction(theta,X,y)

    m = length(y);
    J = 0;
    cost = 0;
   
    a = theta(1);
    b = theta(2);
%     x0 = theta(3);
%     L = theta(4);
%     k = theta(5);
%     r0 = X(:,1);
    
    A = theta(3);
    B = theta(4);
    C = theta(5);
    K = theta(6);
    M = theta(7);
    Q = theta(8);
    
    linear = X(:,2:3)*theta(1:2);
    r = sigmoid(linear,A,B,C,K,M,Q);
    
    cost =(r-y);
    cost2 = cost.^(2);
    J = sum(cost2,1);
    J = J/(2*m);
    
end