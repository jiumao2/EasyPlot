function handle = createAxesAgainstAxes(fig, ax, location, varargin)
%CREATEAXESAGAINSTAXES Create a new axes adjacent to a reference axes.
% Syntax:
%   axNew = EasyPlot.createAxesAgainstAxes(fig, axRef, location, Name, Value, ...)
% Inputs:
%   fig: Figure handle.
%   axRef: Reference axes handle.
%   location: 'left', 'right', 'top', or 'bottom'.
% Outputs:
%   axNew: New axes handle with inherited size/margins from reference axes.
% Example:
%   ax2 = EasyPlot.createAxesAgainstAxes(fig, ax1, 'right', 'YAxisVisible', 'off');
% See also: EasyPlot.place, EasyPlot.copyAxes, EasyPlot.axes
    handle = EasyPlot.axes(fig,...
        "Width", ax.Position(3),...
        "Height", ax.Position(4));
    if nargin > 3
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'MarginLeft')
                handle.UserData.MarginLeft = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginRight')
                handle.UserData.MarginRight = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginTop')
                handle.UserData.MarginTop = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginBottom')
                handle.UserData.MarginBottom = varargin{k+1};
            elseif strcmpi(varargin{k},'Width')
                handle.Position(3) = varargin{k+1};
            elseif strcmpi(varargin{k},'Height')
                handle.Position(4) = varargin{k+1};
            elseif strcmpi(varargin{k},'XAxisVisible')
                handle.XAxis.Visible = varargin{k+1};
            elseif strcmpi(varargin{k},'YAxisVisible')
                handle.YAxis.Visible = varargin{k+1};
            else
                EasyPlot.set(handle,varargin{k},varargin{k+1});
            end
        end
    end

    if strcmpi(location,'left')
        handle.Position(1) = ax.Position(1) - ax.UserData.MarginLeft - handle.UserData.MarginRight - handle.Position(3);
        handle.Position(2) = ax.Position(2);
    elseif strcmpi(location,'right')
        handle.Position(1) = ax.Position(1) + ax.Position(3) + ax.UserData.MarginRight + handle.UserData.MarginLeft;
        handle.Position(2) = ax.Position(2);
    elseif strcmpi(location,'top')
        handle.Position(1) = ax.Position(1);
        handle.Position(2) = ax.Position(2) + ax.Position(4) + ax.UserData.MarginTop + handle.UserData.MarginBottom;
    elseif strcmpi(location,'bottom')
        handle.Position(1) = ax.Position(1);
        handle.Position(2) = ax.Position(2) - handle.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    elseif strcmpi(location,'leftTop')
        handle.Position(1) = ax.Position(1) - ax.UserData.MarginLeft - handle.UserData.MarginRight - handle.Position(3);
        handle.Position(2) = ax.Position(2) + ax.Position(4) + ax.UserData.MarginTop + handle.UserData.MarginBottom;
    elseif strcmpi(location,'rightTop')
        handle.Position(1) = ax.Position(1) + ax.Position(3) + ax.UserData.MarginRight + handle.UserData.MarginLeft;
        handle.Position(2) = ax.Position(2) + ax.Position(4) + ax.UserData.MarginTop + handle.UserData.MarginBottom;
    elseif strcmpi(location, 'leftBottom')
        handle.Position(1) = ax.Position(1) - ax.UserData.MarginLeft - handle.UserData.MarginRight - handle.Position(3);
        handle.Position(2) = ax.Position(2) - handle.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    elseif strcmpi(location,'rightBottom')
        handle.Position(1) = ax.Position(1) + ax.Position(3) + ax.UserData.MarginRight + handle.UserData.MarginLeft;
        handle.Position(2) = ax.Position(2) - handle.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    else
        error('Wrong location!');
    end
end
