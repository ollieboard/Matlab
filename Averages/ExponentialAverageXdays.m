function [ average ] = ExponentialAverageXdays( stockdata, days )
 %calculates the exponential moving average over the last X days 

    if (length(stockdata) < days)
        display('Not possible');
        average = 'NaN';
    else
        average = zeros(length(stockdata),1);
        %first average is regular average:
        average(days+1) = mean(stockdata(1:days,5));
        %for all following, calculate exponential moving average:
        alpha = 2/(1+days); %smoothing factor
        for i = days+2:1:length(stockdata)
            average(i) = stockdata(i,5)*alpha + average(i-1) * (1-alpha);
        end
    end
end

