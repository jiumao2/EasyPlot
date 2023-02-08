function HideYAxis(axes_all)
    if iscell(axes_all)
        for k = 1:length(axes_all)
            axes_all{k}.YAxis.Visible = 'off';
        end
    else
        axes_all.YAxis.Visible = 'off';
    end
end