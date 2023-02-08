function HideXAxis(axes_all)
    if iscell(axes_all)
        for k = 1:length(axes_all)
            axes_all{k}.XAxis.Visible = 'off';
        end
    else
        axes_all.XAxis.Visible = 'off';
    end
end