class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :autos
  has_many :requests, through: :autos
  accepts_nested_attributes_for :autos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :requests, allow_destroy: true


end
