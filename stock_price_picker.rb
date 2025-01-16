def stock_picker(stock_prices)
  g_profit = 0 #great profit
  best_days ="" #its today :)
  stock_prices.each_with_index do | buy_price, buy_day|
    stock_prices.each_with_index do |sell_price, sell_day |
      profit = sell_price - buy_price

      if profit > g_profit && buy_day < sell_day
        g_profit = profit
        best_days = [buy_day, sell_day]
      end 
    end
  end
  return best_days
end

stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts stock_picker(stock_prices).inspect
