function handle = markAxes(fig, axes_all, marker, varargin)
    xShift = 0;
    yShift = 0;
    fontName = EasyPlot.DefaultValue.FontName;
    fontSize = EasyPlot.DefaultValue.FontSizeTitle;
    fontWeight = 'bold';
    marginLeft = EasyPlot.DefaultValue.AxesMarginLeft;
    marginRight = EasyPlot.DefaultValue.AxesMarginRight;
    marginTop = EasyPlot.DefaultValue.AxesMarginTop;
    marginBottom = EasyPlot.DefaultValue.AxesMarginBottom;

    if nargin>3
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'xShift')
                xShift = varargin{k+1};
            elseif strcmpi(varargin{k},'yShift')
                yShift = varargin{k+1};
            elseif strcmpi(varargin{k},'fontSize')
                fontSize = varargin{k+1};
            elseif strcmpi(varargin{k},'fontWeight')
                fontWeight = varargin{k+1};
            elseif strcmpi(varargin{k},'fontName')
                fontName = varargin{k+1};
            elseif strcmpi(varargin{k},'marginLeft')
                marginLeft = varargin{k+1};
            elseif strcmpi(varargin{k},'marginRight')
                marginRight = varargin{k+1};
            elseif strcmpi(varargin{k},'marginTop')
                marginTop = varargin{k+1};
            elseif strcmpi(varargin{k},'marginBottom')
                marginBottom = varargin{k+1};
            else
                error('Wrong argument!');
            end
        end
    end

    if ~iscell(axes_all)
        pos = zeros(1,4);
        pos(3) = 0.5;
        pos(4) = 0.5;
        pos(1) = axes_all.Position(1) - pos(3) + xShift;
        pos(2) = axes_all.Position(2) + axes_all.Position(4) + yShift;
        handle = annotation(fig,'textbox',...
            'Units','centimeters',...
            'Position',pos,...
            'EdgeColor','none',...
            'Units','centimeters',...
            'VerticalAlignment','bottom',...
            'String',marker,...
            'FontName',fontName,...
            'FontWeight',fontWeight,...
            'FontSize', fontSize,...
            'HorizontalAlignment','left',...
            'FitBoxToText','off');

        handle.UserData.MarginLeft = marginLeft;
        handle.UserData.MarginRight = marginRight;
        handle.UserData.MarginTop = marginTop;
        handle.UserData.MarginBottom = marginBottom;

        EasyPlot.addHandle(fig, handle);
        return
    end

    for k = 1:length(axes_all)
        pos = zeros(1,4);
        pos(3) = 1;
        pos(4) = 1;
        pos(1) = axes_all{k}.Position(1) - pos(3) + xShift;
        pos(2) = axes_all{k}.Position(2) + axes_all{k}.Position(4) + yShift;   
        handle(k) = annotation(fig,'textbox',...
            'Units','centimeters',...
            'Position',pos,...
            'EdgeColor','none',...
            'Units','centimeters',...
            'VerticalAlignment','bottom',...
            'String',marker{k},...
            'FontName',fontName,...
            'FontWeight',fontWeight,...
            'FontSize', fontSize,...
            'HorizontalAlignment','left',...
            'FitBoxToText','off');

        handle(k).UserData.MarginLeft = marginLeft;
        handle(k).UserData.MarginRight = marginRight;
        handle(k).UserData.MarginTop = marginTop;
        handle(k).UserData.MarginBottom = marginBottom;   

        EasyPlot.addHandle(fig, handle(k));
    end
end