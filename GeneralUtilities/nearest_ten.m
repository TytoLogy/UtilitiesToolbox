function y = nearest_ten(x)
% y = nearest_ten(x)
% equivalent to roundn(x, 1)

% Round x to the nearest multiple of p.
y = 10 * round(ceil(x / 10));