class Question < ActiveRecord::Base
  attr_accessible :question, :user_id
  validates_presence_of :question
  validates_presence_of :user_id

  belongs_to :user
  belongs_to :answer
  has_many :answers
  has_many :votes, as: :votable

  def best_answer
    self.answer    
  end

  def best_answer=(answer)
    self.answer = answer
    self.save
  end

end
