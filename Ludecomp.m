function [x] = Ludecomp(a,b,n,tol)
    o = (1:n); % row vector
    s = (1:n); 
    x = (1:n)'; % x needed to solve, transpose row to colunm
    [a,er,o] = Decompose(a,n,tol,o,s);
    if er ~= -1
        %get ans x column vector
        [x] = Substitute(a,o,n,b);
    end
end