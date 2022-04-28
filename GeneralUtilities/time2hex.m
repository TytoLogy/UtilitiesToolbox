function hxtime = time2hex(serialdate)
% convert time from MATLAB serial date format to hexadecimal string
%
% See also: time2hex, now, datestr, hex2dec

% Created: 28 April 2022 (SJS)

tfact = 1e6;

hxtime = dec2hex(floor(tfact * serialdate));