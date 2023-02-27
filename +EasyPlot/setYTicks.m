function setYTicks(axes_all, ticks)
    if ~iscell(axes_all)
        yticks(axes_all, ticks);
        return
    end

    for k = 1:length(axes_all)
        yticks(axes_all{k}, ticks);
    end
end