class AddTradeDateToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :trade_date, :date
  end
end
