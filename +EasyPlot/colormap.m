function colormap(axes_all, cmap, varargin)
    zeroCenter = 'off';
    if nargin > 2
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'zeroCenter')
                zeroCenter = varargin{k+1};
            else
                error('Unknown argument!');
            end
        end
    end
    if ~iscell(axes_all)
        if strcmpi(zeroCenter, 'on')
            cLim = axes_all.CLim;
            cmap(1:round((2*EasyPlot.DefaultValue.ColormapDivergingWhitePosition-1)*size(cmap,1)),:) = [];
            if cLim(2) > -cLim(1)
                percentCmap = (cLim(2)-cLim(1))./(2*cLim(2));
                cmap = cmap(round(size(cmap,1)*(1-percentCmap)):end,:);
            elseif cLim(2) < -cLim(1)
                percentCmap = (cLim(2)-cLim(1))./(2*-cLim(1));
                cmap = cmap(1:round(size(cmap,1)*percentCmap),:);
            end
        end
        colormap(axes_all, cmap);
    else
        cmap_raw = cmap;
        for k = 1:size(axes_all,1)
            for j = 1:size(axes_all,2)
                if strcmpi(zeroCenter, 'on')
                    cmap = cmap_raw;
                    cLim = axes_all{k,j}.CLim;
                    cmap(1:round((2*EasyPlot.DefaultValue.ColormapDivergingWhitePosition-1)*size(cmap,1)),:) = [];
                    if cLim(2) > -cLim(1)
                        percentCmap = (cLim(2)-cLim(1))./(2*cLim(2));
                        cmap = cmap(round(size(cmap,1)*(1-percentCmap)):end,:);
                    elseif cLim(2) < -cLim(1)
                        percentCmap = (cLim(2)-cLim(1))./(2*-cLim(1));
                        cmap = cmap(1:round(size(cmap,1)*percentCmap),:);
                    end
                end
                colormap(axes_all{k,j}, cmap);
            end
        end
    end  
end
