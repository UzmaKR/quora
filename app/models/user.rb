class User < ActiveRecord::Base
  has_secure_password
  # attr_accessible :title, :body
  attr_accessible :username, :password, :password_confirmation, :email
  validates :email, presence: true

end
