function cLimOut = setCLim(all_axes,mode)
    if nargin<2
        mode = 'largest';
    end
    cLimOut = nan(1,2);

    if ~iscell(all_axes)
        if ~isnumeric(mode) || length(mode)~=2
            error('Wrong mode!')
        else
            cLimOut = mode;
        end
        set(all_axes,'CLim',cLimOut);
        return
    end    

    if isnumeric(mode)
        if length(mode) == 1
            cLimOut = all_axes{mode}.CLim;
        elseif length(mode) == 2
            cLimOut = mode;
        else
            error('Wrong mode!');
        end
    elseif ischar(mode) || isstring(mode)
        if strcmpi(mode,'largest')
            cLimLeft = Inf;
            cLimRight = -Inf;
            for k = 1:length(all_axes)
                left = all_axes{k}.CLim(1);
                right = all_axes{k}.CLim(2);
                cLimLeft = min(cLimLeft,left);
                cLimRight = max(cLimRight,right);
            end
            cLimOut = [cLimLeft, cLimRight];
        elseif strcmpi(mode,'largestOne')
            diffOut = 0;
            for k = 1:length(all_axes)
                if diffOut < diff(all_axes{k}.CLim)
                    cLimOut = all_axes{k}.CLim;
                    diffOut = diff(all_axes{k}.CLim);
                end
            end
        else
            error('Wrong mode!');
        end
    end
    
    for k = 1:length(all_axes)
        set(all_axes{k},'CLim',cLimOut);
    end

end