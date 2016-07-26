function s = sigmoid(x,x0,L,k)

    s = zeros(size(x));
    s = arrayfun(@(z) L/(1+exp(-k*(z-x0))),x);

end
    