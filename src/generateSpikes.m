% Implementation of the acceptance-rejection method for generating events
% driven by an inhomogeneous Poisson process. 

function S = generateSpikes(rate_poly,lambda,T)
    n = 0;
    t = -log(rand)/lambda; 
    
    while(t<T)
        if(rand < polyval(rate_poly,t)/lambda)
            n = n+1;
            S(n) = t;
        end
        t = t - log(rand)/lambda;
    end
    S = S';
end