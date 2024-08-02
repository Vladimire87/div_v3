# frozen_string_literal: true

class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :positions

  validates :name, presence: true

  def total_value
    positions.joins(:stock).sum('positions.quantity * stocks.current_price')
  end
end
