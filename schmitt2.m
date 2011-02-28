function spikes = schmitt2(data, thresh, spwindow)
% spikes = schmitt2(data, thresh, spwindow)
% 
% Implements simple schmitt trigger
% 
% 
% Input:
% 	data			input data 
% 	thresh		voltage threshold
% 	spwindow		time window (refractory period)
% 
% Output:
% 	spikes			bins with spikes (multiply by dt to get time)
% 					empty if none found

if nargin ~= 3
	help schmitt2
	error('bad inputs');
end

if ~length(data)
	error('data empty')
end

if spwindow <= 0
	error
end

% find the samples that are between the two thresholds
spikes = [];
i = 1;
nspikes = 0;
N = length(data);

if thresh >= 0
	while i<N
		if data(i) > thresh
			nspikes = nspikes + 1;
			spikes(nspikes) = i;
			% wait for the spike refractory period 
			i = i + spwindow;
		else
			i = i+1;
		end
	end
else
	while i<N
		if data(i) < thresh
			nspikes = nspikes + 1;
			spikes(nspikes) = i;
			% wait for the spike refractory period 
			i = i + spwindow;
		else
			i = i+1;
		end
	end
end