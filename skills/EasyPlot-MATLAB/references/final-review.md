# Final Review

Use this reference before declaring a figure complete.

## Check these items
- Axes positions are balanced and visually intentional.
- Row and column intervals are consistent or intentionally varied.
- No legends covering important data.
- No colorbar labels colliding with titles, shared labels, or neighboring panels.
- No clipped axis labels, titles, panel marks, or tick labels.
- No text overlapping other text, axes, or plotted data.
- No overlapping panels after cropping.
- Shared axes use consistent limits and ticks.
- Typography is small but still readable.
- Line widths and marker sizes are readable at export size.
- Annotations are present only when they improve interpretation.
- Exported PNG and PDF both exist in `Figure`.

## Typical fixes
- Move panels with `EasyPlot.move` before changing font sizes.
- Use `EasyPlot.align` and `EasyPlot.place` to restore panel relationships after moving one axis.
- Increase row or column gaps when labels, titles, legends, or colorbars are crowded.
- Give legends dedicated empty space when possible.
- Shorten titles or labels only when layout refinement is not enough.
- Rerun and inspect again after every adjustment until nothing important overlaps or looks unbalanced.
