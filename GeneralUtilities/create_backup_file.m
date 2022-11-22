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
%  Options:
%     BACKUP_MODE, <'COPY' | 'RENAME'> default is COPY
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
%  22 Nov 22 (SJS): added backup mode, significant overhaul of handling
%                   input args
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% defaults and parse inputs
%------------------------------------------------------------------------
% default mode is to copy to backup name. other option if move
BACKUP_MODE = 'COPY';

% check inputs
if isempty(varargin)
   warning('%s: empty inputs');
   out = '';
   return
end

% see if backup mode was specified
[hasBackup, backIndex] = ismember('BACKUP_MODE', upper(varargin));
if hasBackup
   % split backup and file input info
   backIn = varargin(backIndex:(backIndex+1));
   if length(backIn) ~= 2
      error('%s: need mode for backup (COPY or RENAME)', mfilename);
   end
   pathIn = varargin(1:(backIndex-1));
   % deal with the file name stuff
   if length(pathIn) == 1
      pathandfile = pathIn{1};
   else
      pathandfile = fullfile(pathIn{1}, pathIn{2});
   end
   % then the backup mode
   if strcmpi(backIn{1}, 'BACKUP_MODE')
      switch upper(backIn{2})
         case 'COPY'
            BACKUP_MODE = 'COPY';
         case 'RENAME'
            BACKUP_MODE = 'RENAME';
         otherwise
            error('%s: unknown backup mode %s', mfilename, backIn{2});
      end
   else
      error('%s: unknown option %s', mfilename, backIn{1});
   end
else
   if length(varargin) == 1
      pathandfile = varargin{1};
   elseif length(varargin) == 2
      pathandfile = fullfile(varargin{1}, varargin{2});
   elseif length(varargin) > 2
      error('%s: unknown input option (?) %s', mfilename, varargin{3});
   end
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

switch BACKUP_MODE
   case 'COPY'
      sendmsg({['Copying ' [fname ext] ':'], ...
               ['  Original: ' fullfile(pathandfile)], ...
               ['  Backup:   ' fullfile(pname, bakfname)]});
      fprintf(['*** first 10 characters of name are ' ...
               'floor(1e6*MATLAB date code) in hexadecimal\n']);
      copyfile(fullfile(pathandfile), fullfile(pname, bakfname))

   case 'RENAME'
      sendmsg({['Renaming ' [fname ext] ':'], ...
               ['  Original: ' fullfile(pathandfile)], ...
               ['  Backup:   ' fullfile(pname, bakfname)]});
      fprintf(['*** first 10 characters of name are ' ...
               'floor(1e6*MATLAB date code) in hexadecimal\n']);
      movefile(fullfile(pathandfile), fullfile(pname, bakfname))

end

out = fullfile(pname, bakfname);
