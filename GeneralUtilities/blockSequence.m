function blockSequence = blockSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% blockSequence = blockSequence(nReps, nTrials)
%--------------------------------------------------------------------------
% TytoLogy: UtilitiesToolbox
%--------------------------------------------------------------------------
% generate the randomized trial sequence
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
% 	and I call blockSequence() as follows:
% 
% 		>> rSeq = blockSequence(5, 3)
% 
% 		rSeq =
% 			  2     1     3
% 			  3     1     2
% 			  2     3     1
% 			  2     3     1
% 			  1     3     2
% 		  
% 	So each row of rSeq corresponds to a "rep" of the block stimulus presentation
% 	and columns are each "trial".  calling ITDs with rSeq gives:
% 	
% 		>> ITDs(rSeq)
% 
% 		ans =
% 			  0  -100   100
% 			100  -100     0
% 			  0   100  -100
% 			  0   100  -100
% 		  -100   100     0
%--------------------------------------------------------------------------
% Input Arguments:
%	nReps		# reps per stimulus type
%	nTrials	# trials (# stimulus types)
%
% Output Arguments:
%	blockSequence	[nReps X nTrials] sequence of blocked indices
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
% generate the randomized trial sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% randomize across nTrials (# of different values for varying
% stimulus parameter)

% create array of zeros
blockSequence = zeros(nReps, nTrials);

% % create a blocked sequence
% for m = 1:nReps
% 	blockSequence(m, :) = randperm(nTrials);
% end

blocklist = zeros(nReps*nTrials);
listindex = 1;
for t = 1:nTrials
	for r = 1:nReps
		blocklist(listindex) = t;
		listindex = listindex + 1;
	end
end
% create a blocked sequence
listindex = 1;
for m = 1:nReps
	for n = 1:nTrials
		blockSequence(m, n) = blocklist(listindex);
		listindex = listindex + 1;
	end
end

	