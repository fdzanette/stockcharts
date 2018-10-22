class Strategy < ApplicationRecord

  def set_strategy1(stock, amount) #cruzamento de mme de 5 periodos com o preço de fechamento
    expo_average = []
    row = count = paid = sold = profit = 0
    buy = false
    stock.trade_dates.reverse.each do |date|
      if row > 5
        if date.close > expo_average.ema(row - 1, 5)
          if buy == false
            count += 1
            buy = true
            paid = date.close
            puts "Media: #{expo_average.ema(row - 1, 5).round(2)}"
            puts "Comprou -- Preço: #{paid} -- Data: #{date.day}"
            puts "----------"
          end
        elsif date.close < expo_average.ema(row -1, 5)
          if buy == true
            buy = false
            sold = date.close
            profit += (sold - paid) * amount
            puts "Media: #{expo_average.ema(row - 1, 5).round(2)}"
            puts "Vendeu -- Preço: #{sold} -- Data: #{date.day}"
            puts "Lucro na operação: #{sold - paid}"
            puts "Lucro acumulado: #{profit}"
            puts "------------------------------"
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    puts "Total de operações: #{count}"
    puts "---END---"
  end

def set_strategy2(stock, amount) #cruzamento de mme de 5 periodos com o preço de fechamento
    expo_average = []
    row = count = paid = sold = profit = 0
    buy = false
    stock.trade_dates.reverse.each do |date|
      if row > 13
        if expo_average.ema(row - 1, 5) > expo_average.ema(row - 1, 13)
          if buy == false
            count += 1
            buy = true
            paid = date.close
            puts "Media: #{expo_average.ema(row - 1, 5).round(2)}"
            puts "Comprou -- Preço: #{paid} -- Data: #{date.day}"
            puts "----------"
          end
        elsif expo_average.ema(row - 1, 5) < expo_average.ema(row - 1, 13)
          if buy == true
            buy = false
            sold = date.close
            profit += (sold - paid) * amount
            puts "Media: #{expo_average.ema(row - 1, 5).round(2)}"
            puts "Vendeu -- Preço: #{sold} -- Data: #{date.day}"
            puts "Lucro na operação: #{sold - paid}"
            puts "Lucro acumulado: #{profit}"
            puts "------------------------------"
          end
        end
      end
    expo_average << date.close
    row += 1
    end
    puts "Total de operações: #{count}"
    puts "---END---"
  end


end
