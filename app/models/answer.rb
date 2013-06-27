class Answer < ActiveRecord::Base
  attr_accessible :answer
  validates_presence_of :answer

  belongs_to :question
end
