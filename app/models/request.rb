class Request < ApplicationRecord
  has_many :quotes

  validates_associated :quotes
end
