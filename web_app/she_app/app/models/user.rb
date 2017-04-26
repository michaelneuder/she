class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  PHONE_REGEX = /[0-9]{10}+\z/i
  validates :phone_number, presence: true, length: { equals: 10 },
                    format: { with: PHONE_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :twitter_handle, presence: true, length: { minimum: 1}
end
