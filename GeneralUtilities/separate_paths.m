function paths = separate_paths(pathstr)
%------------------------------------------------------------------------
% paths = separate_paths(pathstr)
%------------------------------------------------------------------------
% UtilitiesToolbox:GeneralUtilities
%------------------------------------------------------------------------
% given string of paths (from genpath), separates paths based on 
% path separation string (;) and returns list of paths in cell
% array paths
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	pathstr		string of paths, usu. from genpath
% 
% Output Arguments:
% 	paths			cell array of paths
%
%------------------------------------------------------------------------
% See also: genpath, join_paths
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

% find locations of path separator characters
if ispc
	seplocs = find(pathstr == ';');
elseif (ismac || isunix)
	seplocs = find(pathstr == ':');
end	

% if none found, abort
if isempty(seplocs)
	if isempty(pathstr)
		paths = {};
	else
		paths = pathstr;
	end
	return
end

%  otherwise, get # of path separators
nsep = length(seplocs);
% allocate paths cell
paths = cell(nsep, 1);
% loop through separators, pull off path string and store in paths cell array
start_index = 1;
for n = 1:nsep
	end_index = seplocs(n) - 1;
	paths{n} = pathstr(start_index:end_index);
	start_index = end_index + 2;
end
