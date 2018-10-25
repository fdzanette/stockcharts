class Strategy < ApplicationRecord

  def set_strategy1(stock, amount) #cruzamento de mme de 5 periodos com o preço de fechamento
    expo_average = []
    row = count = paid = sold = @profit = 0
    buy = false
    stock.trade_dates.each do |date|
      if row >= 5
        if date.close > expo_average.ema(row - 1, 5)
          if buy == false
            count += 1
            buy = true
            paid = date.close
          end
        elsif date.close < expo_average.ema(row -1, 5)
          if buy == true
            buy = false
            sold = date.close
            @profit += (sold - paid) * amount
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    @profit
  end

  def set_strategy2(stock, amount) #cruzamento de mme de 5 periodos com a media de 13
    expo_average = []
    row = count = paid = sold = @profit = 0
    buy = false
    stock.trade_dates.each do |date|
      if row >= 13
        if expo_average.ema(row - 1, 5) > expo_average.ema(row - 1, 13)
          if buy == false
            count += 1
            buy = true
            paid = date.close
          end
        elsif expo_average.ema(row - 1, 5) < expo_average.ema(row - 1, 13)
          if buy == true
            buy = false
            sold = date.close
            @profit += (sold - paid) * amount
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    @profit
  end

  def set_strategy3(stock, amount) #cruzamento de mme de 5 periodos com 21 na compra. venda no cruzamento de 5 e 8.
    expo_average = []
    row = count = paid = sold = @profit = 0
    buy = false
    stock.trade_dates.each do |date|
      if row >= 21
        if expo_average.ema(row - 1, 5) > expo_average.ema(row - 1, 21) && buy == false
            count += 1
            buy = true
            paid = date.close
        elsif expo_average.ema(row - 1, 5) < expo_average.ema(row - 1, 8)
          if buy == true
            buy = false
            sold = date.close
            @profit += (sold - paid) * amount
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    @profit
  end

  def set_strategy4(stock, amount) #cruzamento de mme de 5 periodos com 21 na compra. venda no cruzamento do close com mme 5.
    expo_average = []
    row = count = paid = sold = @profit = 0
    buy = false
    stock.trade_dates.each do |date|
      if row >= 21
        if expo_average.ema(row - 1, 5) > expo_average.ema(row - 1, 21) && buy == false
            count += 1
            buy = true
            paid = date.close
        elsif date.close < expo_average.ema(row -1, 5)
          if buy == true
            buy = false
            sold = date.close
            @profit += (sold - paid) * amount
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    @profit
  end

  def set_strategy5(stock, amount) #compra a qualquer preço. venda a 6% de lucro ou stop a 2,5%
    expo_average = []
    count = paid = sold = @profit = 0
    buy = false
    stock.trade_dates.each do |date|
        if buy == false
            count += 1
            buy = true
            paid = date.close
            puts "Comprou -- Preço: #{paid} -- Data: #{date.day}"
            puts "----------"
        elsif buy == true && (date.close >= 1.065 * paid || date.close <= paid * 0.98)
            buy = false
            sold = date.close
            @profit += (sold - paid) * amount
            puts "Vendeu -- Preço: #{sold} -- Data: #{date.day}"
            puts "----------"
        end
    expo_average << date.close
    end
    puts "Total de operações: #{count}"
    puts "Resultado: R$ #{@profit}"
    puts "---END---"
    @profit
  end
end
