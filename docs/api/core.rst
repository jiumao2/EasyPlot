Core API Overview
=================

This page lists EasyPlot APIs by category and summarizes what each function does.

Figure and Axes Creation
------------------------

- ``EasyPlot.figure``: Create a figure with EasyPlot defaults and margin metadata.
- ``EasyPlot.axes``: Create an axes with EasyPlot defaults and margin support.
- ``EasyPlot.annotation``: Create an annotation in the EasyPlot-managed figure context.
- ``EasyPlot.createGridAxes``: Create a 2D cell array of axes in a regular grid.
- ``EasyPlot.createAxesAgainstAxes``: Create a new axes relative to an existing axes.
- ``EasyPlot.createAxesAgainstFigure``: Create a new axes relative to figure boundaries.
- ``EasyPlot.copyAxes``: Duplicate one axes or axes groups to another relative location.

Layout and Positioning
----------------------

- ``EasyPlot.align``: Align axes/groups to a reference by edge or center.
- ``EasyPlot.place``: Place axes/groups adjacent to a reference axes/group.
- ``EasyPlot.move``: Shift axes/groups/handles by ``dx`` and ``dy``.
- ``EasyPlot.setMargin``: Set margin properties for axes/figure objects.
- ``EasyPlot.markAxes``: Add panel markers (for example A/B/C) to axes.

Batch Property and Axis Utilities
---------------------------------

- ``EasyPlot.set``: Set regular and EasyPlot-specific properties on one/many axes.
- ``EasyPlot.HideXAxis``: Hide x-axis visuals for one/many axes.
- ``EasyPlot.HideYAxis``: Hide y-axis visuals for one/many axes.

Shared Limits
-------------

- ``EasyPlot.setXLim``: Set shared x-limits or compute from the largest range.
- ``EasyPlot.setYLim``: Set shared y-limits or compute from the largest range.
- ``EasyPlot.setZLim``: Set shared z-limits or compute from the largest range.
- ``EasyPlot.setCLim``: Set shared color limits or compute from the largest range.

Labels, Titles, and Ticks for Multiple Axes
--------------------------------------------

- ``EasyPlot.xlabel``: Apply MATLAB-style ``xlabel`` to one/many axes.
- ``EasyPlot.ylabel``: Apply MATLAB-style ``ylabel`` to one/many axes.
- ``EasyPlot.zlabel``: Apply MATLAB-style ``zlabel`` to one/many axes.
- ``EasyPlot.title``: Apply MATLAB-style ``title`` to one/many axes.
- ``EasyPlot.setGeneralTitle``: Add one shared title for an axes group.
- ``EasyPlot.setGeneralXLabel``: Add one shared x-label for an axes group.
- ``EasyPlot.setGeneralYLabel``: Add one shared y-label for an axes group.
- ``EasyPlot.setXLabelRow``: Label x-axis by row-aware logic.
- ``EasyPlot.setXLabelColumn``: Label x-axis by column-aware logic.
- ``EasyPlot.setYLabelRow``: Label y-axis by row-aware logic.
- ``EasyPlot.setYLabelColumn``: Label y-axis by column-aware logic.
- ``EasyPlot.xticks``: Set x-tick values on one/many axes.
- ``EasyPlot.yticks``: Set y-tick values on one/many axes.
- ``EasyPlot.zticks``: Set z-tick values on one/many axes.
- ``EasyPlot.xticklabels``: Set x-tick labels on one/many axes.
- ``EasyPlot.yticklabels``: Set y-tick labels on one/many axes.
- ``EasyPlot.zticklabels``: Set z-tick labels on one/many axes.
- ``EasyPlot.xtickangle``: Set x-tick text angle on one/many axes.
- ``EasyPlot.ytickangle``: Set y-tick text angle on one/many axes.
- ``EasyPlot.ztickangle``: Set z-tick text angle on one/many axes.
- ``EasyPlot.setXTicks``: Convenience wrapper for batch x-tick setting.
- ``EasyPlot.setYTicks``: Convenience wrapper for batch y-tick setting.
- ``EasyPlot.setZTicks``: Convenience wrapper for batch z-tick setting.
- ``EasyPlot.setXTicksAndLabels``: Set x-ticks and x-tick labels together.
- ``EasyPlot.setYTicksAndLabels``: Set y-ticks and y-tick labels together.
- ``EasyPlot.setZTicksAndLabels``: Set z-ticks and z-tick labels together.

Color and Legend Utilities
--------------------------

- ``EasyPlot.colormap``: Apply colormaps to one/many axes with optional zero-centering.
- ``EasyPlot.colorbar``: Create a layout-aware colorbar with EasyPlot controls.
- ``EasyPlot.legend``: Create and style legends with EasyPlot convenience parameters.

Special Plotting Helpers
------------------------

- ``EasyPlot.plotShaded``: Draw a shaded interval region around/along a curve.
- ``EasyPlot.boundedLine``: Plot line plus bounded error region.
- ``EasyPlot.scalebar``: Draw x/y scale bars with labels and style control.
- ``EasyPlot.significanceLine``: Add statistical significance connector annotations.
- ``EasyPlot.violinplot``: Draw violin plots in EasyPlot workflows.
- ``EasyPlot.venn``: Draw Venn diagrams.
- ``EasyPlot.stairs``: Compatibility wrapper for stairs plotting.
- ``EasyPlot.boxplot``: Compatibility wrapper for boxplot usage with EasyPlot.
- ``EasyPlot.truncAxis``: Truncate/break axis display around a specified range.

Export and Finalization
-----------------------

