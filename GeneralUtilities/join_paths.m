function pathstr = join_paths(paths)
%------------------------------------------------------------------------
% pathstr = join_paths(paths)
%------------------------------------------------------------------------
% UtilitiesToolbox:GeneralUtilities
%------------------------------------------------------------------------
% 
% given a list of paths (as cell array), joins paths with
% path separation string (;) and returns a string
% 
%------------------------------------------------------------------------
% Input Arguments:
%	paths			cell array of paths
% 
% Output Arguments:
% 	pathstr		string of paths
%
%------------------------------------------------------------------------
% See also: separate_paths
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad J. Shanbhag
%	sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 23 August, 2012 (SJS)
%
% Revisions:
%	5 Dec 2012 (SJS):
%	 -	revised docs
%	 -	added code to handle ';' (pc) vs ':' (mac) path separators
%------------------------------------------------------------------------

if ispc
	sepstr = ';';
elseif (ismac || isunix)
	sepstr = ':';
end

npaths = length(paths);

pathstr = '';
for n = 1:npaths
	pathstr = [pathstr paths{n}];
	pathstr = [pathstr sepstr];
end
