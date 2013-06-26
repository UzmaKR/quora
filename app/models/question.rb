class Question < ActiveRecord::Base
  attr_accessible :question
  validates_presence_of :question

end
