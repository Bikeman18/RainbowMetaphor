class User < ActiveRecord::Base
  has_many :keys
  validates :phone_number, presence: true, uniqueness: true
  
  has_secure_password
  validates :password, length: { minimum: 6 },confirmation: true
  validates :password_confirmation, presence: true
end
