n = 3:15;
L2_error = zeros(length(n),1);  %  L2Norm
res = zeros(length(n),1); %     resolution
% get L2 error for each size of grid
for i = 1:length(n)
    L2_error(i) = L2ErrorNorm(n(i),2);
    res(i) = 1/(n(i)-1);
end
plot(res,L2_error);
title('L2 Norm Error with {alpha} = 2');
xlabel('resolution h');
ylabel('L2 norm error');
