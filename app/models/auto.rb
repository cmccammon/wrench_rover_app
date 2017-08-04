class Auto < ApplicationRecord
  
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :trim, presence: true
  validates :mileage, presence: true



  has_many :requests, dependent: :destroy
  belongs_to :user
end
