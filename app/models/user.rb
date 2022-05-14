class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ROLE = ['nanny','parents']
  has_many :bookings
  has_many :service_nannies, through: :bookings
  has_one_attached :photo
end
