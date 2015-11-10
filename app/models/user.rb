class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # this still allows invalid addresses that contain consecutive dots...

  validates(:name, presence: true, length: {maximum: 50})
  validates(:email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false})

  validates(:password, presence: true, length: {minimum: 6})

  has_secure_password # an existing ActiveModel method
end
