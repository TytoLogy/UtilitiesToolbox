function bSeq = blockSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% bSeq = blockSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% TytoLogy: UtilitiesToolbox
%--------------------------------------------------------------------------
% generate the block randomized trial sequence
% present nTrials (# of different values for varying
% stimulus parameter) in blocks for nReps
% 
% Example:
% 
% 	I'd like to test ITDs from -100 to 100 in steps of 100,
% 	so ITDs = [-100 0 100] & I want 5 repetitions of each ITD value, but
% 	each ITD value should be presented once (in random order) before being
% 	presented again.
% 	
% 	so, 
% 		nReps = 5
% 		nTrials = length(ITDs) = 3;
% 		
% 	and I call blockSequence() as follows:
% 
% 		>> bSeq = blockSequence(5, 3)
% 
% 		bSeq =
% 				2     1     3
% 				1     3     2
% 				3     1     2
% 				1     3     2
% 				3     2     1
% 		  
% 	So each row of bSeq corresponds to a "rep" of the block stimulus presentation
% 	and columns are each "trial".  calling ITDs with bSeq as indices gives:
% 	
% 		>> ITDs(bSeq)
% 
% 		ans =
% 				0  -100   100
% 				-100   100     0
% 				100  -100     0
% 				-100   100     0
% 				100     0  -100
%--------------------------------------------------------------------------
% Input Arguments:
%	nReps		# reps per stimulus type
%	nTrials	# trials (# stimulus types)
%
% Output Arguments:
%	bSeq	[nReps X nTrials] sequence of blocked indices
%--------------------------------------------------------------------------
% See Also: HPCurve_buildStimCache, HPSearch, randomSequence
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%--------------------------------------------------------------------------
% Revision History
%	31 May, 2017 (SJS): created from randomSequence
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate the blocked trial sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% randomize across nTrials (# of different values for varying
% stimulus parameter)

% create array of zeros
bSeq = zeros(nReps, nTrials);

% create a random sequence for each rep, store in rows of bSeq
for m = 1:nReps
	bSeq(m, :) = randperm(nTrials);
end

	