class Vote < ActiveRecord::Base
  attr_accessible :value, :votable_id, :votable_type, :user_id

  belongs_to :votable, polymorphic: true

end
