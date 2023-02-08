function setXLabelRow(all_axes, label)
    for k = 1:length(all_axes)
        xlabel(all_axes{k},label);
    end
end