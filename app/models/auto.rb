class Auto < ApplicationRecord

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :trim, presence: true
  validates :mileage, presence: true


  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :quotes, through: :requests
  has_many :appointments, through: :quotes

end
