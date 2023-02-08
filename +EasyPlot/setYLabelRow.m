function setYLabelRow(all_axes, label)
    idx_leftmost = EasyPlot.getSideAxes(all_axes,'left');
    ylabel(all_axes{idx_leftmost},label);
end