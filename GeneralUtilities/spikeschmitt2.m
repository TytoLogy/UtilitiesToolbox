function spikes = spikeschmitt2(spikedata, vthresh, spwindow, Fs, varargin)
%------------------------------------------------------------------------
% spikes = spikeschmitt2(spikedata, vthresh, spwindow, Fs, <options>)
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
%	Options:
%		'ms'			spike times will be in milliseconds
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
%	sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: ????????????
%
% Revisions:
% 	8 June, 2010 (SJS): 
% 		-	updated to allow for multichannel/multisweep detection
% 		-	updated comments/documentation
%	6 Feb 2019 (SJS)
%		- added option for milliseconds
%------------------------------------------------------------------------
% TO DO:
% 		-	there's gotta be a way to vectorize the thresholding algorithm...
% 			these loops are SLOOOOOW....
%------------------------------------------------------------------------

Units = 'DEFAULT';

if nargin < 4
	error('%s: bad inputs', mfilename);
end

if isempty(spikedata)
	warning('%s: spikedata empty', mfilename);
	spikes = [];
	return
end

if ~isempty(varargin)
	if strcmpi(varargin{1}, 'ms')
		Units = 'MS';
	else
		error('%s: unknown units %s', mfilename, varargin{1});
	end
end

% convert spike window in msec to bins (samples)
spwindow_bins = ceil(spwindow*0.001*Fs);
if spwindow_bins <= 0
	spwindow_bins = 10;
	warning('%s: Using bin size of 10 since defined spwindow was <= 0', ...
						mfilename)
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
				spikes(nspikes) = bin; %#ok<AGROW>
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
				spikes(nspikes) = bin; %#ok<AGROW>
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
					tmpspikes(nspikes) = bin; %#ok<AGROW>
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
					tmpspikes(nspikes) = bin; %#ok<AGROW>
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

if strcmpi(Units, 'MS')
	ms_scale = (1000/Fs);
	if iscell(spikes)
		for n = 1:length(spikes)
			spikes{n} = ms_scale * spikes{n}; %#ok<AGROW>
		end
	else
		spikes = ms_scale * spikes;
	end
end

		
