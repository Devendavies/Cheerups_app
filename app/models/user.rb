class User < ActiveRecord::Base

  # Links security
  has_secure_password

  has_many :cheerups
  has_many :comments # through: cheerups

  # Password and Email Parameters Check
  validates :email, presence: true
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, presence: true
  validates :password, confirmation:true

end
