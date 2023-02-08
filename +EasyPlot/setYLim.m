function yLimOut = setYLim(all_axes,mode)
    if nargin<2
        mode = 'largest';
    end
    yLimOut = nan(1,2);

    if ~iscell(all_axes)
        if ~isnumeric(mode) || length(mode)~=2
            error('Wrong mode!')
        else
            yLimOut = mode;
        end
        set(all_axes,'YLim',yLimOut);
        return
    end

    if isnumeric(mode)
        if length(mode) == 1
            yLimOut = all_axes{mode}.YLim;
        elseif length(mode) == 2
            yLimOut = mode;
        else
            error('Wrong mode!');
        end
    elseif ischar(mode) || isstring(mode)
        if strcmpi(mode,'largest')
            yLimLeft = Inf;
            yLimRight = -Inf;
            for k = 1:length(all_axes)
                left = all_axes{k}.YLim(1);
                right = all_axes{k}.YLim(2);
                yLimLeft = min(yLimLeft,left);
                yLimRight = max(yLimRight,right);
            end
            yLimOut = [yLimLeft, yLimRight];
        elseif strcmpi(mode,'largestOne')
            diffOut = 0;
            for k = 1:length(all_axes)
                if diffOut < diff(all_axes{k}.YLim)
                    yLimOut = all_axes{k}.YLim;
                    diffOut = diff(all_axes{k}.YLim);
                end
            end
        else
            error('Wrong mode!');
        end
    end
    
    for k = 1:length(all_axes)
        set(all_axes{k},'YLim',yLimOut);
    end

end