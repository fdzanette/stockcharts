class CreateTradeDates < ActiveRecord::Migration[5.1]
  def change
    create_table :trade_dates do |t|
      t.date :day
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.decimal :close
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
