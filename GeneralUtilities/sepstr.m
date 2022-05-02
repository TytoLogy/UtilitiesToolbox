function str = sepstr(varargin)
%------------------------------------------------------------------------
% str = sepstr(length of string)
%------------------------------------------------------------------------
% TytoLogy:Toolboxes:UtilitiesToolbox:GeneralUtilities
%--------------------------------------------------------------------------
% returns a string of '-' characters, useful when displaying information to
% console
% if a number is provided, str will be a string of '-' of that length
%------------------------------------------------------------------------
% Output Arguments:
%
% str	a string of '-'
%
%------------------------------------------------------------------------
% See Also:
%------------------------------------------------------------------------
%------------------------------------------------------------------------
%  Sharad Shanbhag
%   sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 10 March, 2020  (SJS)
% Revisions:
%  2 May, 2022 (SJS): added optional input to 
%--------------------------------------------------------------------------

if ~nargin
   str = '----------------------------------------------------------';
else
   str = repmat('-', [1 varargin{1}]);
end