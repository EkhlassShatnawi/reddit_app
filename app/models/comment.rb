class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true
  has_many :votes, as: :votable
end
