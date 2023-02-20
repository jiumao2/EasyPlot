function rasterPlot(spike_times, varargin)
    % spike_times: 1xn cell
    tStart = 0;
    tEnd = Inf;
    Width = 5;
    Height = 5;

    if nargin <1
        spike_times = {rand(1,10),rand(1,50),rand(1,20),rand(1,30),rand(1,70)};
    elseif nargin > 1
        for k = 1:2:size(varargin,2)
            if strcmpi(varargin{k},'tStart')
                tStart = varargin{k+1};
            elseif strcmpi(varargin{k},'tEnd')
                tEnd = varargin{k+1};
            elseif strcmpi(varargin{k},'Width')
                Width = varargin{k+1};
            elseif strcmpi(varargin{k},'Height')
                Height = varargin{k+1};
            else
                error('Wrong argument!')
            end
        end
    end

    fig = EasyPlot.figure("Height",50,'Width',50);
    ax = EasyPlot.axes(fig,...
        "Height",Height,...
        'Width',Width,...
        'MarginBottom',0.8,...
        'MarginLeft',0.8);    

    x_all = [];
    y_all = [];
    for k = 1:length(spike_times)
        spike_times{k} = spike_times{k}(spike_times{k}>=tStart & spike_times{k}<=tEnd);
        if ~isempty(spike_times{k})
            numspikes=length(spike_times{k});
            x=ones(1,3*numspikes)*nan;
            y=ones(1,3*numspikes)*nan;
    
            y(1:3:3*numspikes)=-0.5+k;
            y(2:3:3*numspikes)=y(1:3:3*numspikes)+1;
            x(1:3:3*numspikes)=spike_times{k};
            x(2:3:3*numspikes)=spike_times{k}; 

            x_all = [x_all, x];
            y_all = [y_all, y];
        end
    end
    plot(ax,x_all,y_all,'k-')
    xlabel(ax,'time')
    ylabel(ax,'Neurons')
    EasyPlot.setYLim(ax, [0.5,length(spike_times)+0.5]);
    yticks(ax,[1,length(spike_times)])

    EasyPlot.cropFigure(fig)
end