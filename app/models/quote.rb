class Quote < ApplicationRecord
  belongs_to :request
  belongs_to :service_center

  validates :cost, presence: true
  validates :cost, numericality: true
end
