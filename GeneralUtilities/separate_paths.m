function paths = separate_paths(pathstr)
%------------------------------------------------------------------------
%
%------------------------------------------------------------------------
% 
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
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

seplocs = find(pathstr == ';');

if isempty(seplocs)
	paths = {};
	return
else
	nsep = length(seplocs);
end

paths = cell(nsep, 1);

start_index = 1;
for n = 1:nsep
	end_index = seplocs(n) - 1;
	paths{n} = pathstr(start_index:end_index);
	start_index = end_index + 2;
end
