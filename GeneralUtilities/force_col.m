function Output = force_col(Input)
%------------------------------------------------------------------------
% Output = force_col(Input)
%------------------------------------------------------------------------
% UtilitiesToolbox:GeneralUtilities
%------------------------------------------------------------------------
%
% ensures Output is column vector form of Input
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	Input		input vector
% 
% Output Arguments:
% 	Output	output vector
%
%------------------------------------------------------------------------
% See also: force_row, reshape
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 7 May, 2017 (SJS)
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
Output = reshape(Input, numel(Input), 1);