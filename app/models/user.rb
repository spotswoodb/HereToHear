class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  # validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, :username, uniqueness: true, presence: true, length: { minimum: 2 }
  # validates :username, uniqueness: true, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { in: 6..15 }
  has_secure_password
end
