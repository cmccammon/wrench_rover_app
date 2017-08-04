class Request < ApplicationRecord
  has_many :quotes, dependent: :destroy
  has_many :request_services, dependent: :destroy
  belongs_to :user
  belongs_to :auto

  validates :service, presence: true

  serialize :service
  validates_associated :quotes


end
