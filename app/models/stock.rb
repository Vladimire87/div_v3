class Stock < ApplicationRecord
  has_many :positions

  validates :symbol, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
