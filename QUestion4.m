% 1-D performance measure
% as mentioned in the problem 3, once n is above 50, 2-D is going to take
% longtime, so we will start by 10:50, interval by 5;
% but for 1-D case we can have relavant large grid size
n = 10:100:1000;
% Matlab back slash method time column vector
t_1 = zeros(length(n),1);
% My own LU method time column vector
t_2 = zeros(length(n),1);
% iteration on each n
for i = 1:length(n)
    % start with 1-D case
    % interval method measure
    [A,b] = Diffusion_1_D(n(i),2);
    counter = 0;
    % to make the measure more accurate, we let it solve 3 times and take
    % the average
    for j = 1:3
        tic
        x = A\b;
        counter = counter + toc;
    end
    t_1(i) = counter/3;

    % my own LU method measure
    counter = 0;
    for k = 1:3
        tic
        x = Ludecomp(A,b,n(i),0.001);
        counter = counter + toc;
    end
    t_2(i) = counter / 3;
end

% power law scale
n = log10(n);
t_1 = (log10(t_1))';    % Row vector
t_2 = (log10(t_2))';
plot(n,t_1,n,t_2);
xlabel('log_{10}(n)');
ylabel('log_{10}(Time by second)');
title('1-D Diffusion log_{10}(time) vs log_{10}(n)');
legend('MATLAB LU', "My LU");


%%
% consider 2-D case
n = [10:5:50];
% Matlab back slash method time column vector
t_1 = zeros(length(n),1);
% My own LU method time column vector
t_2 = zeros(length(n),1);
% iteration on each n
for i = 1:length(n)
    % start with 1-D case
    % interval method measure
    [A,b] = Diffusion_2_D(n(i),2);
    counter = 0;
    % to make the measure more accurate, we let it solve 3 times and take
    % the average
    for j = 1:3
        tic
        x = A\b;
        counter = counter + toc;
    end
    t_1(i) = counter/3;

    % my own LU method measure
    counter = 0;
    for k = 1:3
        tic
        x = Ludecomp(A,b,n(i)*n(i),0.001);
        counter = counter + toc;
    end
    t_2(i) = counter / 3;
end
% power law scale
n = log10(n);
t_1 = (log10(t_1))';    % Row vector
t_2 = (log10(t_2))';
plot(n,t_1,n,t_2);
xlabel('log_{10}(n)');
ylabel('log_{10}(Time by second)');
title('2-D Diffusion log_{10}(time) vs log_{10}(n)');
legend('MATLAB LU', "My LU");   











