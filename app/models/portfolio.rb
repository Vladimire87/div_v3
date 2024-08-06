# frozen_string_literal: true

class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :holdings, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :stocks, through: :holdings
  validates :name, presence: true

  def total_value
    holdings.joins(:stock).sum('holdings.quantity * stocks.current_price')
  end
end
