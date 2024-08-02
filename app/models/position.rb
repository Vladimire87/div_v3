class Position < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  validates :quantity, :purchase_price, :purchase_date, presence: true
end
