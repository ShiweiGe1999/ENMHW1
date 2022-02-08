function [A,b] = Diffusion_2_D(n, alpha)
    %construct identity matrix size of n * n
    A = eye(n*n);
    h = 1/(n-1);
    b = zeros(n*n,1);
    deno = 1/(h^2);
    for i = 1:n
        for j = 1:n
            idx = (i-1)*n + j;
            if i == 1 || i == n || j == 1 || j ==n
                %boundary
                b(idx) = 0;
            else
                b(idx) = -alpha;
                A(idx,idx) = -4 * deno;
                A(idx,idx-1) = 1 * deno;
                A(idx, idx+1) = 1 * deno;
                A(idx,idx-n) = 1 * deno;
                A(idx, idx+n) = 1 * deno;
            end
        end
    end

end