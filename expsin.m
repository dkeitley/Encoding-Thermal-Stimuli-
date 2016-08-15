function x =  expsin(t,u,k,K,p,q,w)
    
    alpha = u(t)*k*(1-p*(t))*exp(-p*(t));
    beta = u(t)*(w/(sqrt(1-q^2)))*exp(q*w*(t))*sin(w-sqrt(1-q^2)*(t));
    
    
    x = K*(alpha+beta);
    
    
    
    
    
    
    
    
    
    
    
    
    






end