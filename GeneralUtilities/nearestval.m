
function varargout = nearestval(x, vals)
% compute absolute difference between x and vals, get minimum value and
% index

[varargout{3}, varargout{2}]  = min(abs(vals - x));
varargout{1} = vals(varargout{2});