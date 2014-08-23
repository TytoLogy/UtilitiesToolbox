function [path, fname, extension] = filenamesplit(name, varargin)
%filenamesplit Filename parts.
%   [PATHSTR,NAME,EXT] = filenamesplit(FILE) returns the path, file name, and
%   file name extension for the specified FILE. The FILE input is a string
%   containing the name of a file or folder, and can include a path and
%   file name extension. The function interprets all characters following
%   the right-most path delimiter as a file name plus extension.

%	you may provide either 'PC' or 'UNIX' to specify behavior
%
%   If the FILE input consists of a folder name only, be sure that the
%   right-most character is a path delimiter (/ or \). Othewise, filenamesplit
%   parses the trailing portion of FILE as the name of a file and returns
%   it in NAME instead of in PATHSTR.
%
%   filenamesplit only parses file names. It does not verify that the file or
%   folder exists. You can reconstruct the file from the parts using
%      fullfile(pathstr,[name ext versn])
%
%   filenamesplit is platform INdependent.
%
%   On Microsoft Windows systems, you can use either forward (/) or back
%   (\) slashes as path delimiters, even within the same string. On Unix
%   and Macintosh systems, use only / as a delimiter.
%
%   See also FILEPARTS, FULLFILE, PATHSEP, FILESEP.

% Nothing but a row vector should be operated on.
if ~ischar(name) || size(name, 1) > 1
    error('MATLAB:filenameparts:MustBeChar', ...
				'Input must be a row vector of characters.');
end

path = '';
fname = '';
extension = '';

if isempty(name)
    return;
end

builtinStr = xlate('built-in');
if strncmp(name, builtinStr, size(builtinStr,2))
    fname = builtinStr;
    return;
end

% see if caller provided mode type
if nargin == 2
	% if so, and not empty, check type
	if ~isempty(varargin{1})
		% if PC, set mode to pc
		if any(strcmpi(varargin{1}, {'PC', 'PCWIN', 'PCWIN64'}))
			filemode = 'PC';
		else
			filemode = 'UNIX';
		end
	else
    error('MATLAB:filenameparts:NoMode', ... 
				'No MODE type given.');
	end
else
	% try to determine mode from file
	if (name(2) == ':') || any(name == '\')
		filemode = 'PC';
	else
		filemode = 'UNIX';
	end
end


if strcmp(filemode, 'PC')
    ind = find(name == '/'|name == '\', 1, 'last');
    if isempty(ind)
        ind = find(name == ':', 1, 'last');
        if ~isempty(ind)       
            path = name(1:ind);
        end
    else
        if ind == 2 && (name(1) == '\' || name(1) == '/')
            %special case for UNC server
            path =  name;
            ind = length(name);
        else 
            path = name(1:ind-1);
        end
    end
    if isempty(ind)       
        fname = name;
    else
        if ~isempty(path) && path(end)==':' && ...
                (length(path)>2 || (length(name) >=3 && name(3) == '\'))
                %don't append to D: like which is volume path on windows
            path = [path '\'];
        elseif isempty(deblank(path))
            path = '\';
        end
        fname = name(ind+1:end);
    end
else    % UNIX
    ind = find(name == '/', 1, 'last');
    if isempty(ind)
        fname = name;
    else
        path = name(1:ind-1); 

        % Do not forget to add filesep when in the root filesystem
        if isempty(deblank(path))
            path = '/';
        end
        fname = name(ind+1:end);
    end
end

if isempty(fname)
    return;
end

% Look for EXTENSION part
ind = find(fname == '.', 1, 'last');

if isempty(ind)
    return;
else
    extension = fname(ind:end);
    fname(ind:end) = [];
end
