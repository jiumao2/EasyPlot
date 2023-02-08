function handle = colorbar(axes, varargin)
    handle = colorbar(axes,...
        'Units', EasyPlot.DefaultValue.Units,...
        'FontName',EasyPlot.DefaultValue.FontName,...
        'FontSize',EasyPlot.DefaultValue.FontSize);

    handle.UserData.MarginLeft = EasyPlot.DefaultValue.AxesMarginLeft;
    handle.UserData.MarginRight = EasyPlot.DefaultValue.AxesMarginRight;
    handle.UserData.MarginTop = EasyPlot.DefaultValue.AxesMarginTop;
    handle.UserData.MarginBottom = EasyPlot.DefaultValue.AxesMarginBottom;

    cmap = EasyPlot.DefaultValue.Colormap;
    zeroCenter = false;

    if nargin>1
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k}, 'label')
                ylabel(handle,varargin{k+1});
            elseif strcmpi(varargin{k}, 'colormap')
                cmap = varargin{k+1};
            elseif strcmpi(varargin{k}, 'zeroCenter')
                zeroCenter = varargin{k+1};
            elseif strcmpi(varargin{k},'MarginLeft')
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
                error('Wrong argument!');
            end
        end
    end

    if zeroCenter
        cLim = axes.CLim;
        cmap(1:round((2*EasyPlot.DefaultValue.ColormapDivergingWhitePosition-1)*size(cmap,1)),:) = [];
        if cLim(2) > -cLim(1)
            percentCmap = (cLim(2)-cLim(1))./(2*cLim(2));
            cmap = cmap(round(size(cmap,1)*(1-percentCmap)):end,:);
        elseif cLim(2) < -cLim(1)
            percentCmap = (cLim(2)-cLim(1))./(2*-cLim(1));
            cmap = cmap(1:round(size(cmap,1)*percentCmap),:);
        end
    end

    colormap(axes, cmap);
end