function [  ] = plotStockAverage( stockdata, days )
    %plots the stock according to 'data' and calcualtes the 'days'
    %day averages and plots them.
    plot(stockdata(:,1), AverageXdays(stockdata, days), 'DisplayName',...
        strcat(num2str(days), ' day average'));
    legend('-DynamicLegend');
    datetick('x', 'dd.mm.yyyy', 'keepticks');
    dcm_obj = datacursormode(figure(1));
    set(dcm_obj,'UpdateFcn',@CursorUpdateFunction);
end

