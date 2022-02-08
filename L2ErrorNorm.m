function [err] = L2ErrorNorm(n,alpha)
    % h_1 is the resolution of grid of size
    h_1 = 1/(n-1);
    % h_2 is half resolution of h_1
    h_2 = 1/(2*n-2);
    % n_2 is the nodes that h_2 has
    n_2 = 2*n-1;
    [A_1, b_1] = Diffusion_2_D(n,alpha);
    [A_2, b_2] = Diffusion_2_D(n_2, alpha);
    T_1 = zeros(n); %    2-D distribution for original
    T_2 = zeros(n_2); %     2-D distribution for transformation
    X_1 = Ludecomp(A_1,b_1,n*n,0.001);
    X_2 = Ludecomp(A_2,b_2,n_2*n_2,0.001);
    for i = 1:n
        for j = 1:n
            idx = n*(i-1) + j;
            T_1(i,j) = X_1(idx);
        end
    end
    for i = 1:n_2
        for j = 1:n_2
            idx = n_2*(i-1) + j;
            T_2(i,j) = X_2(idx);
        end
    end
    err = 0;
    for i = 1:n
        for j = 1:n
            %get the x y coordinates
            x = (i-1) * h_1;
            y =  (j-1) * h_1;
            row_2 = round((x/h_2)) + 1;
            col_2 = round((y/h_2)) + 1;
            err = err+ (T_1(i,j) - T_2(row_2,col_2))^2;
        end
    end
    err = sqrt(err/(n*n));
end