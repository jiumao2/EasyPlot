function set(axes_all, varargin)
    if ~iscell(axes_all)
        for k = 1:2:size(varargin,2)
            switch varargin{k}
                case 'XAxisVisible'
                    axes_all.XAxis.Visible = varargin{k+1};
                case 'YAxisVisible'
                    axes_all.YAxis.Visible = varargin{k+1};   
                otherwise
                    set(axes_all, varargin{k}, varargin{k+1});e
            end
        end
        return
    end
    
    for k = 1:2:size(varargin,2)
        for i_row = 1:size(axes_all,1)
            for i_col = 1:size(axes_all,2)
                switch varargin{k}
                    case 'XAxisVisible'
                        axes_all{i_row,i_col}.XAxis.Visible = varargin{k+1};
                    case 'YAxisVisible'
                        axes_all{i_row,i_col}.YAxis.Visible = varargin{k+1};   
                    otherwise
                        set(axes_all{i_row,i_col}, varargin{k}, varargin{k+1});
                end
            end
        end
    end
end