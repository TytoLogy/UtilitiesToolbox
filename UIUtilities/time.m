function out = time(varargin)

carr = clock;

hour = sprintf('%d', carr(4));
minute = sprintf('%d', carr(5));
second = sprintf('%.2f', carr(6));

if length(varargin)
	if strcmp(lower(varargin{1}), 'hour')
		out = hour;
	elseif 	strcmp(lower(varargin{1}), 'minute')
		out = minute;
	elseif 	strcmp(lower(varargin{1}), 'second')
		out = second;
	elseif 	strcmp(lower(varargin{1}), 'all')
		out = {hour, minute, second};
	else
		out = sprintf('%s:%s:%s', hour, minute, second);	
	end
else
	out = sprintf('%s:%s:%s', hour, minute, second);
end