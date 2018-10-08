class RemoveTradeDayFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_column :pages, :trade_day, :string
  end
end
