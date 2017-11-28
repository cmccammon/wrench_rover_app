class Appointment < ApplicationRecord
  belongs_to :quote
  belongs_to :request
  belongs_to :user
  belongs_to :service_center
  validates :selected_appointment, presence: true

def self.completed_true
  where(completed: "true")
end
def self.completed_false
  where(completed: "false")
end

end
