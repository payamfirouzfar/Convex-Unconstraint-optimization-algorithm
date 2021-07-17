%% Gradient Descent Method (GDM) for unconstrained convex QP problem
%
% Qp Func:        min 0.5 * x' * H * x + c' * x          H >= 0
%

function [xopt, fval, Iter , X] = GM(H,c,options)


%% Algorithm parameters

MaxIter = options.Maxiter;                  % Maximum number of iterations

x = options.Initial_Condition;              % Initial condition

eps = options.tolerance;                    % Stopping Ceriterion parameter


%t = 0.1;                                    % Step Length


%% Main Loop

for k = 1: MaxIter
    X(:,k) = x;
    
    t = Line_Search(H,c,x );
    nabla_f = H * x + c;
    
    x = x - t * nabla_f;
    
    
    if norm(nabla_f) <= eps
        
        
        xopt = x;
        
        fval = 0.5 * x' * H * x + c' * x;
        
        Iter = k;
        
        break
        
    elseif k == MaxIter
        
        error('Please increase number of iterations')
        
        
    end
    
    
    
    
    
    
    
    
end










end

