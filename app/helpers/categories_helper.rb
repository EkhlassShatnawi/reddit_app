module CategoriesHelper
  def up_votes
    @up_votes = Vote.where(:vote_rate => 'up' ).where( :votable_id => post.id ).count 
  end

  def down_votes
    @down_votes = Vote.where(:vote_rate => 'down' ).where( :votable_id => post.id ).count 
  end
end