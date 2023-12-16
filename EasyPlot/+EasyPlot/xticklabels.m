function xticklabels(all_axes, labels)
    % Check if labels are numeric
    if isnumeric(labels)
        labels_out = cell(1, length(labels));
        for k = 1:length(labels_out)
            labels_out{k} = num2str(labels(k));
        end
    elseif iscell(labels) && isnumeric(labels{1})
        labels_out = cell(1, length(labels));
        for k = 1:length(labels_out)
            labels_out{k} = num2str(labels{k});
        end
    else
        labels_out = labels;
    end

    if ~iscell(all_axes)
        xticklabels(all_axes, labels_out);
        return
    end

    for k = 1:size(all_axes, 1)
        for j = 1:size(all_axes, 2)
            xticklabels(all_axes{k,j}, labels_out);
        end
    end
end