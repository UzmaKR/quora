class Question < ActiveRecord::Base
  attr_accessible :question
  validates_presence_of :question

  belongs_to :user
  has_many :answers

end
