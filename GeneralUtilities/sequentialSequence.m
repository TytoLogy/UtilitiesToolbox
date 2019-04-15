function sSeq = sequentialSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% sSeq = sequentialSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% TytoLogy: UtilitiesToolbox
%--------------------------------------------------------------------------
% generate the sequential trial sequence
% randomize across nTrials (# of different values for varying
% stimulus parameter) for nReps
% 
% Example:
% 
% 	I'd like to test ITDs from -100 to 100 in steps of 100,
% 	so ITDs = [-100 0 100] & I want 5 repetitions of each ITD value.
% 	
% 	so, 
% 		nReps = 5
% 		nTrials = length(ITDs) = 3;
% 		
% 	and I call sequentialSequence() as follows:
% 
% 	>> rSeq = sequentialSequence(5, 3)
% 
% 	rSeq =
% 
% 			3     3     1
% 			1     2     3
% 			1     2     2
% 			3     1     2
% 			3     2     1
% 		  
% 	Note that rows and columns, while having size of [nReps, nTrials] do not
%  correspond to "blocks" of stimuli as would be found from blockSequence.
%
%  To get the sequence of ITDs to present:
% 	
% 	>> ITDs(rSeq)
% 
% 	ans =
% 			100   100  -100
% 		  -100     0   100
% 		  -100     0     0
% 			100  -100     0
% 			100     0  -100
%--------------------------------------------------------------------------
% Input Arguments:
%	nReps		# reps per stimulus type
%	nTrials	# trials (# stimulus types)
%
% Output Arguments:
%	rS		[nReps X nTrials] sequence of indices NOT BLOCKED!!!
%--------------------------------------------------------------------------
% See Also: HPCurve_buildStimCache, HPSearch, blockSequence, randomSequence
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%--------------------------------------------------------------------------
% Revision History
%	15 April, 2019 (SJS): created from randomSequence
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate the trial sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% randomize across nTrials (# of different values for varying
% stimulus parameter) for nReps

% create list of indices for randomization
tlist = zeros(nReps*nTrials, 1);
tlindex = 1;
for t = 1:nTrials
	for r = 1:nReps
		tlist(tlindex) = t;
		tlindex = tlindex + 1;
	end
end
% create sequence, stored in rows of sSeq
sSeq = zeros(nReps, nTrials);
tlindex = 1;
for r = 1:nReps
	for t = 1:nTrials
		sSeq(r, t) = tlist(tlindex);
		tlindex = tlindex + 1;
	end
end
