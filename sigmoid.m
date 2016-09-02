function s = sigmoid(x,A,B,C,K,M,Q)

    s = zeros(size(x));
    %s = arrayfun(@(z) L/(1+exp(-k*(z-x0))),x);
    s = arrayfun(@(z)A + ((K-A)/(C + Q*exp(-B*(z-M)))),x);

end
    