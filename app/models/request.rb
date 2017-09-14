class Request < ApplicationRecord
  belongs_to :user
  belongs_to :auto
  has_many :quotes, dependent: :destroy
  has_many :request_services, dependent: :destroy
  has_many :appointments, through: :quotes

  validates :service, presence: true

  serialize :service
  validates_associated :quotes


end
