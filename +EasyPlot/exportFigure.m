function exportFigure(fig, filename, varargin)
    type = EasyPlot.DefaultValue.ExportFormattype;
    dpi = EasyPlot.DefaultValue.ExportDPI;
    if nargin > 2
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'type')
                type = varargin{k+1};
            elseif strcmpi(varargin{k},'dpi')
                dpi = varargin{k+1};
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

    resolution = ['-r',num2str(dpi)];

    renderer = fig.Renderer;
    set(fig,'Renderer','painters');
    print(fig,filename,formattype,resolution);
    set(fig,'Renderer',renderer);
end