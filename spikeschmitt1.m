function spikes = spikeschmitt1(spikedata, vthresh_lo, vthresh_hi, spwindow, Fs)
% spikes = spikeschmitt1(spikedata, vthresh_lo, vthresh_hi, spwindow, Fs)
% 
% Implements simple schmitt trigger
% 
% 
% Input:
% 	spikedata		input data 
% 	vthresh_lo		low voltage threshold
% 	vthresh_hi		high voltage threshold
% 	spwindow		time window (refractory period)
% 
% Output:
% 	spikes			bins with spikes (multiply by dt to get time)
% 					empty if none found

if nargin ~= 5
	help spikeschmitt1
	error('bad inputs');
end

if ~length(spikedata)
	error('spikedata empty')
end

spwindow_bins = ceil(spwindow*0.001*Fs);

if spwindow_bins <= 0
	spwindow_bins = 10;
	warning('Using bin size of 10')
end

% find the samples that are between the two thresholds
spikes = [];
i = 1;
nspikes = 0;
N = length(spikedata);

while i<N
	
	if between(spikedata(i), vthresh_lo, vthresh_hi)
		nspikes = nspikes + 1;
		spikes(nspikes) = i;
		% wait for the spike refractory period 
		i = i + spwindow_bins;
		
	else
		i = i+1;
	end
	
end