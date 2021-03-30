class User < ApplicationRecord
  has_secure_password
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, uniqueness: true, length: { minimum: 2 }
  validates :username, uniqueness: true, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }
end
