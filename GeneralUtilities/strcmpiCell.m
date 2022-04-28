function varargout = strcmpiCell(strList, searchCell)
%------------------------------------------------------------------------
% [indx, indx_by_str] = strcmpiCell(strList, searchCell)
%------------------------------------------------------------------------
% given cell vector of strings, searchCell, and list of strings to look for
% in strList (cell), return indx logical matches for all strings in strList
% and matches for each element of strList in index_by_str
%------------------------------------------------------------------------
% Input Args:
%
% Output Args:
%------------------------------------------------------------------------
% See also: strcmpi, contains
%------------------------------------------------------------------------

if iscell(strList)
   nstr = length(strList);
else
   nstr = 1;
end
allI = false(length(searchCell), nstr);
netI = false(length(searchCell), 1);

if nstr > 1
   for n = 1:nstr
      allI(:, n) = strcmpi(strList{n}, searchCell);
      netI = netI | allI(:, n);
   end
else
   allI = strcmpi(strList, searchCell);
   netI = allI;
end
varargout{1} = netI;
varargout{2} = allI;