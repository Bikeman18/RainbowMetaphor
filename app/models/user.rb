class User < ActiveRecord::Base
  has_many :keys
  validates :phone_number, presence: true
  validates :password, length: { minimum: 6 }    
end
