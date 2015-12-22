function [ average ] = AverageXdays( stockdata, days )
 %calculates the moving average over the last X days 
 
 %use moving averages to set stop loss orders!!!
 %short term averages crossing long term averages = momentum change!
 %use moving average ribbon!
 
    if (length(stockdata) < days)
        display('Not possible');
        average = 'NaN';
    else
        average = zeros(length(stockdata),1);
        for i = days+1:1:length(stockdata)
            average(i) = mean(stockdata(i-days:i-1,5));
        end
    end
end

