class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.decimal :quantity
      t.decimal :purchase_price
      t.date :purchase_date
      t.references :portfolio, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
