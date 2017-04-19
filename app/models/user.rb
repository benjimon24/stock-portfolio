class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}

  has_many :portfolios
  has_secure_password
end
