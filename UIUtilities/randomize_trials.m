function [rindices, rmode]  = randomize_trials(Nindices, Ntrials, mode)
% function [rindices, rmode] = randomize_trials(Nindices, Ntrials, mode)
%
% Use to obtain random indices for selecting ITDs, IIDs, BCs, etc.  The
% output array, rindices, will be of length (Nindices*Ntrials), where
% Nindices indicates the number of elements in the selection pool and
% Ntrials indicates the number of repeats.
%
% mode => 'global' | 'block' | 'reps'
%
%		global:	randomizes all trials and indices
%		block:	randomizes in blocks
%		reps:	simply gives Ntrials at each index (non-randomized)
%
%
% Sharad J. Shanbhag
% sharad@etho.caltech.edu

N = Nindices*Ntrials;
rindices = zeros(1, N);

if nargin == 2
	mode = 'block';
elseif nargin == 3
	mode = lower(mode);
end

if strcmp(mode, 'global')
	temp = rindices;
	for i = 1:Ntrials
		temp( (1+(i-1)*Nindices):i*Nindices ) = [1:Nindices];
	end
	ri = randperm(N);
	for i = 1:N
		rindices(i) = temp(ri(i));
	end

elseif strcmp(mode, 'block')
	for i = 1:Ntrials
		rindices( (1+(i-1)*Nindices):i*Nindices ) = randperm(Nindices);
	end
	
elseif strcmp(mode, 'reps')
	for i = 1:Nindices
		rindices( (1+(i-1)*Ntrials:i*Ntrials) ) = i;
	end

else
	warning('randomize_trials: unknown mode, using block mode');
	rindices = randomize_trials(Nindices, Ntrials, 'block');
end