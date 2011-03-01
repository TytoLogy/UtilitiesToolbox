function [aout, bout] = PermuteTargets(astart, astep, aend, bstart, bstep, bend)
% function [aout, bout] = PermuteTargets(astart, astep, aend, bstart, bstep, bend)
%
%
% Sharad J. Shanbhag
% sharad@etho.caltech.edu

aout = zeros(1, 1);
bout = zeros(1, 1);

abegin = astart;
astop = aend;
aindex = 1;
bindex = 1;
b = bstart;

while b >= bend
	a = abegin;
	
   if abegin < astop
		while a <= astop				
			aout(aindex) = a;
			bout(bindex) = b;
			a = a - astep;
			aindex = aindex + 1;
			bindex = bindex + 1;
		end
		
		abegin = astart;
		astop = aend;
		
	else
		while a >= astop
			aout(aindex) = a;
			bout(bindex) = b;
			a = a + astep;
			aindex = aindex + 1;
			bindex = bindex + 1;
		end
		abegin = aend;
		astop = astart;
	end
	
	b = b + bstep;
end