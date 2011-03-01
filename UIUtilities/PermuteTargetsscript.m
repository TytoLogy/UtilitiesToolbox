%function [aout, bout] = PermuteTargets(astart, astep, aend, bstart, bstep, bend)
% function [aout, bout] = PermuteTargets(astart, astep, aend, bstart, bstep, bend)
%
%
% 
% 
% 	(aend, bstart)				...				(astart, bstart)
% 		.												.
% 		.												.
% 		.												.
% 	(aend, bend)				...				(astart, bend)
% 
% 
% 
% Sharad J. Shanbhag
% sharad@etho.caltech.edu

p1 = [20 -40 -20];
p2 = [-5 10 5];

astart	=	p1(1);
astep	=	p1(2);
aend	=	p1(3);
bstart	=	p2(1);
bstep	=	p2(2);
bend	=	p2(3);

aout = zeros(1, 1);
bout = zeros(1, 1);

% some diagnostics

if astep == 0
	error('PermuteTargets: astep == 0');
elseif  bstep == 0
	error('PermuteTargets: bstep == 0');
end

if bstart < bend
	disp('PermuteTargets: bstart < bend');
	disp('PermuteTargets: swapping bstart and bend');
	[bstart, bend] = swap(bstart, bend);
	
	if bstep > 0
		disp('PermuteTargets: fixing bstep');
		bstep = -bstep;
	end
end

if astart < aend
	disp('PermuteTargets: astart < aend');
	disp('PermuteTargets: swapping astart and aend');
	[astart, aend] = swap(astart, aend);
	
	if astep > 0
		disp('PermuteTargets: fixing astep');
		astep = -astep;
	end
end

[astart astep aend]
[bstart bstep bend]
pause


abegin = astart; % start point for a 
astop = aend;		% stop point for a
aindex = 1;			% index for aout array	
bindex = 1;			% index for bout array
b = bstart;			% start b at bstart

while b >= bend		% loop while b value is > bend
	a = abegin		% set a value at the abegin point
	
   if abegin < astop				% if abegin < astop, 
		while a <= astop			% loop while a < astop
			aout(aindex) = a;
			bout(bindex) = b;
			a = a - astep			% decrement a position by astep
			aindex = aindex + 1;
			bindex = bindex + 1;
		end
		
		abegin = astart;
		astop = aend;
		
	else
		while a >= astop
			aout(aindex) = a;
			bout(bindex) = b;
			a = a + astep
			aindex = aindex + 1;
			bindex = bindex + 1;
		end
		abegin = aend;
		astop = astart;
	end
	
	b = b + bstep
end

aout
bout
