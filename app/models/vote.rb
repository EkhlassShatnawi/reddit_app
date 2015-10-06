class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  validates :user_id, uniqueness: { message: 'user already vote' }
end
