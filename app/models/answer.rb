class Answer < ActiveRecord::Base
  attr_accessible :answer, :user_id, :question_id
  validates_presence_of :answer

  belongs_to :question
  has_many :votes, as: :votable

  belongs_to :user
end
