% Generalised logistic function. 

function s = sigmoid(x,A,B,C,K,M,Q)

    s = zeros(size(x));
    s = arrayfun(@(z)A + ((K-A)/(C + Q*exp(-B*(z-M)))),x);

end
    