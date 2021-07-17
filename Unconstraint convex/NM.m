%% Newton's method for unconstrained convex QP problem
%
%     min 0.5 * x' * H * x + c' * x
%
function [xopt, fval, Iter, X  ] = NM(H, c, options )

%% Algorithm Parameters

MaxIter = options.Maxiter;  

x = options.Initial_Condition;

eps = options.tolerance;

%t = 0.1;


%% Main Loop

for k = 1: MaxIter
    
    X(:,k) = x;
    
    t = Line_Search(H,c,x);
    nabla_f = H * x + c;
    
    P = -H\nabla_f;
     
    %P =  - inv(H) * nabla_f;
    x = x + t * P;
    
    
    if norm(nabla_f) <= eps
        
        
        xopt = x;
        
        fval = 0.5 * x' * H * x + c' * x;
        
        Iter = k;
        
               
        break
        
    elseif k == MaxIter
        
        error('Please increase the number of iterations')
        
    end
    
    
    
    
    
end



end

