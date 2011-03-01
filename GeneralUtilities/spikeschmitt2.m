function spikes = spikeschmitt2(spikedata, vthresh, spwindow, Fs)
%------------------------------------------------------------------------
% spikes = spikeschmitt2(spikedata, vthresh, spwindow, Fs)
%------------------------------------------------------------------------
% Utilities Toolbox
%------------------------------------------------------------------------
% Implements simple schmitt trigger
%------------------------------------------------------------------------
% Input:
% 	spikedata		input data, [N, M] 
%							rows => trials or repetitions or channels
%							columns => samples (sample rate Fs)
%							So, a [2, 5] spikedata array has 2 channels and 5 samples
% 	vthresh			voltage threshold
% 	spwindow			time window (refractory period) in milliseconds
%	Fs					data sampling rate (samples/second)
% 
% Output:
% 	spikes			bins with spikes (multiply by dt to get time)
%							empty if none found
% 						
% 							For backward compatibility, if only 1 row, spikes will
% 							be an 1 X M vector of spiketimes  (empty if none
% 							detected)
% 							
% 							For multichannel or multi-trial data, spikes will
% 							be a cell vector with N elements, with each cell
% 							holding a vector of spike times
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sshanbhag@neoucom.edu
%------------------------------------------------------------------------
% Created: ????????????
%
% Revisions:
% 	8 June, 2010 (SJS): 
% 		-	updated to allow for multichannel/multisweep detection
% 		-	updated comments/documentation
%------------------------------------------------------------------------
% TO DO:
% 		-	there's gotta be a way to vectorize the thresholding algorithm...
% 			these loops are SLOOOOOW....
%------------------------------------------------------------------------
			
if nargin ~= 4
	error('%s: bad inputs', mfilename);
end

if isempty(spikedata)
	warning('%s: spikedata empty', mfilename);
	spikes = [];
	return
end

% convert spike window in msec to bins (samples)
spwindow_bins = ceil(spwindow*0.001*Fs);
if spwindow_bins <= 0
	spwindow_bins = 10;
	warning('%s: Using bin size of 10 since defined spwindow was <= 0', mfilename)
end

[N, M] = size(spikedata);
% find the samples that are between the two thresholds
% Check how many channels or sweeps or trials (rows) there are in spikedata
if N == 1
	% if 1 channel or row, spikes is a simple vector
	spikes = [];
	bin = 1;
	nspikes = 0;	
	if vthresh >= 0
		while bin<M
			if spikedata(bin) > vthresh
				nspikes = nspikes + 1;
				spikes(nspikes) = bin;
				% wait for the spike refractory period 
				bin = bin + spwindow_bins;
			else
				bin = bin+1;
			end
		end
	else
		while bin<M
			if spikedata(bin) < vthresh
				nspikes = nspikes + 1;
				spikes(nspikes) = bin;
				% wait for the spike refractory period 
				bin = bin + spwindow_bins;
			else
				bin = bin+1;
			end
		end
	end
	
else
	% otherwise, spikes is a cell array
	spikes = cell(N, 1);
	
	% loop through the rows (i.e., sweeps or channels or ?)
	for row = 1:N
		tmpspikes = [];
		bin = 1;
		nspikes = 0;	
		if vthresh >= 0
			while bin<M
				if spikedata(row, bin) > vthresh
					nspikes = nspikes + 1;
					tmpspikes(nspikes) = bin;
					% wait for the spike refractory period 
					bin = bin + spwindow_bins;
				else
					bin = bin+1;
				end
			end
		else
			while bin<M
				if spikedata(row, bin) < vthresh
					nspikes = nspikes + 1;
					tmpspikes(nspikes) = bin;
					% wait for the spike refractory period 
					bin = bin + spwindow_bins;
				else
					bin = bin+1;
				end
			end
		end
		spikes{row} = tmpspikes;
	end
end
