class RequestService < ApplicationRecord
  belongs_to :request
  belongs_to :service
end
