class User < ActiveRecord::Base
  has_many :keys
  validates :phone_number, presence: true

end
