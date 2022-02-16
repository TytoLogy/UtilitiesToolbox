function [new, varargout] = replace_file_ext(orig, new_ext)
% changes the extension of orig file name

% break up orig name into path, file base name, extension
[pstr, fstr, estr] = fileparts(orig);

% recombine with new ext
new = fullfile(pstr, [fstr new_ext]);

varargout{1} = estr;

