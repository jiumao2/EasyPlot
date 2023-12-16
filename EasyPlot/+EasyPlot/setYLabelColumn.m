function setYLabelColumn(all_axes, label)
    for k = 1:length(all_axes)
        ylabel(all_axes{k},label);
    end
end