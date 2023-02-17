function t = timevec(N, Fs, varargin)
% t = timevec(N, Fs, unit)
% 
%  N  length of time vector in bins
%  Fs sample rate, samples/sec
%
%  option: 'ms'   time in milliseconds
%           's'   time in seconds
%


if ~isempty(varargin)
	switch upper(varargin{1})
		case {'MS', 'MSEC', 'MILLISECONDS'}
			scalef = 1000;
		case {'S', 'SEC', 'SECONDS'}
			scalef = 1;
		otherwise
			warning([mfilename ': unknown option ' varargin{1}]);
			fprintf('Using seconds as time unit');
			scalef = 1;
	end
else
	scalef = 1;
end
t = scalef * ((1:N)-1)./Fs;