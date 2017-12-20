class Request < ApplicationRecord
  before_validation :format_service
  belongs_to :user
  belongs_to :auto
  has_many :quotes, dependent: :destroy
  has_many :appointments, through: :quotes

  validates :service, presence: true

  serialize :service

  validates_associated :quotes

  def self.no_appointments
    left_outer_joins(:appointments).where(appointments: {id: nil})
  end
  def self.no_completed_appointments
    left_outer_joins(:appointments).where(appointments: {completed: false})
  end
  def self.completed_appointments
    left_outer_joins(:appointments).where(appointments: {completed: true})
  end

  def format_service
    self.service = service.compact.reject(&:empty?)
  end

  def display_as_sentence
    self.compact.reject(&:empty?).to_sentence
  end

  def self.with_no_quotes_by(service_center)
  joins(:quotes).
    where.not(quotes: { service_center_id: service_center.id })
  end

end
