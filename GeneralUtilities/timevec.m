function t = timevec(N, Fs, varargin)
% t = timevec(N, Fs, unit)
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