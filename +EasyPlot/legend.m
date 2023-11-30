function handle = legend(ax, legendNames, varargin)
    fontName = EasyPlot.DefaultValue.FontName;
    fontSize = EasyPlot.DefaultValue.FontSize;
    fontWeight = EasyPlot.DefaultValue.FontWeight;
    marginLeft = 0;
    marginRight = 0;
    marginTop = 0;
    marginBottom = 0;
    location = 'NorthEast';
    selectedPlots = [];
    Box = 'off';

    if nargin > 2
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'Location')
                location = varargin{k+1};
            elseif strcmpi(varargin{k},'selectedPlots')
                selectedPlots = varargin{k+1};
            elseif strcmpi(varargin{k},'Box')
                Box = varargin{k+1};
            end
        end
    end    

    if isempty(selectedPlots)   
        handle = legend(ax, legendNames,...
            'Location', location,...
            'Box', Box,...
            'Units', EasyPlot.DefaultValue.Units,...
            'FontName', fontName,...
            'FontSize', fontSize,...
            'FontWeight', fontWeight);
    else
        handle = legend(ax, selectedPlots, legendNames,...
            'Location', location,...
            'Box', Box,...
            'Units', EasyPlot.DefaultValue.Units,...
            'FontName', fontName,...
            'FontSize', fontSize,...
            'FontWeight', fontWeight);
    end

    if nargin > 2
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'MarginLeft')
                marginLeft = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginRight')
                marginRight = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginTop')
                marginTop = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginBottom')
                marginBottom = varargin{k+1};
            elseif strcmpi(varargin{k},'Location')
                
            elseif strcmpi(varargin{k},'selectedPlots')

            elseif strcmpi(varargin{k},'Box')

            else
                EasyPlot.set(handle,varargin{k},varargin{k+1});
            end
        end
    end

    position_raw = handle.Position;
    handle.Location = 'None';
    handle.Position = position_raw;

    handle.UserData.MarginLeft = marginLeft;
    handle.UserData.MarginRight = marginRight;
    handle.UserData.MarginTop = marginTop;
    handle.UserData.MarginBottom = marginBottom;

end