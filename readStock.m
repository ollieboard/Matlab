function [ stockdata ] = readStock( stock, startdate, enddate )
 %reads stock from startdate to enddate and flips the array
 
 stockdata = fetch(yahoo, stock, startdate, enddate);
 stockdata = flipud(stockdata);
end

