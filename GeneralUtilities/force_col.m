function Output = force_col(Input)
%------------------------------------------------------------------------
% Output = force_col(Input)
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
% See also: 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 7 May, 2017 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------


if isempty(Input)
	Output = [];
	return
end

Output = reshape(Input, numel(Input), 1);