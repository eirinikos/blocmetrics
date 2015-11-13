class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  # VALID_URL_REGEX =

  validates(:name, presence: true, length: {maximum: 50},
            uniqueness: {case_sensitive: false})

  validates(:url, presence: true, length: {minimum: 3},
            uniqueness: {case_sensitive: false})
end
