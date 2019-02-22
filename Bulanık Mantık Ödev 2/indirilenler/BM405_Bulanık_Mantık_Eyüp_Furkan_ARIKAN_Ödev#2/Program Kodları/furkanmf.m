function y = furkanmf(x, parametreler)
if nargin ~= 2,
    error('ZMF tarafýndan iki argüman gereklidir.');
elseif length(parametreler) < 2,
    error('ZMF en az iki parametreye ihtiyaç duyar.');
end

x1 = parametreler(1); x0 = parametreler(2);

if x1 >= x0,
    y = x <= (x0+x1)/2;
    return;
end

y = zeros(size(x));

index1 = find(x <= x1);
if ~isempty(index1),
    y(index1) = ones(size(index1));
end

index2 = find((x1 < x) & (x <= (x1+x0)/2));
if ~isempty(index2),
    y(index2) = 1-2*((x(index2)-x1)/(x1-x0)).^2;
end

index3 = find(((x1+x0)/2 < x) & (x <= x0));
if ~isempty(index3),
    y(index3) = 2*((x0-x(index3))/(x1-x0)).^2;
end

index4 = find(x0 <= x);
if ~isempty(index4),
    y(index4) = zeros(size(index4));
end

