function t_armijo = Line_Search(H,c,x )

%% Algorithm Parametes

alpha = 0.2;

beta = 0.5;

Maxiter = 100;

t = 10;



for k = 1: Maxiter
    
    
    grad_f = H * x + c;
    
    f_t = 0.5 * (x - t * grad_f)' * H * (x - t * grad_f) + ...
        c' * (x - t * grad_f);
    f_x = 0.5 * x' * H * x + c' * x;
    
    if f_t <= f_x - alpha * t * grad_f' * grad_f;
    
        t_armijo = t;
        break
    else
        
        t = beta * t;
    end
    
    
    
end




end

