function [] = test_sparse_alg()
    n = 10000;
    a = 2*ones(n,1);
    b = -1*ones(n-1,1);
    c = -1*ones(n-1,1);
    rhs = ones(n,1);
    
    A = diag(a) + diag(b, 1) + diag(c, -1);
    Asp = sparse(A);
    
    % Diagnose einschalten
    spparms('spumoni', 2);
    
    fprintf(' Sparse Matrix Lösung \n');
    x = Asp \ rhs;
    
    % Diagnose ausschalten
    spparms('spumoni', 0);
end 