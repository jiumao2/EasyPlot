# EasyPlot
Easier to make scientific figures with MATLAB
## Highlights  
- Similiar to the MATLAB grammar
- Support for auto-completion
- Much easier to layout multiple axes in a single figure
- Multiple functions frequently used in scientific figures
## Installation
- Download the repository and add the folder to your MATLAB path
- Use the codes simply by enter `EasyPlot.` and choose the function you want (using auto-completion)

## A simple example
- A figure with 2 heatmaps  
```matlab
% create two 10x10 matrices
x1 = rand(10)-0.3;
x2 = rand(10)-0.7;

% create a figure with two axes
fig = EasyPlot.figure();
ax1 = EasyPlot.axes(fig,...
    'Height', 3,... % in centimeters
    'Width', 3,...
    'MarginBottom', 0.8);
ax2 = EasyPlot.createAxesAgainstAxes(fig, ax1, 'right',...
    'YAxisVisible', 'off');

% plot the matrices
imagesc(ax1, x1);
imagesc(ax2, x2);

% set xlabel and ylabel
EasyPlot.setXLabelRow({ax1, ax2}, 'X');
EasyPlot.setYLabelRow({ax1, ax2}, 'Y');

% set the limits of the axes
EasyPlot.setXLim({ax1, ax2}, [0.5,10.5]);
EasyPlot.setYLim({ax1, ax2}, [0.5,10.5]);
EasyPlot.setCLim({ax1, ax2}, 'largest');

% set the colormap and colorbar
EasyPlot.colormap(ax1, EasyPlot.ColorMap.Diverging.seismic)
EasyPlot.colorbar(ax2,...
    'colormap', EasyPlot.ColorMap.Diverging.seismic,...
    'zeroCenter','on',... % let white = 0
    'label', 'Color bar',...
    'MarginRight', 1);

% Mark the axes
EasyPlot.markAxes(fig, {ax1, ax2}, {'A','B'},...
    'xShift', 0.5,...
    'MarginTop', 0);

% export the figure
EasyPlot.cropFigure(fig);
EasyPlot.exportFigure(fig, 'test.png');
```  
![test.png](./doc/test.png)

## Documentation
- To be constructed
