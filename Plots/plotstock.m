function [  ] = plotstock( data )
    plot(data(:,1), data(:,5), 'DisplayName', 'Stock data');
    grid on;
    datetick('x', 'dd.mm.yyyy', 'keepticks');
    dcm_obj = datacursormode(figure(1));
    set(dcm_obj,'UpdateFcn',@CursorUpdateFunction);
    
    xlabel('time');
    ylabel('Stock price in $');
    legend('-DynamicLegend');
end

