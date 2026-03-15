function setYLabelColumn(all_axes, label, varargin)
%SETYLABELCOLUMN Set y-labels for a column of axes with reduced redundancy.
% Syntax:
%   EasyPlot.setYLabelColumn(allAxes, label, Name, Value, ...)
% Inputs:
%   allAxes: Column-like collection of axes handles.
%   label: Y-axis label text.
% Outputs:
%   None.
% Example:
%   EasyPlot.setYLabelColumn({ax1; ax2; ax3}, 'Amplitude');
% See also: EasyPlot.setXLabelRow, EasyPlot.setGeneralYLabel, ylabel
    if ~iscell(all_axes)
        ylabel(all_axes, label, varargin{:});
        return
    end
    
    for k = 1:length(all_axes)
        ylabel(all_axes{k},label, varargin{:});
    end
end
