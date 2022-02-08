
%% 
% plot four times by different size of n
% 1-D plot
n = 10:30:100;
for i = 1:length(n)
    [A,b] = Diffusion_1_D(n(i),2);
    [resX] = Ludecomp(A,b,n(i),0.001);
    x = ((1:n(i))-1)*(1/(n(i)-1));
    figure(i);
    plot(x,resX');
    title(['1-D Diffusion Temperature with respect to x (n=' num2str(n(i)) ')']);
    xlabel("x");
    ylabel('T');
end

%% 
% plot four times by different size of n 10 20 30 40 50
n = 10:10:50;
for i = 1:length(n)
    [A,b] = Diffusion_2_D(n(i),2);
    [resX] = Ludecomp(A,b,n(i)*n(i),0.001);
    % T for countour
    T = zeros(n(i));
    for row = 1:n(i)
        for col = 1:n(i)
            idx = (row-1)*n(i) +col;
            T(row,col) = resX(idx);
        end
    end
    figure(i);
    contourf(T)
    colorbar
    title(['2-D Diffusion Temperature with respect to x (n=' num2str(n(i)) ')']);
    xlabel("x");
    ylabel('T');
end
% when n = 50, takes a long time to plot

%% 
