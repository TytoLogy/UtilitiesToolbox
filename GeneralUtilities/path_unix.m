function outPath = path_unix(inPath)
%------------------------------------------------------------------------
% outPath = path_unix(inPath)
%------------------------------------------------------------------------
% TytoLogy:Utilities Toolbox
%------------------------------------------------------------------------
% 
% converts string from PC file separator ('\') to UNIX ('/')
% 
% inspired by 
% https://www.mathworks.com/matlabcentral/answers/
%	117110-dealing-with-and-windows-vs-unix-for-path-definition
%------------------------------------------------------------------------
% Input Arguments:
% 	inPath		PC path
% 
% Output Arguments:
% 	outPath		UNIXy path
%
%------------------------------------------------------------------------
% See also: 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 24 June, 2020 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

outPath = inPath;
outPath(strfind(outPath, '\')) = filesep;

