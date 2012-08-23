%function gitlesspathstr = remove_gitpaths(pathstr)
%------------------------------------------------------------------------
% gitlesspathstr = remove_gitpaths(pathstr)
%------------------------------------------------------------------------
% 
% given string of paths (from genpath), removes paths with .git
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	pathstr		string of paths, usu. from genpath
% 
% Output Arguments:
% 	gitlesspathstr			string of paths, without .git paths
%
%------------------------------------------------------------------------
% See also: genpath
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

pcell = separate_paths(pathstr);

npaths = length(pcell);

gitlessflags = zeros(npaths, 1);

for n = 1:npaths
	loc = regexp(pcell{n}, '.git', 'ONCE');
	gitlessflags(n) = isempty(loc);
end

gitlesspaths = pcell(find(gitlessflags));

gitlesspathstr = join_paths(gitlesspaths);
