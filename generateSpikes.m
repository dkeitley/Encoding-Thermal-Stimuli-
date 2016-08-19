function S = generateSpikes(rate_poly,lambda,T)

    t = 0;
    n = 0;
    t = -log(rand)/lambda; 
    
    while(t<T)
        if(rand < polyval(rate_poly,t)/lambda)
            n = n+1;
            S(n) = t;
        end
        %exponential inverse transform
        t = t - log(rand)/lambda;
    end
    S = S';
end