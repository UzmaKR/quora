class User < ActiveRecord::Base
  has_many :questions
  has_secure_password
  # attr_accessible :title, :body
  attr_accessible :username, :password, :password_confirmation, :email
  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email

  before_create :downcase_email

  def vote!(resource, value)
    resource.score += value.to_i
    resource.save
  end


  private 

  def downcase_email
    self.email.downcase!
  end

end
