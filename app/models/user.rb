class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :registered_applications

  before_save { self.email = email.downcase }
  # before_update { authenticate(:password) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # this still allows invalid addresses that contain consecutive dots...

  validates(:name, presence: true, length: {maximum: 50})
  validates(:email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false})

  # `allow_nil: true` is OK because has_secure_password
  # includes a separate presence validation that
  # specifically catches `nil` passwords upon login
  validates(:password, presence: true, length: {minimum: 6},
            allow_nil: true)

  has_secure_password # an existing ActiveModel method

  # returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # returns a random token of 22 characters in length
  # (64 possibilities for each character)
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    # generate & associate a remember token with the user instance
    self.remember_token = User.new_token
    # save the corresponding remember digest to the database
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if the given token matches the digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(self.remember_digest).is_password?(remember_token)
    # (this local remember_token variable is not the same as the :remember_token accessor)
  end

  # forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
