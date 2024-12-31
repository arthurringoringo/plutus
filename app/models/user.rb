class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end
