class Appointment < ApplicationRecord
  belongs_to :quote
  belongs_to :request
  belongs_to :user
  validates :selected_appointment, presence: true
end
