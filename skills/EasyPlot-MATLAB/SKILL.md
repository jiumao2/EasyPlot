---
name: easyplot-matlab
description: Build publication-ready MATLAB figures with EasyPlot using long linear scripts, layout-first panel construction, explicit scales and labels, and iterative readability refinement. Use when users ask to create, polish, export, or explain paper-quality MATLAB figures in a compact EasyPlot publication style.
---

# EasyPlot MATLAB

Use this skill when the task is to write or refine MATLAB figure code in a publication-ready EasyPlot style.

## Workspace Boundaries
- Work only inside the current workspace.
- Keep figure scripts and exports inside the project tree.
- Put finished figures in `Figure` unless the user explicitly requests another output folder.

Read [references/figure-workflow.md](references/figure-workflow.md) before writing or heavily revising a figure script.
Read [references/final-review.md](references/final-review.md) before calling a figure complete.

## Default Style
- Use EasyPlot as the figure and layout framework unless the user explicitly overrides it.
- Keep scripts long, linear, and top-to-bottom.
- Do not introduce helper or local functions by default.
- Use standard MATLAB drawing calls like `plot`, `scatter`, `imagesc`, `bar`, `histogram`, and `contour` only as marks on EasyPlot-managed axes when EasyPlot does not provide that plot type.
- Keep figures visible while authoring unless the user explicitly requests headless export.
- Use `FontSize` 7 as a strong default baseline for publication figures.
- Set limits, ticks, tick labels, labels, titles, and color limits explicitly.
- Reposition legends, colorbars, scalebars, and panel labels manually when needed to avoid overlap.

## Workflow
1. Inspect the current script, target figure, or example first.
- If no figure script exists, create one in the project root with a descriptive name such as `Fig01_example.m`.
- Create `Figure` when it is missing.

2. Start with a visible EasyPlot figure.
- Validate EasyPlot availability with `assert(~isempty(which('EasyPlot.figure')), 'EasyPlot not found on MATLAB path')`.
- Prefer `EasyPlot.figure`, `EasyPlot.axes`, `EasyPlot.createGridAxes`, and `EasyPlot.createAxesAgainstAxes`.

3. Build layout before plotting.
- Reserve enough room for labels, ticks, legends, colorbars, and scalebars.
- Store related axes in cell arrays when shared formatting or group movement will be useful.
- Use `EasyPlot.align`, `EasyPlot.place`, and `EasyPlot.move` for layout refinement.

4. Draw data on named EasyPlot axes.
- Keep plotting calls attached to explicit axes handles.
- Use MATLAB mark primitives only on those EasyPlot axes.
- Prefer clear line widths, marker sizes, and alpha values that remain readable after export.

5. Make panel semantics explicit.
- Set x/y/c limits deliberately.
- Set ticks and tick labels deliberately.
- Add axis labels, shared labels, and short titles only where they improve readability.
- Use shared-label helpers when they make a multi-panel figure cleaner.

6. Add interpretation aids selectively.
- Use `EasyPlot.legend`, `EasyPlot.colorbar`, `EasyPlot.scalebar`, and `EasyPlot.markAxes` only when they help the reader.
- Reposition them until they no longer collide with traces, labels, titles, or neighboring panels.

7. Export only after the layout is clean.
- Call `EasyPlot.cropFigure(fig)` near the end.
- Export both PNG and PDF unless the user explicitly requests otherwise.

8. Evaluate and refine until the figure is perfect.
- After every render, inspect axes positions, row and column intervals, label spacing, clipping, and whether any text overlaps other text or data.
- Check legends, colorbars, scalebars, panel labels, titles, axis labels, and tick labels individually.
- If anything is crowded, misaligned, clipped, or overlapping, adjust the layout and rerun.
- Keep iterating until the figure is publication-ready or the user explicitly stops the refinement loop.

## Reporting Rules
- Report the exact output paths for exported figures.
- Separate observed rendering issues from your interpretation of how to fix them.
- If the figure is still crowded, prefer layout refinement before changing font sizes.
