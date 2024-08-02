# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.decimal :current_price

      t.timestamps
    end
  end
end
