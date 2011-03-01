function [x, y, angles] = azel2cart(az,el)
% AZEL2CART Transform azimuth and elevation to X,Y Cartesian coordinates 
%			based on the arcdistance from az == 0 and el == 0
%
%   [X, Y] = AZEL2CART(AZ, EL) transforms corresponding elements of
%   data stored in spherical coordinates (azimuth TH, elevation PHI,
%   radius R) to Cartesian coordinates X,Y,Z.  The arrays TH, PHI, and
%   R must be the same size (or any of them can be scalar).  TH and
%   PHI must be in degrees.
%
%   TH is the counterclockwise angle in the xy plane measured from the
%   positive x axis.  PHI is the elevation angle from the xy plane.
%
%	x and y will be in radians, so they can be reconverted to angles by
%	rad2deg()
%
%   See also CART2SPH, CART2POL, POL2CART, SPH2CART, ARCDISTANCE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Sharad J. Shanbhag
%	sshanbha@aecom.yu.edu
%-------------------------------------------------------------------------
% Revision History:
%
%	30 Mar 08:	Adapted from Matlab SPH2CART() function
%	5 Apr 08:	reworked using arcdistance() technique to compute speaker
%				location as distance from az=0 and el=0 meridians
%				Saved old version as azel2cart_hack1.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% make sure we have the same # of azs as els
if length(az) ~= length(el)
	az = az(1);
	el = el(1);
end

% convert angles to radians
az = deg2rad(az);
el = deg2rad(el);

% preallocate arrays
N = length(az);
angles = zeros(N, 2);
x = zeros(N, 1);
y = zeros(N, 1);

for i = 1:N
	% x coordinate is the arcdistance from the az = 0 meridian (vertical)
	[x(i), angles(i, 1)] = arcdistance([0 el(i)], [az(i) el(i)], 1);
	% y coordinate is the arcdistance from the el = 0 meridian (horizontal)
	[y(i), angles(i, 2)] = arcdistance([az(i), 0], [az(i), el(i)], 1);	
end
	
% find negative values and apply correction
negvals = find(az<0);
if ~isempty(az)
	x(negvals) = -1*x(negvals);
end

% find negative values and apply correction
negvals = find(el<0);
if ~isempty(el)
	y(negvals) = -1*y(negvals);
end



