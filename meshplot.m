function [Xi, Yi, Zi] = meshplot(Fxy, X, Y)
% [Xi, Yi, Zi] = meshplot(Fxy, X, Y)
%
% Input Arguments:
% 
% 	X = xmin:xstep:xmax	(x grid)
% 	Y = ymin:ystep:ymax	(y grid)
% 	Fxy =					(data)
% 
% 		x1	y1	z1
% 		x2	y2	z2
% 		x3	y3	z3
% 		.	.	.
% 		.	.	.
% 		.	.	.
% 		xn	yn	zn
% 
% Output Arguments:
%
%
% See Also: contourplot, pcolorplot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------
%  Sharad Shanbhag
%	sshanbha@aecom.yu.edu
%------------------------------------------------------------------------
% Created: 17 September, 2008
%
% Revisions:
%------------------------------------------------------------------------


[Xi, Yi] = meshgrid(X, Y);

Zi = griddata(Fxy(:, 1), Fxy(:, 2), Fxy(:, 3), Xi, Yi);

mesh(Xi, Yi, Zi);



