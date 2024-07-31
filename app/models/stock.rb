class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
