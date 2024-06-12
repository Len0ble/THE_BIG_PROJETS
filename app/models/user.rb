class User < ApplicationRecord
  belongs_to :city
  has_many :potins

  before_save { self.email = email.downcase }
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
