class Appointment < ApplicationRecord
  belongs_to :quote
  validates :selected_appointment, presence: true
end
