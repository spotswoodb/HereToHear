class User < ApplicationRecord
  validate :first_name_is_title_case
  validate :last_name_is_title_case


  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  # validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, :username, uniqueness: true, presence: true, length: { minimum: 2 }
  # validates :username, uniqueness: true, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { in: 6..15 }
  has_secure_password

  before_validation :make_title_case
  
  private

  def first_name_is_title_case
    if first_name.split.any?{|w| w[0].upcase != w[0]}
        errors.add(:first_name, "First name must be in Capitalized")
    end
  end
    
  def last_name_is_title_case 
      if last_name.split.any?{|w| w[0].upcase != w[0]}
          errors.add(:last_name, "Last name must be in Capitalized")
      end
  end

  def make_title_case
    self.first_name = self.first_name.titlecase
    self.last_name = self.last_name.titlecase
  end

end
