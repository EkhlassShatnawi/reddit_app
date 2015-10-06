class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, inverse_of: :post
  validates :description, presence: true
  has_many :votes, as: :votable
end
