function out = create_backup_file(varargin)
%------------------------------------------------------------------------
% out = create_backup_file(origpath, origfile)
% out = create_backup_file(orig_fullpathandfile)
%------------------------------------------------------------------------
% <project>:<subproject>:<function_name>
%------------------------------------------------------------------------
% 
% given original path and original file, make a copy of the file with
% prepended hexadecimal date code and appended '.bak'
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	origpath    path to original file
%  origfile    name of original file
% 
%  or
%
%  orig_fullpathandfile
%
% Output Arguments:
% 	Output	output info
%
%------------------------------------------------------------------------
% See also: hex2time, time2hex (TytoLogy), copyfile (MATLAB)
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 28 April, 2022 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

if isempty(varargin)
   error('%s: empty input file', mfilename)
end

if length(varargin) == 1
   pathandfile = varargin{1};
else
   pathandfile = fullfile(varargin{:});
end

% first, get parts of old file
[pname, fname, ext] = fileparts(pathandfile);


% check on file existence
if ~exist(fullfile(pathandfile), 'file')
   warning('%s: file %s does not exist in %s', mfilename, ...
                     [fname ext], pname);
   out = '';
   return
end

% prepend a matlab timecode to fname
bakfname = [time2hex(now) '_' fname];
% and append '.mat.bak' to it
bakfname = [bakfname ext '.bak'];
sendmsg({['Copying ' [fname ext] ':'], ...
            ['  Original: ' fullfile(pathandfile)], ...
            ['  Backup:   ' fullfile(pname, bakfname)]});
fprintf(['*** first 10 characters of name are ' ...
            'floor(1e6*MATLAB date code) in hexadecimal\n']);
copyfile(fullfile(pathandfile), ...
         fullfile(pname, bakfname))

out = fullfile(pname, bakfname);
