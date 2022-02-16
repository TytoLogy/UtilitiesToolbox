function [new, varargout] = replace_file_ext(orig, new_ext)
% changes the extension of orig file name

% check that new_ext has '.' as first element
if new_ext(1) ~= '.'
   error('%s: first character of new extension must be a . ', mfilename)
end

% break up orig name into path, file base name, extension
[pstr, fstr, estr] = fileparts(orig);

% recombine with new ext
new = fullfile(pstr, [fstr new_ext]);

varargout{1} = estr;

