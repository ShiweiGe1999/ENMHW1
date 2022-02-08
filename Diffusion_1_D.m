function [A,b] = Diffusion_1_D(n,alpha)
     %construct identity matrix size of n * n
    A = eye(n);
    h = 1/(n-1);
    b = zeros(n,1);
    deno = 1/(h^2);
    for i = 1:n
        idx = i;
        if i == 1 || i == n 
            %boundary
            b(idx) = 0;
        else
            b(idx) = -alpha;
            A(idx,idx) = -2 * deno;
            A(idx,idx-1) = 1 * deno;
            A(idx, idx+1) = 1 * deno;
        end
    end
end