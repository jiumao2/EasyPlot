function setXLabelRow(all_axes, label, varargin)
%SETXLABELROW Set x-labels for a row of axes with reduced redundancy.
% Syntax:
%   EasyPlot.setXLabelRow(allAxes, label, Name, Value, ...)
% Inputs:
%   allAxes: Row-like collection of axes handles.
%   label: X-axis label text.
% Outputs:
%   None.
% Example:
%   EasyPlot.setXLabelRow({ax1, ax2, ax3}, 'Time (s)');
% See also: EasyPlot.setYLabelColumn, EasyPlot.setGeneralXLabel, xlabel
    if ~iscell(all_axes)
        xlabel(all_axes, label, varargin{:});
        return
    end

    for k = 1:length(all_axes)
        xlabel(all_axes{k}, label, varargin{:});
    end
end
