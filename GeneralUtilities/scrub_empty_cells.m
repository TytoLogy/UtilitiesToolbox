function varargout = scrub_empty_cells(inCell)
%------------------------------------------------------------------------
% [outCell, occupiedBins] = scrub_empty_cells(inCell)
%------------------------------------------------------------------------
% TytoLogy:Opto (should be in utilities eventually)
%------------------------------------------------------------------------
% 
% for an input cell array inCell, go through elements of inCell, check if
% element is empty and if it is, remove it.
% returns cleaned cell array and logical array that has TRUE for elements
% that are occupied and FALSE for elements that are empty
% 
%------------------------------------------------------------------------
% Input Arguments:
% 	inCell         sexually frustrated cell array that needs cleaning
%  occupiedBins   logical array indicating full (true) and empty (false)
%                 elements of inCell
%
% Output Arguments:
% 	outCell        inCell with empty elements removed
%
%------------------------------------------------------------------------
% See also: 
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Sharad J. Shanbhag
% sshanbhag@neomed.edu
%------------------------------------------------------------------------
% Created: 20 July, 2021 (SJS)
%
% Revisions:
%------------------------------------------------------------------------
% TO DO:
%------------------------------------------------------------------------

% create logical array to hold indicators for full (true) or empty (false)
% elements of inCell
occupiedBins = true(size(inCell));
% loop through elements of inCell
for c = 1:numel(inCell)
   % store locations of empty bins
   if isempty(inCell{c})
      occupiedBins(c) = false;
   end
end
% assign outputs
varargout{1} = inCell(occupiedBins);
varargout{2} = occupiedBins;