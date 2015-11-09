class User < ActiveRecord::Base

  # Links security
  has_secure_password

  has_many :cheerups
  has_many :comments # through: cheerups

  # Password and Email Parameters Check
  validates :name, :presence => { message: "Must enter a name for the account" }

  validates :password, :length => { in: 6..20, message: "password has to be between 6 and 20 characters" },
                       :presence => { message: "password can't be blank" }
  validates :password, confirmation:true
  validates :password_confirmation, presence: true

  validates :email, presence: true,
                    :uniqueness => { message: "email is already used" }
end
