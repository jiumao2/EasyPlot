Getting Started
===============

This page shows the fastest way to start writing EasyPlot figures with regular
MATLAB scripts.

Installation
------------

1. Download this repository.
2. Add the ``EasyPlot`` folder to your MATLAB path.
3. Run ``scripts/publication_workflow_example.m``.

First Figure in 60 Seconds
--------------------------

.. code-block:: matlab

   fig = EasyPlot.figure();
   ax = EasyPlot.axes(fig);
   x = 0:0.01:2*pi;
   plot(ax, x, sin(x), 'LineWidth', 1.5);
   xlabel(ax, 'X');
   ylabel(ax, 'sin(X)');
   EasyPlot.cropFigure(fig);
   EasyPlot.exportFigure(fig, 'quickstart.png');

Practical plotting pattern
--------------------------

The most useful EasyPlot habit is this:

1. create the figure and axes with EasyPlot,
2. draw data with ordinary MATLAB plotting commands,
3. refine layout and annotations with EasyPlot,
4. crop and export at the end.

Use the axis handle as the first argument when plotting:

.. code-block:: matlab

   plot(ax, x, y)
   scatter(ax, x, y)
   imagesc(ax, x_axis, y_axis, value_map)
   histogram(ax, values)
   bar(ax, categories, values)

Practical rules
---------------

- Prefer EasyPlot figure and axes constructors over raw MATLAB ``figure`` and ``subplot``.
- Keep plotting calls attached to explicit axis handles.
- Set labels, limits, ticks, and color limits explicitly when the figure matters.
- Use EasyPlot layout helpers when the figure has multiple panels.
- Inspect the rendered figure and refine spacing before final export.

Using Codex and Claude
----------------------

This repo includes a local skill for publication-ready EasyPlot MATLAB figures:
``skills/EasyPlot-MATLAB``.

For Codex:

- Use ``$easyplot-matlab``.
- Example: ``Use $easyplot-matlab to write a publication-ready EasyPlot MATLAB script with explicit labels, no overlaps, and PNG/PDF export into Figure.``

For Claude:

- Ask Claude to read ``skills/EasyPlot-MATLAB/SKILL.md`` and follow it.
- Example: ``Read and follow skills/EasyPlot-MATLAB/SKILL.md. Write a long linear EasyPlot MATLAB script for a publication-ready multi-panel figure with explicit labels, scales, and overlap-free layout.``

Where to go next
----------------

- Start with :doc:`tutorials/publication-workflow` for the clearest end-to-end figure workflow.
- Then continue with :doc:`tutorials/index` for focused layout, shared-axis, and export examples.
- Browse :doc:`api/index` when you need a specific EasyPlot function.
