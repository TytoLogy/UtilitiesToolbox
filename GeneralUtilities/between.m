function outval = between(val, low, high)
%function outval = between(val, low, high)
%	returns 1 if low <= val <= high, 0 otherwise
%

%	Sharad Shanbhag
%	sshanbha@aecom.yu.edu

if nargin ~= 3
	error('between: need val, low and high arguments');
end

if high <= low
	error('between: high must be greater than low value');
end

outval = 0;
if (val >= low) & (val <= high)
	outval = 1;
end