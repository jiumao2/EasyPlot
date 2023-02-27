function setXTicks(axes_all, ticks)
    if ~iscell(axes_all)
        xticks(axes_all, ticks);
        return
    end

    for k = 1:length(axes_all)
        xticks(axes_all{k}, ticks);
    end
end