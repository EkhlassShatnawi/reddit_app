class Category < ActiveRecord::Base
  has_many :posts, inverse_of: :category
  has_many :categories, foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Category'

  validates :title, presence: true, uniqueness: true
  after_destroy :log_destroy_action
 
  def log_destroy_action
    puts 'Category destroyed'
  end
end
