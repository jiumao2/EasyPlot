function setXLabelColumn(all_axes, label)
    idx_bottom = EasyPlot.Utils.getSideAxes(all_axes,'bottom');
    xlabel(all_axes{idx_bottom},label);
end