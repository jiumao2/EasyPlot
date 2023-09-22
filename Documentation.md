# EasyPlot documentation  
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
- [EasyPlot documentation](#easyplot-documentation)
  - [Basic usage](#basic-usage)
    - [Layouts](#layouts)
    - [Create figures / axes](#create-figures--axes)
    - [Axes methods](#axes-methods)
      - [[xyc]Lim methods](#xyclim-methods)
      - [[xy]label methods](#xylabel-methods)
      - [[xy]ticks methods](#xyticks-methods)
      - [Move axes](#move-axes)
      - [Using `set`](#using-set)
      - [Truncate axes](#truncate-axes)
    - [Plotting methods](#plotting-methods)
    - [Colormaps](#colormaps)
    - [Default settings](#default-settings)
    - [Export](#export)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
## Basic usage  

### Layouts
- Every axes has 4 extra properties: `MarginLeft`, `MarginRight`, `MarginTop`, `MarginBottom`, which are similar to `HTML` web pages.
- Crop the figure to set the figure size. Always do it at the end of the code.
```matlab
EasyPlot.cropFigure(fig);
```

### Create figures / axes  
- When creating new figures / axes, please use `EasyPlot` methods instead of raw MATLAB methods.
Example:
```matlab
% Create a new figure
fig = EasyPlot.figure();
% Create a new axes
ax = EasyPlot.axes(fig);
% Create a colorbar
cbar = EasyPlot.colorbar(ax);
% Create an annotation
ann = EasyPlot.annotation(fig, 'arrow');
```
- EasyPlot provides some convenient methods to create axes.  
```matlab
% Create grid axes of 2 rows and 3 columns
ax_all = EasyPlot.createGridAxes(fig, 2, 3); % ax_all is a 2x3 cell array

% Create a new axes at the right of an existing axes
ax_right = EasyPlot.createRightAxes(ax, 0.2); % ax_right is a new axes object with the same width, height and margin as ax

% Mark the current axes with 'A', 'B', 'C'...
marks = EasyPlot.markAxes(ax_all, {'A', 'B', 'C'});
```

### Axes methods
- All MATLAB axes methods are supported, while some extra methods are created for convenience.  

#### [xyc]Lim methods  
```matlab
% Sometimes you need to set the same limits for multiple axes
EasyPlot.setYLim({ax1, ax2}, [0, 1]);
% You may want to set the limits to the maximum and minimum values of the data
EasyPlot.setYLim({ax1, ax2}, 'Largest');
```

#### [xy]label methods  
```matlab
% Sometimes you need to set the same labels for multiple axes
% For a column of axes, you may want to set the y label for all the axes
EasyPlot.setYLabelColumn({ax1, ax2, ax3}, 'Y label'); % ax1, ax2, ax3 are in a column
% For a row of axes, you may want to set the y label for only the leftmost axes
EasyPlot.setYLabelRow({ax1, ax2, ax3}, 'Y label'); % ax1, ax2, ax3 are in a row
```
- You may want to hide the x/y axes to avoid redundancy.
```matlab
EasyPlot.HideYAxis({ax1, ax2});
% Also you can do it when creating the axes
ax = EasyPlot.axes(fig, 'YAxisVisible', 'off');
```
- You may want to set only one label in the middle instead of setting labels for all the axes.
```matlab
EasyPlot.setGeneralXLabel({ax1, ax2, ax3}, 'X label');
% Also you can set a general title
EasyPlot.setGeneralTitle({ax1, ax2, ax3}, 'Title');
```

#### [xy]ticks methods
```matlab
% set the y ticks for multiple axes
EasyPlot.setYTicks({ax1, ax2, ax3}, [0, 1, 2]);
```

#### Move axes
```matlab
% Move the axes to the right by 1 cm
EasyPlot.moveAxes(ax, 'dx', 1);
% move the axes downwards by 2 cm
EasyPlot.moveAxes(ax, 'dy', -2);
```

#### Using `set`
- To set the properties of multiple axes together, or the margin of the axes, use `EasyPlot.set` instead of MATLAB `set`.
```matlab
EasyPlot.set({ax1, ax2, ax3}, 'MarginLeft', 0.8, 'MarginBottom', 0.8);
```

#### Truncate axes
- The code are adapted from [here](https://zhuanlan.zhihu.com/p/553375031).
- To induce a break at the axis and generate two separate axes.
```matlab
[ax_new1, ax_new2] = EasyPlot.truncateAxes(ax, 'x', [1,2]); % remove the x data between 1 and 2 from the axes
```

### Plotting methods
- All plotting methods are the same as MATLAB, such as `plot`, `scatter`, `histogram`......
- Do not add `EasyPlot` before these plotting methods.

### Colormaps
- EasyPlot adapts the colormaps from Matplotlib 3.0.  
```matlab
cmap = EasyPlot.ColorMap.Diverging.seismic(n); % n is the number of colors
```  
- You can check the cheetsheet easily to select the proper colormap.  
```matlab
EasyPlot.ColorMap.showCheetSheet();
```  
- Sometimes you need to set 0 as the center of the colormap.  
```matlab
EasyPlot.colormap(ax, cmap, 'zeroCenter', 'on');
% Also you can do it when creating a colorbar
EasyPlot.colorbar(ax, 'colormap', cmap, 'zeroCenter', 'on');
```

### Default settings  
- Scientific figures have different requirements from other figures.
- The default values are defined in `EasyPlot.DefaultValue` class. Modify it if you have different preferences.  
```matlab
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
Colororder = colororder;

% Line
LineWidth = 0.5;

% Export
ExportFormattype = 'png';
ExportDPI = 1200;
```

### Export
- EasyPlot provides a convenient method to export figures with various formats and DPIs.    
```matlab  
EasyPlot.exportFigure(fig, filename, 'type', 'png', 'dpi', 600);
```
