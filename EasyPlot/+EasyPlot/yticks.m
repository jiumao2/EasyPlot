function yticks(all_axes, ticks)
    if ~iscell(all_axes)
        yticks(all_axes, ticks);
        return
    end

    for k = 1:size(all_axes, 1)
        for j = 1:size(all_axes, 2)
            yticks(all_axes{k,j}, ticks);
        end
    end
end