# Figure Workflow

Use this reference when writing or revising EasyPlot figure code.

## Canonical sequence
1. Clean setup block.
2. Create visible EasyPlot figure.
3. Build layout first.
4. Plot data on explicit axes handles.
5. Set scales, ticks, labels, and titles explicitly.
6. Add legend, colorbar, scalebar, and panel marks only if needed.
7. Refine spacing with `EasyPlot.move`, `EasyPlot.align`, and `EasyPlot.place`.
8. Crop and export PNG and PDF.

## Default figure pattern
- `clear; clc;`
- define output folder under `Figure`
- `assert(~isempty(which('EasyPlot.figure')), 'EasyPlot not found on MATLAB path')`
- `fig = EasyPlot.figure('Visible', 'on')`
- `ax_grid = EasyPlot.createGridAxes(...)`
- optional attached axes with `EasyPlot.createAxesAgainstAxes(...)`
- grouped axes stored in cell arrays
- MATLAB plotting calls attached to those axes
- explicit axis limits, ticks, labels, and titles
- `EasyPlot.legend`, `EasyPlot.colorbar`, `EasyPlot.scalebar`, `EasyPlot.markAxes` as needed
- manual repositioning of annotations
- `EasyPlot.cropFigure(fig)`
- `EasyPlot.exportFigure(...png)` and `EasyPlot.exportFigure(...pdf)`

## Style defaults
- long linear script
- no helper functions by default
- EasyPlot-first layout and export
- MATLAB marks only on EasyPlot axes
- `FontSize` 7 baseline
- compact but readable layout
- explicit semantics instead of defaults

## If local examples are available
- Prefer reading an existing figure script first and matching its layout and export conventions.
- Prefer using a current project tutorial or example as a visual target when one exists.
- Do not assume any particular repo example file is present when this skill is shared on its own.
