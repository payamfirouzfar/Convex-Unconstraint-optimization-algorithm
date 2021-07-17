clc, clear, clf

%% Building positive definite matrix H

n = 2;

H = rand(n);

H = H + H';

[V , D ] = eig(H);



%H = V * diag(1 + rand(n,1))*V';

H = [10 0; 0 1];
c = randn(n , 1);


eps = 1e-5;

x = 2 * randn(n , 1);

options = struct('Maxiter', 1000, 'tolerance' , eps, 'Initial_Condition', x);

tic
[xopt1, fval1, Iter1, X1  ] = NM(H, c, options );
toc

tic
[xopt2, fval2, Iter2, X2  ] = GM(H, c, options );
toc
%[xopt2 , fval2] = quadprog(H,c,[],[]);

f = @(x,y) [x y] * H * [x;y] + c' * [x;y];

ezcontour(f);
hold on

plot(x(1),x(2),'o')
hold on

plot(xopt1(1),xopt1(2),'*')
hold on

plot(X1(1,:),X1(2,:))
hold on
plot(X2(1,:),X2(2,:))


legend('contour of f(x)', 'initial condition', 'optimal solution', 'NM', 'GM')


