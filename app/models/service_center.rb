class ServiceCenter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :first_name,          presence: true
validates :last_name,           presence: true
validates :service_center_name, presence: true
validates :zipcode,             presence: true
validates :address,             presence: true
validates :city,                presence: true
validates :state,               presence: true
validates :zipcode,             presence: true
# validates :phone_number,        presence: true


has_many :quotes

end

class ServiceCenter::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :service_center_name, :address, :zipcode, :city, :state, :phone_number, :email])
  end
end
