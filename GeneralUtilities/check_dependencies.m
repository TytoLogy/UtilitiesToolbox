function deps = check_dependencies(function_name)
%------------------------------------------------------------------------
% deps = check_dependencies(function_name)
%------------------------------------------------------------------------
% TytoLogy -> Utilities Toolbox -> General Utilities
%------------------------------------------------------------------------
% 
% lists required functions and Matlab toolboxes for given function_name
% deps struct will contain cell array deps.files listing functions required 
% (including current paths) and struct array deps.packages listing 
% toolboxes
%
%------------------------------------------------------------------------
% Input Arguments:
% 	function_name		name of function to be tested
% 
% Output Arguments:
% 	deps		struct with fields
% 					files			cell array with file names/paths
% 					packages		list of Matlab tools required
% 
%------------------------------------------------------------------------
% See also: 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%  Sharad J. Shanbhag
%	sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 10 May, 2017
%
% Revisions:
%------------------------------------------------------------------------

if ~ischar(function_name)
	error('%s: function_name must be a string!', mfilename)
end

[deps.files, deps.packages] = ...
		matlab.codetools.requiredFilesAndProducts(function_name);

% make files array more easily readable
deps.files = deps.files';
