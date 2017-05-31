class Request < ApplicationRecord
  has_many :quotes, dependent: :destroy
  belongs_to :user
  belongs_to :auto

  validates_associated :quotes
end
