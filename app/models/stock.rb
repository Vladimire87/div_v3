# frozen_string_literal: true

class Stock < ApplicationRecord
  has_many :holdings
  has_many :transactions

  validates :symbol, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
