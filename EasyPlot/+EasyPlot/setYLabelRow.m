function setYLabelRow(all_axes, label)
    idx_leftmost = EasyPlot.Utils.getSideAxes(all_axes,'left');
    ylabel(all_axes{idx_leftmost},label);
end