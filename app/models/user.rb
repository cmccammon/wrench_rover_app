class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :zipcode,     presence: true


  has_many :autos
  has_many :requests, through: :autos
  has_many :quotes, through: :requests
  has_many :appointments, through: :quotes

  accepts_nested_attributes_for :autos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :requests, allow_destroy: true
end






class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :zipcode, :email])
  end
end
