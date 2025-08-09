stock_picker = [17,3,6,9,15,8,6,1,10]
#[1,4]  # for a profit of $15 - $3 == $12

def picker(stock_picker)
 temp_profit = 0 
 profit = ""
  for buy_rate in 0...stock_picker.length
    for sell_rate in (buy_rate+1)...stock_picker.length

        profit = stock_picker[sell_rate] - stock_picker[buy_rate]
        
        if profit > temp_profit
          temp_profit = profit
          best_prices = [buy_rate,sell_rate]
        end
    end
  end
  return best_prices
end

puts picker(stock_picker).inspect 