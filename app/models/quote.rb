class Quote < ApplicationRecord
  belongs_to :request

  validates :cost, presence: true
  validates :cost, numericality: true
end
