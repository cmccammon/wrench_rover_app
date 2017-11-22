class Quote < ApplicationRecord
  belongs_to :request
  belongs_to :service_center

  has_one :appointment, dependent: :destroy

  validates :cost, presence: true
  validates :cost, numericality: true
  validates :appointment1,  presence: true
  validates :appointment2,  presence: true
  validates :appointment3,  presence: true
end
