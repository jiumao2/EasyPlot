function set(axes_all, varargin)
%SET Set properties on one or multiple axes with EasyPlot margin support.
% Syntax:
%   EasyPlot.set(axesAll, Name, Value, ...)
% Inputs:
%   axesAll: Axes handle or cell array of axes.
%   Name-Value pairs: standard axes properties and EasyPlot margin properties.
% Outputs:
%   None.
% Example:
%   EasyPlot.set({ax1, ax2}, 'MarginLeft', 0.8, 'FontSize', 9);
% See also: set, EasyPlot.axes, EasyPlot.setMargin
    if ~iscell(axes_all)
        for k = 1:2:size(varargin,2)
            switch varargin{k}
                case 'XAxisVisible'
                    axes_all.XAxis.Visible = varargin{k+1};
                case 'YAxisVisible'
                    axes_all.YAxis.Visible = varargin{k+1};   
                case 'ZAxisVisible'
                    axes_all.ZAxis.Visible = varargin{k+1}; 
                case 'MarginLeft'
                    axes_all.UserData.MarginLeft = varargin{k+1};
                case 'MarginRight'
                    axes_all.UserData.MarginRight = varargin{k+1};
                case 'MarginTop'
                    axes_all.UserData.MarginTop = varargin{k+1};
                case 'MarginBottom'
                    axes_all.UserData.MarginBottom = varargin{k+1};
                case 'Width'
                    axes_all.Position(3) = varargin{k+1};
                case 'Height'
                    axes_all.Position(4) = varargin{k+1};
                otherwise
                    set(axes_all, varargin{k}, varargin{k+1});
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
                    case 'ZAxisVisible'
                        axes_all{i_row,i_col}.ZAxis.Visible = varargin{k+1};  
                    case 'MarginLeft'
                        axes_all{i_row,i_col}.UserData.MarginLeft = varargin{k+1};
                    case 'MarginRight'
                        axes_all{i_row,i_col}.UserData.MarginRight = varargin{k+1};
                    case 'MarginTop'
                        axes_all{i_row,i_col}.UserData.MarginTop = varargin{k+1};
                    case 'MarginBottom'
                        axes_all{i_row,i_col}.UserData.MarginBottom = varargin{k+1};
                    case 'Width'
                        axes_all{i_row,i_col}.Position(3) = varargin{k+1};
                    case 'Height'
                        axes_all{i_row,i_col}.Position(4) = varargin{k+1};
                    otherwise
                        set(axes_all{i_row,i_col}, varargin{k}, varargin{k+1});
                end
            end
        end
    end
end
