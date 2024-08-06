class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
  belongs_to :stock

  validates :date, :shares, :price_per_share, :user_id, :portfolio_id, :stock_id, presence: true

  after_save :update_or_create_holding

  private

  def update_or_create_holding
    holding = Holding.find_or_initialize_by(portfolio_id: portfolio_id, stock_id: stock_id)
    holding.quantity ||= 0
    holding.quantity += shares
    holding.save!
  end

end
