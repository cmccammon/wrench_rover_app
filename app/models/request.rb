class Request < ApplicationRecord
  has_many :quotes, dependent: :destroy
  belongs_to :user
  belongs_to :auto


  serialize :service
  validates_associated :quotes
end
