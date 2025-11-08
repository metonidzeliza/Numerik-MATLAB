function [] = Aufgabe_5_d(imax)


n_values = zeros(imax,1);
times = zeros(imax,1);
flops_per_second = zeros(imax,1);

for i = 1:imax
    n = 2^i;
    
    a = 2*ones(n,1);       
    b = -1*ones(n-1,1);    
    c = -1*ones(n-1,1);  
    rhs = ones(n,1); 
    
    A = diag(a) + diag(b(1:n-1), 1) + diag(c(1:n-1), -1);
    Asp = sparse(A);

    tic;
    x_mldivide = A \ rhs;
    t_mldivide(i) = toc;


    tic;
    xsp_mldivide = Asp \ rhs;
    tsp_mldivide(i) = toc;

    n_values(i) = n;
end


figure;
plot(n_values, t_mldivide, '-o', 'DisplayName','Volle Matrix');
hold on;
plot(n_values, tsp_mldivide, '-o', 'DisplayName','Dünnbesetzte Matrix');
hold off;
legend('show', 'Location', 'northwest');
xlabel('Systemgröße n');
ylabel('Laufzeit [s]');
title('Laufzeit des Thomas-Algorithmus in Abhängigkeit von n');
grid on;


fprintf('MATLAB mldivide Zeit normal: %.6f s\n', t_mldivide);
fprintf('MATLAB mldivide Zeit sparse: %.6f s\n', tsp_mldivide);






























end