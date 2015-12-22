function [ max_earning, max_evaluation, bestDays ] =...
    evaluateStockExpAverage( stockdata, min_days, max_days )
    %evaluates the stocks earning potential according to moving average
    %buy/sell in min to max days. 
    
    %max_earning gives buydate - value - selldate - value - percentage
    %max_evaluation gives best overall win/loss percentage
    %bestDays gives the number of days for the moving average that gives
    %the max_evaluation
    
    %initialize maximum evaluation:
    max_evaluation = 0;
    
    %calculate moving average earnings for number of days from min_days to
    %max_days:
    for days = min_days:1:max_days
        j = 1; %counter for buy/sell
        bought = 0;
        
        %first average is regular average:
        average = mean(stockdata(1:days,5));
        %for all following, calculate exponential moving average:
        alpha = 2/(1+days); %smoothing factor
        %go through moving average, buy when stock is above moving average,
        %sell when below:
        for i = days+2:1:length(stockdata)
            %calculate exponential moving average of previous data:
            average = stockdata(i,5)*alpha + average * (1-alpha);
            %buy if stockvalue is above average & not bought:
            if (stockdata(i,5) > average && ~bought)
                bought = 1;
                earning(j,1) = stockdata(i,1);
                earning(j,2) = stockdata(i,5);
            %sell if stockvalue is below average % bought:
            elseif (stockdata(i,5) < average && bought)
                bought = 0;
                earning(j,3) = stockdata(i,1);
                earning(j,4) = stockdata(i,5);
                j = j + 1;
            end
            %if still bought in the end, note last price
            if(bought)
                earning(j,3) = stockdata(i,1);
                earning(j,4) = stockdata(i,5);
            end
        end
        %evaluate earnings as percentage:
        [rows, ~] = size(earning);
        for i = 1: rows
            earning(i,5) = (earning(i,4)-earning(i,2))/earning(i,2)*100;
        end
        evaluation = sum(earning(:,5));
        
        %check if current number of days is optimum for stock earnings:
        if(evaluation > max_evaluation)
            max_earning = earning;
            max_evaluation = evaluation;
            bestDays = days;
        end
    end

end

