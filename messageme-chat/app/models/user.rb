class User < ApplicationRecord
  attr_accessor :attribute1 ,:attribute2
  validates :username, presence: true, length: { minimum: 3, maximum: 15 },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates_confirmation_of:password 

  has_many :messages
  has_secure_password
end
