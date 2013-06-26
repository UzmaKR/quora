class User < ActiveRecord::Base
  has_secure_password
  # attr_accessible :title, :body
  attr_accessible :username, :password, :password_confirmation, :email
  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email

  before_create :downcase_email


  private 

  def downcase_email
    self.email.downcase!
  end

end
