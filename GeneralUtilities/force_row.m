function Output = force_row(Input)
%------------------------------------------------------------------------
% Output = force_row(Input)
%------------------------------------------------------------------------
% UtilitiesToolbox:GeneralUtilities
%------------------------------------------------------------------------
%
% ensures Output is row vector form of Input
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	Input		input vector
% 
% Output Arguments:
% 	Output	output vector, in row format
%
%------------------------------------------------------------------------
% See also: force_col, reshape
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 24 April, 2017 (SJS)
%
% Revisions:
%  8 Sep 2022 (SJS): updated docs
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

% if empty return empty
if isempty(Input)
	Output = [];
	return
end
% reshape input
Output = reshape(Input, 1, numel(Input));