function exportFigure(fig, filename, varargin)
    type = EasyPlot.DefaultValue.ExportFormattype;
    dpi = EasyPlot.DefaultValue.ExportDPI;
    figColor = [1,1,1];
    if nargin > 2
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'type')
                type = varargin{k+1};
            elseif strcmpi(varargin{k},'dpi')
                dpi = varargin{k+1};
            elseif strcmpi(varargin{k},'figColor')
                figColor = varargin{k+1};
            else
                error('Unknown argument!')
            end
        end
    end
    if strcmpi(type,'png')
        formattype = '-dpng';
    elseif strcmpi(type,'jpg')
        formattype = '-djepg';
    elseif strcmpi(type,'pdf')
        formattype = '-dpdf';
    elseif strcmpi(type,'bmp')
        formattype = '-dbmp';
    elseif strcmpi(type,'eps')
        formattype = '-depsc';
    elseif strcmpi(type,'tiff')
        formattype = '-dtiff';
    elseif strcmpi(type,'tiffRaw')
        formattype = '-dtiffn';
    else
        error('Unknown format type!')
    end

    resolution = ['-r', num2str(dpi)];

    renderer = fig.Renderer;
    set(fig, 'Renderer', 'painters');
    set(fig, 'InvertHardCopy', 'Off');
    set(fig, 'PaperPosition', fig.Position);

    % check if the paper can contain the figure
    screenSize = get(0, 'ScreenSize');
    screenPixelsPerInch = get(0, 'ScreenPixelsPerInch');
    screenWidth = screenSize(3)./screenPixelsPerInch*2.54;
    screenHeight = screenSize(4)./screenPixelsPerInch*2.54;
    if fig.OuterPosition(3) > screenWidth || fig.OuterPosition(4) > screenHeight
        warning('The figure is larger than the screen. The figure will be cropped!');
    end

    figColorRaw = fig.Color;
    set(fig, 'Color', figColor);
    print(fig, filename, formattype, resolution);

    set(fig, 'Renderer', renderer);
    set(fig, 'Color', figColorRaw);
end