# frozen_string_literal: true

class Position < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  validates :quantity, :purchase_price, :purchase_date, presence: true

  def self.add_or_update_position(portfolio_id, stock_id, quantity, purchase_price, purchase_date)
    position = find_or_initialize_by(portfolio_id: portfolio_id, stock_id: stock_id)

    quantity = quantity.to_i
    purchase_price = purchase_price.to_f

    if position.new_record?
      position.quantity = quantity
      position.purchase_price = purchase_price
      position.purchase_date = purchase_date
    else
      position.quantity += quantity
      position.purchase_date = [position.purchase_date, purchase_date.to_date].min if purchase_date
    end

    position.save!
    position
  end

  def value
    return 0 if quantity.nil? || stock.current_price.nil?

    quantity * stock.current_price
  end
end
