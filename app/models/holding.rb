# frozen_string_literal: true

class Holding < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock
  has_many :transactions, through: :portfolio

  validates :quantity, presence: true

  # def self.add_or_update_holding(portfolio_id, stock_id, quantity, purchase_price, purchase_date)
  #   holding = find_or_initialize_by(portfolio_id: portfolio_id, stock_id: stock_id)

  #   quantity = quantity.to_i
  #   purchase_price = purchase_price.to_f

  #   if holding.new_record?
  #     holding.quantity = quantity
  #     holding.purchase_price = purchase_price
  #     holding.purchase_date = purchase_date
  #   else
  #     holding.quantity += quantity
  #   end

  #   holding.save!
  #   holding
  # end

  def market_value
    return 0 if quantity.nil? || stock.current_price.nil?

    quantity * stock.current_price
  end

  # def update_quantity
  #   total_shares = transactions.where(stock_id: stock_id).sum(:shares)
  #   update(quantity: total_shares)
  # end

end
