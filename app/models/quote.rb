class Quote < ApplicationRecord
  belongs_to :request
  belongs_to :service_center
  has_one :appointment

  validates :cost, presence: true
  validates :cost, numericality: true
end
