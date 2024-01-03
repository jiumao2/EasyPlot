function place(axes_all, reference, location)
    if iscell(reference)
        idx = EasyPlot.Utils.getSideAxes(reference, location);
        reference = reference{idx};
    end

    top = -Inf;
    bottom = Inf;
    left = Inf;
    right = -Inf;
    for k = 1:size(axes_all, 1)
        for j = 1:size(axes_all, 2)
            top_this = axes_all{k,j}.Position(2)+axes_all{k,j}.Position(4)+axes_all{k,j}.UserData.MarginTop;
            bottom_this = axes_all{k,j}.Position(2)-axes_all{k,j}.UserData.MarginBottom;
            left_this = axes_all{k,j}.Position(1)-axes_all{k,j}.UserData.MarginLeft;
            right_this = axes_all{k,j}.Position(1)+axes_all{k,j}.Position(3)+axes_all{k,j}.UserData.MarginRight;
            
            top = max(top,top_this);
            bottom = min(bottom,bottom_this);
            left = min(left,left_this);
            right = max(right,right_this);
        end
    end

    if strcmpi(location, 'left')
        out = reference.Position(1)-reference.UserData.MarginLeft;

        dx = out-right;
        dy = 0;
    elseif strcmpi(location, 'right')
        out = reference.Position(1)+reference.Position(3)+reference.UserData.MarginRight;

        dx = out-left;
        dy = 0;
    elseif strcmpi(location, 'top')
        out = reference.Position(2)+reference.Position(4)+reference.UserData.MarginTop;

        dx = 0;
        dy = out-bottom;
    elseif strcmpi(location, 'bottom')
        out = reference.Position(2)-reference.UserData.MarginBottom;

        dx = 0;
        dy = out-top;
    end
    
    EasyPlot.move(axes_all, 'dx', dx, 'dy', dy);
end