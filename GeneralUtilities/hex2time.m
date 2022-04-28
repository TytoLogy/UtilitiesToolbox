function serialdate = hex2time(hxtime)
% convert time as hexadecimal string to MATLAB serial date format
%
% See also: time2hex, now, datestr, hex2dec

% Created: 28 April 2022 (SJS)

tfact = 1e6;

serialdate = hex2dec(hxtime)/tfact;