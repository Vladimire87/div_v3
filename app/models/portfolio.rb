# frozen_string_literal: true

class Portfolio < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
