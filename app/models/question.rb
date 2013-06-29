class Question < ActiveRecord::Base
  attr_accessible :question, :user_id
  validates_presence_of :question
  validates_presence_of :user_id

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  def self.trending
    self.all.sort_by(&:votes_time)
  end

  def self.votes_time
    Vote.find(:all, :conditions => "created_at >= (#{DateTime.now} - #{1.hour}) AND votable_type = 'Question'")
  end

  def self.highest_rated
    self.all.sort_by(&:score).reverse
  end
end
