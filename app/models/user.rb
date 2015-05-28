class User < ActiveRecord::Base
  has_many :keys
  has_many:keychanges
  validates :phone_number, presence: true, uniqueness: true
  
  has_secure_password
  # validates :password, length: { minimum: 6 }
end
