% Vorgegebene Matrix
a = [2, 7, -1, 8]';
b = [-1, 6, 2]';
c = [-3, 1, 4]';
rhs = [3, 1, -1, -8]';

% Unsere Anwendung
tic;
[x, t] = thomas_alg_loeser(a, b, c, rhs);
tuns = toc;


% Backslash Operator
A = diag(a) + diag(b, 1) + diag(c, -1);
tic;
x_backslash = A \ rhs;
tback = toc;

disp('Thomas:'); disp(x);
disp('Backslash:'); disp(x_backslash);
disp('Thomas Zeit'); disp(tuns);
disp('Backslash Zeit'); disp(tback);