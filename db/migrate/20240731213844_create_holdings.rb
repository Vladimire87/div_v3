# frozen_string_literal: true

class CreateHoldings < ActiveRecord::Migration[7.1]
  def change
    create_table :holdings do |t|
      t.decimal :quantity
      t.decimal :average_cost
      t.references :portfolio, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
