function [x, t] = thomas_alg_loeser(a, b, c, rhs)

    n = length(a);

    % Vektoren vorher anlegen
    alpha = zeros(n, 1);
    gamma = zeros(n, 1);
    y = zeros(n, 1);
    x = zeros(n, 1);
    
    %Zeitmessung starten
    tic;

    %LR-Zerlegung
    alpha(1) = a(1);
    
    for i = 2:n
        gamma(i) = c(i-1) / alpha(i-1);
        alpha(i) = a(i) - gamma(i) * b(i-1);
    end
    
    %Vorwaertseinsetzen
    y(1) = rhs(1);
    for i = 2:n
        y(i) = rhs(i) - gamma(i) * y(i-1);
    end
    
    %Rueckwaertseinsetzen
    x(n) = y(n) / alpha(n);
    for i = n-1:-1:1
        x(i) = (y(i) - b(i) * x(i+1)) / alpha(i);
    end

    t = toc;
end