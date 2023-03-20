classdef DefaultValue
    %DefaultValue Some default values for EasyPlot

    properties(Constant)
        % General
        Units = 'centimeters';
        NextPlot = 'add';
        Renderer = 'opengl';

        % Margin
        FigureMarginLeft = 0.3;
        FigureMarginRight = 0.3;
        FigureMarginTop = 0.3;
        FigureMarginBottom = 0.3;
        AxesMarginLeft = 0.3;
        AxesMarginRight = 0.3;
        AxesMarginTop = 0.3;
        AxesMarginBottom = 0.3;

        % Font
        FontName = 'Arial';
        FontSizeTitle = 12;
        FontSize = 8;
        FontWeight = 'normal';

        % Color
        Colormap = parula;
        ColormapDiverging = EasyPlot.ColorMap.Diverging.seismic;
        ColormapDivergingWhitePosition = 133/256;

        % Export
        ExportFormattype = 'png';
        ExportDPI = 1200;
    end
end