class AddAverage1ToTradeDates < ActiveRecord::Migration[5.1]
  def change
    add_column :trade_dates, :Average1, :decimal
  end
end
