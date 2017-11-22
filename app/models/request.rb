class Request < ApplicationRecord
  belongs_to :user
  belongs_to :auto
  has_many :quotes, dependent: :destroy
  has_many :appointments, through: :quotes

  validates :service, presence: true

  serialize :service

  validates_associated :quotes

  def self.display_as_sentence
    compact.reject(&:empty?).to_sentence
  end

  def self.with_no_quotes_by(service_center)
  joins(:quotes).
    where.not(quotes: { service_center_id: service_center.id })
  end

end
