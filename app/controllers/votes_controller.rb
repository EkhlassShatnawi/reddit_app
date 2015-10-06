class VotesController < ApplicationController
  

  def new
    @context = context
    @vote = @context.votes.new
  end

  def create
    if params[:post_id]
      @votable = Post.find(params[:post_id])
      @category = Category.find(@votable.category_id)
    elsif params[:comment_id]
      @votable = Comment.find(params[:comment_id])
      @post = Post.find(@votable.post_id)
      @category = Category.find(@post.category_id)
    end
      
    @vote = @votable.votes.create(vote_params)
    
    if @vote.votable_type == 'Comment'
      redirect_to category_post_path(@category, @post)
    else 
      redirect_to category_path(@category)
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:vote_rate)
    end
end
