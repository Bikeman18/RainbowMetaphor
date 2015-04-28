class Key < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true, :uniqueness => {:scope => :mac } 
  validates :admin_id, presence: true
  validates :mac, presence: true 
  validates :passphrase, presence: true
end