- ``EasyPlot.cropFigure``: Crop figure canvas tightly around content and margins.
- ``EasyPlot.exportFigure``: Export figure to image/PDF with EasyPlot defaults.

ColorMap Package
----------------

Core ColorMap functions
~~~~~~~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.parula``: Return EasyPlot's parula-style colormap.
- ``EasyPlot.ColorMap.showCheetSheet``: Show the colormap cheatsheet figure.

Diverging colormaps
~~~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.Diverging.BrBG``: Brown-BlueGreen diverging map.
- ``EasyPlot.ColorMap.Diverging.bwr``: Blue-White-Red diverging map.
- ``EasyPlot.ColorMap.Diverging.coolwarm``: Cool-Warm diverging map.
- ``EasyPlot.ColorMap.Diverging.PiYG``: Pink-YellowGreen diverging map.
- ``EasyPlot.ColorMap.Diverging.PRGn``: Purple-Green diverging map.
- ``EasyPlot.ColorMap.Diverging.PuOr``: Purple-Orange diverging map.
- ``EasyPlot.ColorMap.Diverging.RdBu``: Red-Blue diverging map.
- ``EasyPlot.ColorMap.Diverging.RdGy``: Red-Gray diverging map.
- ``EasyPlot.ColorMap.Diverging.RdYlBu``: Red-Yellow-Blue diverging map.
- ``EasyPlot.ColorMap.Diverging.RdYlGn``: Red-Yellow-Green diverging map.
- ``EasyPlot.ColorMap.Diverging.seismic``: Seismic-style diverging map.
- ``EasyPlot.ColorMap.Diverging.Spectral``: Spectral diverging map.

Sequential colormaps
~~~~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.Sequential.Blues``: Blue sequential map.
- ``EasyPlot.ColorMap.Sequential.BuGn``: Blue-Green sequential map.
- ``EasyPlot.ColorMap.Sequential.BuPu``: Blue-Purple sequential map.
- ``EasyPlot.ColorMap.Sequential.GnBu``: Green-Blue sequential map.
- ``EasyPlot.ColorMap.Sequential.Greens``: Green sequential map.
- ``EasyPlot.ColorMap.Sequential.Oranges``: Orange sequential map.
- ``EasyPlot.ColorMap.Sequential.OrRd``: Orange-Red sequential map.
- ``EasyPlot.ColorMap.Sequential.PuBu``: Purple-Blue sequential map.
- ``EasyPlot.ColorMap.Sequential.PuBuGn``: Purple-BlueGreen sequential map.
- ``EasyPlot.ColorMap.Sequential.PuRd``: Purple-Red sequential map.
- ``EasyPlot.ColorMap.Sequential.Purples``: Purple sequential map.
- ``EasyPlot.ColorMap.Sequential.RdPu``: Red-Purple sequential map.
- ``EasyPlot.ColorMap.Sequential.Reds``: Red sequential map.
- ``EasyPlot.ColorMap.Sequential.YlGn``: Yellow-Green sequential map.
- ``EasyPlot.ColorMap.Sequential.YlGnBu``: Yellow-GreenBlue sequential map.
- ``EasyPlot.ColorMap.Sequential.YlOrBr``: Yellow-OrangeBrown sequential map.
- ``EasyPlot.ColorMap.Sequential.YlOrRd``: Yellow-OrangeRed sequential map.

Qualitative colormaps
~~~~~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.Qualitative.Accent``: Accent qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Dark2``: Dark2 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Paired``: Paired qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Pastel1``: Pastel1 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Pastel2``: Pastel2 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Set1``: Set1 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Set2``: Set2 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.Set3``: Set3 qualitative palette.
- ``EasyPlot.ColorMap.Qualitative.tab10``: Tab10 categorical palette.
- ``EasyPlot.ColorMap.Qualitative.tab20``: Tab20 categorical palette.
- ``EasyPlot.ColorMap.Qualitative.tab20b``: Tab20b categorical palette.
- ``EasyPlot.ColorMap.Qualitative.tab20c``: Tab20c categorical palette.

Uniform colormaps
~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.Uniform.cividis``: Cividis perceptually uniform map.
- ``EasyPlot.ColorMap.Uniform.inferno``: Inferno perceptually uniform map.
- ``EasyPlot.ColorMap.Uniform.magma``: Magma perceptually uniform map.
- ``EasyPlot.ColorMap.Uniform.plasma``: Plasma perceptually uniform map.
- ``EasyPlot.ColorMap.Uniform.viridis``: Viridis perceptually uniform map.

Miscellaneous colormaps
~~~~~~~~~~~~~~~~~~~~~~~

- ``EasyPlot.ColorMap.Miscellaneous.cubehelix``: Cubehelix colormap.
- ``EasyPlot.ColorMap.Miscellaneous.ocean``: Ocean colormap.
- ``EasyPlot.ColorMap.Miscellaneous.rainbow``: Rainbow colormap.
- ``EasyPlot.ColorMap.Miscellaneous.terrain``: Terrain colormap.
- ``EasyPlot.ColorMap.Miscellaneous.twilight``: Twilight colormap.

QuickPlot Package
-----------------

- ``EasyPlot.QuickPlot.PSTH``: Quick peristimulus time histogram plotting helper.
- ``EasyPlot.QuickPlot.rasterPlot``: Quick raster plot helper.
- ``EasyPlot.QuickPlot.printChessboard``: Render/print a chessboard-style utility plot.

In-MATLAB Help
--------------

Function-level documentation is available directly in MATLAB:

.. code-block:: matlab

   help EasyPlot.createGridAxes
   help EasyPlot.scalebar
   help EasyPlot.plotShaded
