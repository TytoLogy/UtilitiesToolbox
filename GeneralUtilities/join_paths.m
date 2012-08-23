function pathstr = join_paths(paths)
%------------------------------------------------------------------------
% pathstr = join_paths(paths)
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
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

npaths = length(paths);

pathstr = '';
for n = 1:npaths
	pathstr = [pathstr paths{n}];
	pathstr = [pathstr ';'];
end
