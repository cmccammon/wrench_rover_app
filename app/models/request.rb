class Request < ApplicationRecord
  has_many :quotes, dependent: :destroy
  belongs_to :user
  
  validates_associated :quotes
end
