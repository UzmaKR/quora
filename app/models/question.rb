class Question < ActiveRecord::Base
  attr_accessible :question, :user_id
  validates_presence_of :question
  validates_presence_of :user_id

  belongs_to :user
  # belongs_to :answer
  has_many :answers
  has_many :votes, as: :votable

  def best_answer
    Answer.find(self.answer_id) if self.answer_id
  end

  def best_answer=(answer)
    self.answer_id = answer.id
    self.save
  end

end
