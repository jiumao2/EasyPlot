function handle = createAxesAgainstAxes(fig, ax, location, varargin)
    handle = EasyPlot.axes(fig,...
        "Width", ax.Position(3),...
        "Height", ax.Position(4));
    handle.UserData.MarginLeft = EasyPlot.DefaultValue.AxesMarginLeft;
    handle.UserData.MarginRight = EasyPlot.DefaultValue.AxesMarginRight;
    handle.UserData.MarginTop = EasyPlot.DefaultValue.AxesMarginTop;
    handle.UserData.MarginBottom = EasyPlot.DefaultValue.AxesMarginBottom;
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
            else
                set(handle,varargin{k},varargin{k+1});
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
        handle.Position(2) = ax.Position(2) + ax.UserData.MarginTop + handle.UserData.MarginBottom + handle.Position(4);
    elseif strcmpi(location,'bottom')
        handle.Position(1) = ax.Position(1);
        handle.Position(2) = ax.Position(2) - ax.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    elseif strcmpi(location,'leftTop')
        handle.Position(1) = ax.Position(1) - ax.UserData.MarginLeft - handle.UserData.MarginRight - handle.Position(3);
        handle.Position(2) = ax.Position(2) + ax.UserData.MarginTop + handle.UserData.MarginBottom + handle.Position(4);
    elseif strcmpi(location,'rightTop')
        handle.Position(1) = ax.Position(1) + ax.Position(3) + ax.UserData.MarginRight + handle.UserData.MarginLeft;
        handle.Position(2) = ax.Position(2) + ax.UserData.MarginTop + handle.UserData.MarginBottom + handle.Position(4);
    elseif strcmpi(location, 'leftBottom')
        handle.Position(1) = ax.Position(1) - ax.UserData.MarginLeft - handle.UserData.MarginRight - handle.Position(3);
        handle.Position(2) = ax.Position(2) - ax.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    elseif strcmpi(location,'rightBottom')
        handle.Position(1) = ax.Position(1) + ax.Position(3) + ax.UserData.MarginRight + handle.UserData.MarginLeft;
        handle.Position(2) = ax.Position(2) - ax.Position(4) - ax.UserData.MarginBottom - handle.UserData.MarginTop;
    end
end