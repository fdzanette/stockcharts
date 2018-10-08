class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :date
      t.decimal :price

      t.timestamps
    end
  end
end