class Vote < ActiveRecord::Base
  attr_accessible :score

  belongs_to :votable, polymorphic: true

end
