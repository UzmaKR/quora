class Answer < ActiveRecord::Base
  attr_accessible :answer
  validates_presence_of :answer

  belongs_to :question
  has_many :votes, as: :votable
  
end
